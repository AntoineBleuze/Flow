import UIKit
import MapKit

/// Version améliorée du TransportMapViewController utilisant CoreData
class TransportMapViewControllerWithCoreData: UIViewController {
    
    private let mapView = MKMapView()
    private let persistence = TransportLinePersistence.shared
    private var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMapView()
        setupActivityIndicator()
        
        // Vérifie si besoin de migrer les données
        checkAndMigrateData()
    }
    
    // MARK: - Setup
    
    private func setupMapView() {
        view.addSubview(mapView)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.topAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        mapView.delegate = self
        
        // Centre sur Paris
        let parisCoordinate = CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522)
        let region = MKCoordinateRegion(
            center: parisCoordinate,
            latitudinalMeters: 15000,
            longitudinalMeters: 15000
        )
        mapView.setRegion(region, animated: false)
    }
    
    private func setupActivityIndicator() {
        activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(activityIndicator)
        
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    // MARK: - Data Management
    
    /// Vérifie si la base de données est peuplée, sinon lance la migration
    private func checkAndMigrateData() {
        if persistence.isDatabasePopulated() {
            print("✅ Base de données déjà peuplée")
            loadTransportLinesFromCoreData()
        } else {
            print("⚠️ Base de données vide, migration nécessaire")
            showMigrationAlert()
        }
    }
    
    /// Affiche une alerte pour demander la migration
    private func showMigrationAlert() {
        let alert = UIAlertController(
            title: "Première utilisation",
            message: "Les données des lignes de transport doivent être importées. Cela peut prendre quelques secondes.",
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "Importer", style: .default) { [weak self] _ in
            self?.performMigration()
        })
        
        alert.addAction(UIAlertAction(title: "Annuler", style: .cancel))
        
        present(alert, animated: true)
    }
    
    /// Effectue la migration depuis les fichiers GeoJSON
    private func performMigration() {
        activityIndicator.startAnimating()
        
        // Lance la migration en arrière-plan (les fichiers GeoJSON sont dans le bundle)
        persistence.migrateFromGeoJSON { [weak self] success in
            DispatchQueue.main.async {
                self?.activityIndicator.stopAnimating()
                
                if success {
                    self?.loadTransportLinesFromCoreData()
                } else {
                    self?.showError("Erreur lors de l'importation des données")
                }
            }
        }
    }
    
    /// Charge les lignes depuis CoreData et les affiche sur la carte
    private func loadTransportLinesFromCoreData() {
        print("📍 Chargement des lignes depuis CoreData...")
        
        // Option 1: Charger toutes les lignes
        let allLines = persistence.fetchAllTransportLines()
        displayTransportLineEntities(allLines)
        
        // Option 2: Charger uniquement certains types (exemple)
        // let tramLines = persistence.fetchTransportLines(byType: "Tram")
        // let metroLines = persistence.fetchTransportLines(byType: "Metro")
        // displayTransportLineEntities(tramLines + metroLines)
    }
    
    /// Affiche les entités CoreData sur la carte
    private func displayTransportLineEntities(_ entities: [TransportLineEntity]) {
        print("🗺️ Affichage de \(entities.count) lignes sur la carte")
        
        for entity in entities {
            // Convertit chaque entité en CustomPolylines
            let polylines = entity.toCustomPolylines()
            
            // Ajoute à la carte
            mapView.addOverlays(polylines)
        }
        
        print("✅ Affichage terminé")
    }
    
    /// Affiche un message d'erreur
    private func showError(_ message: String) {
        let alert = UIAlertController(
            title: "Erreur",
            message: message,
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}

// MARK: - MKMapViewDelegate

extension TransportMapViewControllerWithCoreData: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if let customPolyline = overlay as? CustomPolyline {
            let renderer = MKPolylineRenderer(polyline: customPolyline)
            renderer.strokeColor = customPolyline.color
            renderer.lineWidth = 4.0
            renderer.lineCap = .round
            renderer.lineJoin = .round
            return renderer
        }
        
        return MKOverlayRenderer(overlay: overlay)
    }
}

// MARK: - Debug Extension

extension TransportMapViewControllerWithCoreData {
    
    /// Ajoute un bouton de debug dans la navbar
    func addDebugButton() {
        let debugButton = UIBarButtonItem(
            title: "🐛 Debug",
            style: .plain,
            target: self,
            action: #selector(showDebugMenu)
        )
        navigationItem.rightBarButtonItem = debugButton
    }
    
    @objc private func showDebugMenu() {
        let debugger = TransportLineDebugger()
        
        let alert = UIAlertController(
            title: "🐛 Menu Debug",
            message: "Choisissez une action",
            preferredStyle: .actionSheet
        )
        
        alert.addAction(UIAlertAction(title: "🔍 Diagnostic complet", style: .default) { _ in
            debugger.runFullDiagnostic()
        })
        
        alert.addAction(UIAlertAction(title: "🧪 Test migration simulée", style: .default) { _ in
            debugger.testMigrationWithSampleData()
        })
        
        alert.addAction(UIAlertAction(title: "📊 Statistiques BDD", style: .default) { _ in
            debugger.checkDatabase()
        })
        
        alert.addAction(UIAlertAction(title: "🗑️ Effacer BDD", style: .destructive) { _ in
            debugger.forceClearAndAlert()
        })
        
        alert.addAction(UIAlertAction(title: "Annuler", style: .cancel))
        
        if let popover = alert.popoverPresentationController {
            popover.barButtonItem = navigationItem.rightBarButtonItem
        }
        
        present(alert, animated: true)
    }
}

// MARK: - Usage in SceneDelegate

/*
 Pour utiliser cette version avec CoreData:
 
 1. Dans SceneDelegate.swift:
 
    let mapVC = TransportMapViewControllerWithCoreData()
    window?.rootViewController = UINavigationController(rootViewController: mapVC)
 
 2. Assurez-vous que le fichier CSV est dans votre bundle
 
 3. Au premier lancement:
    - L'app détecte que CoreData est vide
    - Demande à l'utilisateur de lancer l'import
    - Parse le CSV et stocke tout dans CoreData
 
 4. Aux lancements suivants:
    - Les données sont chargées directement depuis CoreData
    - Beaucoup plus rapide !
 
 5. Pour forcer une nouvelle migration (debug):
    TransportLinePersistence.shared.clearAllData()
 */
