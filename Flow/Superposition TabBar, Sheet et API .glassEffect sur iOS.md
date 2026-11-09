# **Architecture et Implémentation Native de l'Interface Localiser sous iOS 26 avec Liquid Glass (.glassEffect) pour l'Application Flow**

## **Analyse Architecturale de l'Interface Localiser sous iOS 26**

L'examen de l'interface de l'application Localiser (Find My) sous iOS 26 révèle une architecture spatiale tripartite conçue autour du langage de design Liquid Glass introduit par Apple lors de la WWDC 20251. L'écran s'organise selon trois plans distincts superposés sur l'axe Z, chacun jouant un rôle optique et fonctionnel précis dans la hiérarchie visuelle1.  
Le premier plan, qui constitue la fondation cartographique de l'interface, déploie une carte interactive plein écran ignorant les zones de sécurité (ignoresSafeArea)5. Cette surface continue est surmontée dans son coin supérieur droit d'un groupe de boutons d'action flottants dédiés au changement de mode cartographique et au centrage de la géolocalisation, lesquels sont fusionnés au sein d'une capsule verticale translucide qui réfracte directement les reliefs de la carte1. Le deuxième plan correspond à la couche intermédiaire formée par une feuille modale inférieure (bottom sheet) persistante et non révocable affichant l'en-tête « Personnes », un bouton d'action circulaire \+ ainsi qu'une liste défilante de contacts6. Sous iOS 26, lorsque cette feuille se trouve à un palier de hauteur partiel tel que .medium ou une valeur fractionnaire, le système lui applique automatiquement un retrait latéral et inférieur ainsi qu'un matériau Liquid Glass natif dont le rayon de courbure s'aligne de manière concentrique avec les angles physiques de l'écran de l'iPhone9. Enfin, le troisième plan, situé au sommet de la hiérarchie Z-index, héberge la navigation flottante sous la forme d'une barre d'onglets en pilule (« Personnes », « Appareils », « Objets », « Moi ») dotée d'un indicateur de sélection en verre réfractif et positionnée au bas de l'écran **par-dessus** la feuille modale2. L'observation fine du rendu optique démontre que le contenu défilant de la feuille (notamment la ligne julie.bleuze@gmail.com) passe directement *derrière* cette barre d'onglets flottante, confirmant que la barre occupe un niveau hiérarchique supérieur ou constitue un accessoire ancré au bas du conteneur de la feuille2.

### **Le Conflit Fondamental de Hiérarchie entre TabView et Sheet**

Dans l'architecture standard d'UIKit et de SwiftUI, l'utilisation classique d'un TabView racine dont l'un des onglets présente une .sheet échoue systématiquement à reproduire cette disposition spatiale8. Lorsqu'un UIViewController ou une vue SwiftUI déclenche une présentation modale via le modificateur .sheet, UIKit instancie un UISheetPresentationController rattaché à la fenêtre principale (UIWindow) ou au contrôleur racine (UITabBarController)16. Par conséquent, la vue conteneur de la présentation (UITransitionView) s'insère au-dessus du UITabBar, masquant intégralement la barre d'onglets dès que la feuille modale s'élève depuis le bas de l'écran8.  
Pour résoudre cette contrainte structurelle dans l'application Flow tout en exploitant exclusivement l'API native .glassEffect, quatre architectures d'ingénierie distinctes permettent d'inverser ou de contourner cet ordre d'empilement2.

| Architecture d'Implémentation | Mécanisme Technique Sous-Jacent | Fidélité Visuelle (iOS 26\) | Comportement de la Barre au Défilement de la Feuille | Complexité et Maintenance |
| :---- | :---- | :---- | :---- | :---- |
| **1\. Feuille Hôte avec safeAreaInset (SwiftUI Pur)** | La carte est la vue racine et présente une .sheet permanente contenant la liste et la barre .glassEffect injectée via .safeAreaInset(edge: .bottom)2. | Très élevée (le contenu de la liste défile nativement sous la barre en verre)14. | La barre reste toujours ancrée au bas de l'écran tant que le palier minimal de la feuille équivaut à la hauteur de la barre (\~84pt)2. | **Faible** (100 % SwiftUI natif, aucune manipulation de fenêtre). |
| **2\. TabView Présenté dans la Feuille (Pattern "Slopes")** | Le contrôleur racine (Carte) présente une .sheet dont le contenu racine est lui-même un TabView natif iOS 2612. | Maximale sur iPhone (utilise le TabView Liquid Glass système)7. | Le TabView vit à l'intérieur de la feuille ; perte de certains comportements spécifiques de barre latérale sur iPadOS. | **Faible** (repose entièrement sur les composants système)7. |
| **3\. Fenêtre Secondaire PassThroughWindow (Hybride SwiftUI/UIKit)** | Une seconde UIWindow transparente de niveau supérieur héberge la barre .glassEffect et laisse passer les touchers vers la feuille et la carte22. | Absolue (indépendance géométrique totale entre la feuille et la barre). | La feuille peut glisser derrière la barre d'onglets sans que l'en-tête de la feuille ne soit lié au conteneur de la barre. | **Moyenne** (requiert le routage d'événements tactiles hitTest). |
| **4\. Sous-classement UISheetPresentationController (UIKit Pur)** | Redéfinition de containerView.frame dans presentationTransitionWillBegin ou usage de definesPresentationContext \= true17. | Moyenne à Élevée (selon que la barre coupe ou survole la feuille)20. | Tronque la hauteur du conteneur de la feuille au-dessus du UITabBar ou superpose la barre24. | **Élevée** (dépend du cycle de vie interne d'UIKit)18. |

L'analyse comparative de ces quatre approches démontre que la première et la troisième architecture répondent le plus fidèlement aux exigences de l'application Flow. Dans l'application Localiser d'iOS 26, l'examen du comportement dynamique de l'interface révèle que la barre d'onglets inférieure ne se comporte pas comme un TabView racine classique isolé, mais s'intègre soit au sein d'une feuille dotée de paliers personnalisés (.presentationDetents(\[.fraction(0.1), .medium, .large\])) laissant la barre visible en position réduite2, soit via une superposition (overlay ou fenêtre dédiée) d'une capsule personnalisée utilisant .glassEffect(.regular.interactive(), in: .capsule)13. L'approche consistant à présenter un TabView directement à l'intérieur de la feuille modale (utilisée notamment par l'application Slopes) fonctionne également très bien sur iPhone mais sacrifie certaines adaptations automatiques de la barre d'onglets sur iPadOS lorsque le TabView n'est pas le contrôleur racine de la fenêtre12.

## **Référence Technique de l'API Native Liquid Glass (iOS 26 / WWDC25)**

Pour éviter toute implémentation artificielle à base de flous classiques (UIBlurEffect ou .ultraThinMaterial) et utiliser exclusivement le moteur optique temps réel d'iOS 26, le code doit reposer sur les primitives natives introduites dans Xcode 261. Le matériau Liquid Glass ne se contente pas d'appliquer un filtre gaussien sur l'arrière-plan : il réfracte la lumière par effet de lentille, reflète les couleurs et la luminance environnantes sur ses bordures, adapte dynamiquement le schéma de couleur (clair ou sombre) ainsi que la vibrance du texte au premier plan selon les pixels situés derrière lui, et se déforme élastiquement sous le doigt ou le pointeur de l'utilisateur4.

### **Primitives SwiftUI : Modificateurs, Variantes et Conteneurs de Fusion**

En SwiftUI (compatible avec iOS 26.0+, iPadOS 26.0+, macOS 26.0+, watchOS 26.0+ et tvOS 26.0+), le point d'entrée fondamental du système optique est le modificateur de vue glassEffect(\_:in:)28. Il importe de le distinguer strictement du modificateur glassBackgroundEffect(in:displayMode:), qui est une API spécifique à visionOS prenant en paramètre une InsettableShape24.  
La signature officielle de l'API dans le SDK iOS 26 se définit ainsi33 :

Swift  
nonisolated func glassEffect(  
    \_ glass: Glass \= .regular,  
    in shape: some Shape \= DefaultGlassEffectShape()  
) \-\> some View

La structure Glass définit la configuration matérielle du verre à travers trois variantes statiques prédéfinies14. La variante .regular constitue le matériau standard le plus utilisé à travers le système, offrant un flou réfractif équilibré et une adaptation complète de la lisibilité des éléments de premier plan14. La variante .clear offre une transparence nettement accrue qui ne floute pas le centre de l'arrière-plan mais concentre la réfraction sur les bords de la forme, reproduisant l'effet optique observé lorsque l'utilisateur maintient ou fait glisser des contrôles système tels qu'un UISlider ou un UISwitch38. Enfin, la variante .identity agit comme une instance neutre qui désactive visuellement l'effet de verre sans altérer la structure de la hiérarchie de vues SwiftUI ; son utilisation dans des expressions ternaires telles que .glassEffect(isEnabled ? .regular : .identity) représente la méthode officielle pour activer ou désactiver conditionnellement le matériau sans provoquer de perte d'état ou de réinitialisation d'animation14.  
Sur toute instance de Glass, deux méthodes d'instance chaînables permettent d'affiner le comportement optique et haptique38. La méthode .interactive(\_ isEnabled: Bool \= true) \-\> Glass active la réactivité physique temps réel au toucher et au pointeur : lorsqu'un composant doté de .glassEffect(.regular.interactive()) reçoit un geste de tapotement ou de glissement (tap et drag), la surface de verre s'illumine, rebondit avec un effet d'échelle élastique et accentue agressivement la réfraction du contenu sous-jacent7. La méthode .tint(\_ color: Color?) \-\> Glass fusionne quant à elle une teinte sémantique directement dans la masse du verre pour créer un effet de vitrail tout en ajustant automatiquement la vibrance des textes et symboles SF au premier plan9. Conformément aux recommandations d'Apple, cette teinte doit demeurer subtile et réservée aux états actifs ou aux appels à l'action, car une couleur trop saturée masque la réfraction de l'arrière-plan tout en maintenant un coût GPU élevé7.  
La définition géométrique du verre s'opère via le second paramètre in shape: some Shape, qui utilise par défaut une instance de DefaultGlassEffectShape() correspondant à une forme de Capsule33. Toute conformité au protocole Shape peut y être injectée, notamment .capsule, .circle, .ellipse, .rect(cornerRadius: 16.0), .containerRelative, .rect(cornerRadius: .containerConcentric) ou une structure Shape personnalisée traçant un chemin vectoriel complexe4. Parce que le modificateur glassEffect(\_:in:) ancre le matériau aux limites géométriques (bounds) actuelles de la vue et capture son contenu pour le transmettre au moteur de rendu, il doit impérativement être déclaré **après** les modificateurs de mise en page et de dimensionnement tels que .padding() ou .frame()30. Pour les contrôles standards, SwiftUI propose également les styles de boutons dédiés .buttonStyle(.glass) (GlassButtonStyle, translucide pour les actions secondaires) et .buttonStyle(.glassProminent) (GlassProminentButtonStyle, plus opaque pour les actions primaires)1.  
Lorsque plusieurs éléments en verre coexistent à proximité — comme les boutons de contrôle de la carte ou les composants d'une barre de navigation personnalisée — ils doivent impérativement être enveloppés dans un GlassEffectContainer(spacing: CGFloat)1. Ce conteneur mutualise la région d'échantillonnage optique en une seule passe de rendu GPU, ce qui améliore considérablement les performances et évite que des panneaux de verre adjacents n'entrent en compétition visuelle4. Le paramètre spacing contrôle la distance critique en points en deçà de laquelle les chemins vectoriels des formes commencent à fusionner organiquement1. Si la valeur spacing du GlassEffectContainer (par exemple 40.0) est supérieure ou égale à l'espacement du HStack ou VStack interne (par exemple 20.0), les éléments fusionnent en une seule forme de verre continue même à l'état de repos30. Combiné à la propriété @Namespace et au modificateur .glassEffectID(\_:in:), le conteneur permet aux formes de verre de se séparer ou de fusionner avec une cinématique fluide lors de l'apparition ou de la disparition conditionnelle de vues dans la hiérarchie1. De surcroît, le modificateur .glassEffectUnion(id:namespace:) permet de forcer la fusion de plusieurs vues distantes en une seule pièce de verre unifiée indépendamment de leur éloignement géométrique4, tandis que .glassEffectTransition(\_:) définit le type de transition lors de l'insertion ou du retrait d'un élément (.matchedGeometry par défaut, .materialize ou .identity)4.

### **Équivalents Natifs en UIKit (UIGlassEffect et UIGlassContainerEffect)**

Pour les architectures hybrides ou purement UIKit, le SDK iOS 26 introduit une hiérarchie complète de classes dérivées de UIVisualEffect permettant de manipuler le matériau Liquid Glass avec le même degré de contrôle qu'en SwiftUI46.

| Concept Liquid Glass | API SwiftUI (iOS 26+) | API UIKit (iOS 26+) | Rôle et Comportement |
| :---- | :---- | :---- | :---- |
| **Effet de Verre de Base** | .glassEffect(\_:in:) | UIGlassEffect(style:) dans UIVisualEffectView31 | Rend le matériau réfractif derrière la vue et adapte le premier plan33. |
| **Interactivité Tactile** | Glass.regular.interactive() | glassEffect.isInteractive \= true | Active l'expansion, le rebond et les reflets lumineux au toucher9. |
| **Teinte Sémantique** | Glass.regular.tint(\_:) | glassEffect.tintColor \= UIColor | Applique un effet de verre teinté en préservant le contraste9. |
| **Conteneur de Fusion** | GlassEffectContainer(spacing:)44 | UIGlassContainerEffect (spacing: CGFloat)49 | Combine plusieurs vues de verre en un rendu unique et gère le morphing22. |
| **Boutons Natifs en Verre** | .buttonStyle(.glass) / .glassProminent1 | UIButton.Configuration.glass() / .prominentGlass()9 | Applique le style de bouton système Liquid Glass sans conteneur manuel3. |
| **Coins Concentriques** | .rect(cornerRadius: .containerConcentric)4 | UICornerConfiguration.corners(radius: .containerConcentric())3 | Aligne mathématiquement le rayon de courbure sur celui du parent ou de l'écran4. |
| **Effet de Bord de Défilement** | .scrollEdgeGlass(.top)45 | UIScrollEdgeEffect (scrollView.topEdgeEffect) & UIScrollEdgeElementContainerInteraction27 | Estompe et réfracte le contenu défilant sous les barres et en-têtes31. |

### **Règles Optiques Critiques et Seuils Géométriques sous iOS 26**

L'implémentation de l'interface de Flow doit impérativement respecter trois lois techniques propres au moteur de rendu d'iOS 26, sous peine de provoquer des artefacts visuels, une perte d'interactivité ou des erreurs de compilation.  
La première loi concerne l'interdiction stricte de la superposition directe « verre sur verre » (*glass-on-glass*) et la suppression du modificateur .presentationBackground sur les feuilles modales7. Techniquement, une surface Liquid Glass ne peut pas échantillonner une autre surface Liquid Glass directement superposée sans produire un rendu terne ou déclencher la désactivation automatique de l'effet par le système4. Or, sous iOS 26, toute .sheet présentée à une hauteur partielle adopte *automatiquement* un fond Liquid Glass qui s'incurve vers l'intérieur pour épouser les coins de l'écran, avant de devenir progressivement opaque lorsque l'utilisateur l'étire jusqu'au palier plein écran .large10. Il ne faut donc jamais tenter d'écrire .presentationBackground(.glass) — ce membre n'existe pas sur le protocole ShapeStyle et génère immédiatement l'erreur de compilation Type 'ShapeStyle' has no member 'glass' — ni appliquer .presentationBackground(Color.white) ou .presentationBackground(.ultraThinMaterial) qui écraseraient le matériau natif de la feuille4. La feuille doit être déclarée sans aucun modificateur .presentationBackground, et toute List ou Form placée à l'intérieur doit recevoir .scrollContentBackground(.hidden) afin que son arrière-plan par défaut ne masque pas la translucidité de la feuille4.  
La deuxième loi régit le double seuil de rendu du UIVisualEffectView sous-jacent à .glassEffect52. Les analyses approfondies du moteur de rendu d'iOS 26 montrent qu'Apple utilise deux seuils indépendants qui doivent tous deux être satisfaits pour instancier un matériau **fin** (thin material, qui respecte fidèlement les teintes .tint() subtiles et offre une transparence cristalline) plutôt qu'un matériau **lourd** (heavy material, qui opacifie la vue et ignore les teintes personnalisées)2 :  
![][image1]  
Le premier seuil est déterminé au moment de la mise en page (layout time) : dès que la hauteur géométrique réelle d'une vue dotée de .glassEffect atteint ou dépasse ![][image2] (que cette hauteur résulte d'un .frame(height:), d'un .padding() ou de la taille de police, et sans que des transformations visuelles post-layout comme .scaleEffect ou .mask ne puissent modifier ce comportement), le UIVisualEffectView bascule automatiquement sur le matériau lourd2. Le second seuil est calculé au moment du rendu (render time) en échantillonnant et en floutant les pixels situés derrière la vue : si la luminance résultante (fonction continue de la couleur de fond multipliée par son opacité) dépasse un seuil ![][image3], le matériau bascule également en mode lourd2. Par conséquent, pour que la barre d'onglets flottante de Flow conserve sa finesse optique et respecte ses teintes, **la hauteur de layout de la capsule de la barre d'onglets doit impérativement demeurer strictement inférieure à ![][image2]** (idéalement entre ![][image4] et ![][image5])2.  
La troisième loi impose la correspondance exacte des paliers dans presentationBackgroundInteraction53. Pour permettre à l'utilisateur de manipuler la carte en arrière-plan pendant que la feuille « Personnes » est ouverte à mi-hauteur, SwiftUI requiert .presentationBackgroundInteraction(.enabled(upThrough: ...))6. La valeur passée au paramètre upThrough: doit correspondre **exactement** à l'un des paliers déclarés dans .presentationDetents(\[...\]) (par exemple, utiliser .enabled(upThrough: .medium) lorsque .medium figure dans la liste des paliers, ou .enabled(upThrough: .fraction(0.2)) si .fraction(0.2) y est déclaré) ; toute divergence entre les deux valeurs désactive l'interaction avec la carte et assombrit l'arrière-plan25.

| Paramètre ou État Système | Valeur / Seuil Critique | Comportement Optique et Géométrique sous iOS 26 | Impact sur l'Interactivité |
| :---- | :---- | :---- | :---- |
| **Hauteur de Layout .glassEffect** | **![][image6]** (ex. ![][image7] à ![][image8])2 | Instancie le matériau **fin** dans UIVisualEffectView ; respecte les teintes .tint() subtiles2. | Réactivité complète aux gestes tap et drag avec .interactive()14. |
| **Hauteur de Layout .glassEffect** | **![][image9]**2 | Bascule de force sur le matériau **lourd** ; perte des teintes personnalisées hors fonds très sombres2. | Conservée, mais aspect visuel plus opaque et massif2. |
| **Espacement GlassEffectContainer** | spacing ![][image10] espacement interne (ex. ![][image11] à ![][image12])4 | Fusionne les formes proches en une seule goutte de verre continue et partage l'échantillonnage GPU4. | Coordonne les animations de morphing via .glassEffectID1. |
| **Palier Minimal de Feuille** | .height(84) ou .fraction(0.1) (![][image13])42 | Feuille rétractée au bas de l'écran avec verre concentrique ; seule la barre d'onglets (ou l'en-tête) reste visible2. | Carte 100 % interactive en arrière-plan6. |
| **Palier Médian de Feuille** | .medium (![][image14] de l'écran)6 | Feuille en verre Liquid Glass natif avec retrait latéral et coins concentriques à l'écran10. | Carte interactive via .enabled(upThrough: .medium) ; liste défilante via .scrolls32. |
| **Palier Haut de Feuille** | .large (![][image15] de l'écran)42 | Transition fluide du verre vers un fond opaque ancré aux bords de l'écran44. | Carte en arrière-plan désactivée au-delà du palier .medium25. |

## **Exemples de Code Complets pour l'Intégration dans Flow**

Les quatre implémentations suivantes fournissent l'intégralité du code source nécessaire pour reproduire l'interface cible avec l'API native .glassEffect.

### **1\. Approche Recommandée en SwiftUI Pur (Feuille Persistante et Barre Flottante en safeAreaInset)**

Cette première architecture est la plus propre et la plus idiomatique en SwiftUI sous iOS 2638. La vue racine affiche la Map et les contrôles flottants supérieurs regroupés dans un GlassEffectContainer. Elle présente une .sheet permanente dont le palier minimal (.height(84)) correspond exactement à la hauteur de la barre d'onglets flottante42. La barre d'onglets est injectée via .safeAreaInset(edge: .bottom) à l'intérieur de la feuille38 : ainsi, lorsque la feuille est à .medium ou .large, la liste des personnes défile naturellement derrière la barre en verre (comme julie.bleuze@gmail.com sur la capture de référence), et lorsque l'utilisateur rabat la feuille vers le bas, seule la barre d'onglets reste visible au bas de l'écran2.

Swift  
import SwiftUI  
import MapKit

// MARK: \- Modèles de Données pour Flow  
enum FlowTab: String, CaseIterable, Identifiable {  
    case people \= "Personnes"  
    case devices \= "Appareils"  
    case items \= "Objets"  
    case me \= "Moi"  
      
    var id: String { rawValue }  
      
    var icon: String {  
        switch self {  
        case .people: return "person.2.fill"  
        case .devices: return "macbook.and.iphone"  
        case .items: return "circle.grid.cross.eh.fill"  
        case .me: return "location.fill"  
        }  
    }  
}

struct FlowPerson: Identifiable {  
    let id \= UUID()  
    let initials: String?  
    let name: String  
    let subtitle: String  
    let distance: String  
    let isFavorite: Bool  
    let avatarColor: Color  
}

// MARK: \- 1\. Vue Racine (Carte \+ Contrôles Flottants \+ Présentation de la Sheet)  
@available(iOS 26.0, \*)  
struct FlowMainMapView: View {  
    @State private var cameraPosition: MapCameraPosition \= .region(  
        MKCoordinateRegion(  
            center: CLLocationCoordinate2D(latitude: 48.878, longitude: 2.310),  
            span: MKCoordinateSpan(latitudeDelta: 0.08, longitudeDelta: 0.08)  
        )  
    )  
      
    // Paliers de la feuille : .height(84) garde uniquement la barre visible en bas  
    @State private var selectedDetent: PresentationDetent \= .medium  
    @State private var activeTab: FlowTab \= .people  
      
    var body: some View {  
        ZStack(alignment: .topTrailing) {  
            // Couche 1 : Carte plein écran  
            Map(position: \$cameraPosition)  
                .ignoresSafeArea()  
              
            // Contrôles flottants en haut à droite (Carte & Localisation)  
            // Regroupés dans un GlassEffectContainer pour unifier l'échantillonnage optique  
            GlassEffectContainer(spacing: 12\) {  
                VStack(spacing: 0\) {  
                    Button {  
                        // Action changement de carte  
                    } label: {  
                        Image(systemName: "map.fill")  
                            .font(.system(size: 18, weight: .semibold))  
                            .frame(width: 44, height: 48\)  
                    }  
                      
                    Divider()  
                        .frame(width: 28\)  
                        .opacity(0.3)  
                      
                    Button {  
                        // Action centrer sur l'utilisateur  
                    } label: {  
                        Image(systemName: "location.fill")  
                            .font(.system(size: 18, weight: .semibold))  
                            .frame(width: 44, height: 48\)  
                    }  
                }  
                .foregroundStyle(.primary)  
                .glassEffect(.regular.interactive(), in: .capsule)  
            }  
            .padding(.top, 8\)  
            .padding(.trailing, 16\)  
        }  
        // Couche 2 : Feuille modale persistante native iOS 26  
        // IMPORTANT : Aucun .presentationBackground() n'est appliqué afin de conserver  
        // le matériau Liquid Glass concentrique automatique d'iOS 26\.  
        .sheet(isPresented: .constant(true)) {  
            FlowSheetContainerView(  
                activeTab: \$activeTab,  
                selectedDetent: \$selectedDetent  
            )  
            .presentationDetents(  
                \[.height(84), .medium, .large\],  
                selection: \$selectedDetent  
            )  
            .presentationBackgroundInteraction(  
                .enabled(upThrough: .medium)  
            )  
            .presentationContentInteraction(.scrolls)  
            .presentationDragIndicator(.visible)  
            .interactiveDismissDisabled(true)  
        }  
    }  
}

// MARK: \- 2\. Conteneur Interne de la Feuille (Contenu Défilant \+ Tab Bar par-dessus)  
@available(iOS 26.0, \*)  
struct FlowSheetContainerView: View {  
    @Binding var activeTab: FlowTab  
    @Binding var selectedDetent: PresentationDetent  
      
    private let samplePeople: \[FlowPerson\] \= \[  
        FlowPerson(initials: "JB", name: "Jeanne Bonazza", subtitle: "Carqueiranne · Il y a 5 min", distance: "704 km", isFavorite: true, avatarColor: .indigo.opacity(0.7)),  
        FlowPerson(initials: nil, name: "gilles.b.z@wanadoo.fr", subtitle: "Aucune position trouvée", distance: "", isFavorite: true, avatarColor: .gray.opacity(0.6)),  
        FlowPerson(initials: "RT", name: "Ronan Tayou Omomone", subtitle: "Paris · Il y a 4 min", distance: "À proximité", isFavorite: false, avatarColor: .blue.opacity(0.7)),  
        FlowPerson(initials: "PH", name: "Phybz💫", subtitle: "Domicile · Il y a 1 h", distance: "6,6 km", isFavorite: false, avatarColor: .brown.opacity(0.8)),  
        FlowPerson(initials: "AL", name: "Amélie Lafferie", subtitle: "Maintenant", distance: "495 km", isFavorite: false, avatarColor: .teal.opacity(0.7)),  
        FlowPerson(initials: nil, name: "julie.bleuze@gmail.com", subtitle: "Paris · Il y a 12 min", distance: "2,1 km", isFavorite: false, avatarColor: .gray.opacity(0.6))  
    \]  
      
    var body: some View {  
        ScrollView(.vertical, showsIndicators: false) {  
            VStack(alignment: .leading, spacing: 0\) {  
                // En-tête de la feuille ("Personnes" \+ bouton '+')  
                HStack(alignment: .center) {  
                    Text(activeTab.rawValue)  
                        .font(.system(size: 30, weight: .bold, design: .default))  
                        .foregroundStyle(.primary)  
                      
                    Spacer()  
                      
                    // Bouton '+' natif en verre circulaire  
                    Button {  
                        // Action d'ajout dans Flow  
                    } label: {  
                        Image(systemName: "plus")  
                            .font(.system(size: 20, weight: .medium))  
                            .foregroundStyle(.primary)  
                            .frame(width: 44, height: 44\)  
                    }  
                    .glassEffect(.regular.interactive(), in: .circle)  
                }  
                .padding(.horizontal, 20\)  
                .padding(.top, 22\)  
                .padding(.bottom, 14\)  
                  
                // Liste des personnes  
                LazyVStack(spacing: 0\) {  
                    ForEach(samplePeople) { person in  
                        FlowPersonRow(person: person)  
                          
                        Divider()  
                            .padding(.leading, 84\)  
                    }  
                }  
            }  
            // Marge inférieure pour permettre au dernier élément de défiler  
            // complètement au-dessus de la Tab Bar flottante  
            .padding(.bottom, 24\)  
        }  
        .scrollContentBackground(.hidden)  
        // Couche 3 : Injection de la Tab Bar Liquid Glass au premier plan en bas de la feuille  
        .safeAreaInset(edge: .bottom, spacing: 0\) {  
            FlowLiquidGlassTabBar(activeTab: \$activeTab) { \_ in  
                // Si la feuille était réduite au minimum (.height(84)),  
                // toucher un onglet la remonte automatiquement à .medium  
                if selectedDetent \== .height(84) {  
                    withAnimation(.spring(response: 0.38, dampingFraction: 0.82)) {  
                        selectedDetent \= .medium  
                    }  
                }  
            }  
            .padding(.horizontal, 16\)  
            .padding(.bottom, 6\)  
        }  
    }  
}

// MARK: \- 3\. Barre d'Onglets Flottante Native (.glassEffect \+ Morphing)  
@available(iOS 26.0, \*)  
struct FlowLiquidGlassTabBar: View {  
    @Binding var activeTab: FlowTab  
    var onTabSelected: ((FlowTab) \-\> Void)? \= nil  
    @Namespace private var tabGlassNamespace  
      
    var body: some View {  
        // GlassEffectContainer coordonne l'échantillonnage optique et le morphing  
        GlassEffectContainer(spacing: 12\) {  
            HStack(spacing: 4\) {  
                ForEach(FlowTab.allCases) { tab in  
                    let isSelected \= (activeTab \== tab)  
                      
                    Button {  
                        withAnimation(.bouncy(duration: 0.35, extraBounce: 0.12)) {  
                            activeTab \= tab  
                        }  
                        onTabSelected?(tab)  
                    } label: {  
                        VStack(spacing: 3\) {  
                            Image(systemName: tab.icon)  
                                .font(.system(size: 20, weight: .semibold))  
                                .symbolRenderingMode(.hierarchical)  
                              
                            Text(tab.rawValue)  
                                .font(.system(size: 11, weight: .semibold))  
                        }  
                        .foregroundStyle(isSelected ? Color.blue : Color.primary)  
                        .frame(maxWidth: .infinity)  
                        // CRITIQUE : Hauteur maintenue à 54pt (\< 65pt) pour garantir  
                        // l'instanciation du matériau fin par UIVisualEffectView  
                        .frame(height: 54\)  
                        .background {  
                            if isSelected {  
                                Capsule()  
                                    .fill(Color.primary.opacity(0.08))  
                                    .matchedGeometryEffect(id: "ACTIVE\_TAB\_PILL", in: tabGlassNamespace)  
                            }  
                        }  
                    }  
                    .buttonStyle(.plain)  
                }  
            }  
            .padding(.horizontal, 6\)  
            .padding(.vertical, 4\)  
            // Hauteur totale de layout \= 54 \+ 8 \= 62pt (\< 65pt)  
            .glassEffect(.regular.interactive(), in: .capsule)  
        }  
    }  
}

// MARK: \- 4\. Cellule de Liste Personne  
struct FlowPersonRow: View {  
    let person: FlowPerson  
      
    var body: some View {  
        HStack(spacing: 14\) {  
            ZStack(alignment: .topTrailing) {  
                Circle()  
                    .fill(person.avatarColor)  
                    .frame(width: 52, height: 52\)  
                    .overlay {  
                        if let initials \= person.initials {  
                            Text(initials)  
                                .font(.system(size: 20, weight: .bold, design: .rounded))  
                                .foregroundStyle(.white)  
                        } else {  
                            Image(systemName: "person.crop.circle.fill")  
                                .resizable()  
                                .foregroundStyle(.white.opacity(0.85))  
                        }  
                    }  
                  
                if person.isFavorite {  
                    Circle()  
                        .fill(Color.yellow)  
                        .frame(width: 18, height: 18\)  
                        .overlay {  
                            Image(systemName: "star.fill")  
                                .font(.system(size: 10, weight: .bold))  
                                .foregroundStyle(.white)  
                        }  
                        .overlay(Circle().stroke(Color.white, lineWidth: 1.5))  
                        .offset(x: 2, y: \-2)  
                }  
            }  
              
            VStack(alignment: .leading, spacing: 3\) {  
                Text(person.name)  
                    .font(.system(size: 17, weight: .semibold))  
                    .foregroundStyle(.primary)  
                    .lineLimit(1)  
                  
                Text(person.subtitle)  
                    .font(.system(size: 15))  
                    .foregroundStyle(.secondary)  
                    .lineLimit(1)  
            }  
              
            Spacer(minLength: 8\)  
              
            if \!person.distance.isEmpty {  
                Text(person.distance)  
                    .font(.system(size: 16, weight: .medium))  
                    .foregroundStyle(.secondary)  
            }  
        }  
        .padding(.horizontal, 20\)  
        .padding(.vertical, 12\)  
        .contentShape(Rectangle())  
    }  
}

### **2\. Architecture Multi-Fenêtre PassThroughWindow (Indépendance Géométrique Totale)**

Si le cahier des charges de Flow exige que la feuille modale puisse descendre ou monter de manière totalement indépendante *derrière* une barre d'onglets strictement immobile au bas de l'écran (sans que le bord supérieur de la feuille ne soit lié à la barre lorsque la feuille est réduite), l'utilisation d'une UIWindow secondaire transparente à transfert d'événements (hitTest) constitue la solution d'ingénierie la plus robuste. La fenêtre de superposition possède un windowLevel supérieur à la fenêtre principale qui présente la .sheet, mais ne capture les touchers que lorsqu'ils tombent exactement dans le rectangle de la barre d'onglets .glassEffect35.

Swift  
import SwiftUI  
import UIKit

// MARK: \- 1\. Sous-classe UIWindow laissant passer les touchers hors de la Tab Bar  
final class PassThroughOverlayWindow: UIWindow {  
    override func hitTest(\_ point: CGPoint, with event: UIEvent?) \-\> UIView? {  
        guard let rootView \= rootViewController?.view else { return nil }  
        let hitView \= super.hitTest(point, with: event)  
        // Si la vue touchée est la vue racine transparente du UIHostingController,  
        // on retourne nil pour transmettre l'événement à la Sheet ou à la Map en dessous.  
        return (hitView \== rootView) ? nil : hitView  
    }  
}

// MARK: \- 2\. Gestionnaire d'Installation de la Fenêtre de Navigation Flottante  
@MainActor  
@Observable  
final class FloatingTabBarWindowManager {  
    private var overlayWindow: PassThroughOverlayWindow?  
    var activeTab: FlowTab \= .people  
      
    @available(iOS 26.0, \*)  
    func attachOverlayTabBar(to windowScene: UIWindowScene) {  
        guard overlayWindow \== nil else { return }  
          
        let window \= PassThroughOverlayWindow(windowScene: windowScene)  
        window.backgroundColor \= .clear  
        // Niveau supérieur à UIWindow.Level.normal pour survoler toute .sheet  
        window.windowLevel \= UIWindow.Level(rawValue: UIWindow.Level.normal.rawValue \+ 1\)  
          
        let rootView \= FloatingOverlayTabBarHost(manager: self)  
        let hostingController \= UIHostingController(rootView: rootView)  
        hostingController.view.backgroundColor \= .clear  
          
        window.rootViewController \= hostingController  
        window.isHidden \= false  
        self.overlayWindow \= window  
    }  
}

@available(iOS 26.0, \*)  
private struct FloatingOverlayTabBarHost: View {  
    @Bindable var manager: FloatingTabBarWindowManager  
      
    var body: some View {  
        VStack {  
            Spacer()  
            FlowLiquidGlassTabBar(activeTab: \$manager.activeTab)  
                .padding(.horizontal, 16\)  
                .padding(.bottom, 6\)  
        }  
        .frame(maxWidth: .infinity, maxHeight: .infinity)  
        .background(Color.clear)  
    }  
}

### **3\. Composant Hybride UISegmentedControl et glassEffect (Effet de Bulle Glissante Natif)**

Sous iOS 26, la bulle de sélection d'une barre d'onglets système se déplace continûment sous le doigt avec un retour haptique et une déformation optique que les boutons SwiftUI standards ne reproduisent pas lors d'un glissement horizontal continu13. Comme démontré par l'architecture UnionTabView, cette mécanique s'obtient en superposant un UISegmentedControl rendu visuellement transparent (pour bénéficier de son mécanisme natif de glissement de bulle iOS 26, de ses retours haptiques système et de son support VoiceOver) et des étiquettes SwiftUI personnalisées désactivées aux tests de toucher (allowsHitTesting(false)), le tout encapsulé dans .glassEffect(.regular.interactive(), in: .capsule)13. Il convient toutefois de noter que cette approche repose sur le comportement de sélection d'un UISegmentedControl plutôt que sur un UITabBar natif58.

Swift  
import SwiftUI  
import UIKit

@available(iOS 26.0, \*)  
struct NativeSlidingGlassTabBar: View {  
    @Binding var selectedIndex: Int  
    let tabs: \[FlowTab\] \= FlowTab.allCases  
      
    var body: some View {  
        ZStack {  
            // Couche 1 : UISegmentedControl fournissant la bulle glissante native iOS 26 et l'haptique  
            InteractiveSegmentedGlassBridge(  
                selectedIndex: \$selectedIndex,  
                segmentCount: tabs.count  
            )  
            .frame(height: 56\)  
              
            // Couche 2 : Icônes et textes SwiftUI personnalisés laissant passer les touchers  
            HStack(spacing: 0\) {  
                ForEach(Array(tabs.enumerated()), id: \\.element.id) { index, tab in  
                    let isSelected \= (selectedIndex \== index)  
                    VStack(spacing: 3\) {  
                        Image(systemName: tab.icon)  
                            .font(.system(size: 20, weight: .semibold))  
                        Text(tab.rawValue)  
                            .font(.system(size: 11, weight: .semibold))  
                    }  
                    .foregroundStyle(isSelected ? Color.blue : Color.primary)  
                    .frame(maxWidth: .infinity, maxHeight: .infinity)  
                }  
            }  
            .allowsHitTesting(false)  
            .padding(.horizontal, 6\)  
        }  
        // Hauteur strictement \< 65pt (56pt) avec effet Liquid Glass interactif natif  
        .frame(height: 56\)  
        .glassEffect(.regular.interactive(), in: .capsule)  
    }  
}

private struct InteractiveSegmentedGlassBridge: UIViewRepresentable {  
    @Binding var selectedIndex: Int  
    let segmentCount: Int  
      
    func makeUIView(context: Context) \-\> UISegmentedControl {  
        let items \= Array(repeating: "", count: segmentCount)  
        let control \= UISegmentedControl(items: items)  
        control.selectedSegmentIndex \= selectedIndex  
        control.backgroundColor \= .clear  
        control.selectedSegmentTintColor \= UIColor.label.withAlphaComponent(0.10)  
        control.addTarget(  
            context.coordinator,  
            action: \#selector(Coordinator.valueChanged(\_:)),  
            for: .valueChanged  
        )  
        return control  
    }  
      
    func updateUIView(\_ uiView: UISegmentedControl, context: Context) {  
        if uiView.selectedSegmentIndex \!= selectedIndex {  
            uiView.selectedSegmentIndex \= selectedIndex  
        }  
    }  
      
    func makeCoordinator() \-\> Coordinator {  
        Coordinator(selectedIndex: \$selectedIndex)  
    }  
      
    final class Coordinator: NSObject {  
        var selectedIndex: Binding\<Int\>  
        init(selectedIndex: Binding\<Int\>) { self.selectedIndex \= selectedIndex }  
          
        @objc func valueChanged(\_ sender: UISegmentedControl) {  
            selectedIndex.wrappedValue \= sender.selectedSegmentIndex  
        }  
    }  
}

### **4\. Implémentation Pure UIKit (UIGlassEffect, UIGlassContainerEffect et UISheetPresentationController)**

Si certains modules de Flow sont écrits directement en UIKit, l'implémentation repose sur UIGlassEffect injecté dans un UIVisualEffectView, combiné à UICornerConfiguration pour la concentricité des coins et à UISheetPresentationController configuré avec largestUndimmedDetentIdentifier et prefersScrollingExpandsWhenScrolledToEdge9.

Swift  
import UIKit  
import MapKit

@available(iOS 26.0, \*)  
final class FlowUIKitHostViewController: UIViewController {  
    private let mapView \= MKMapView()  
    private var floatingTabBarEffectView: UIVisualEffectView\!  
      
    override func viewDidLoad() {  
        super.viewDidLoad()  
        setupFullScreenMap()  
        setupTopRightGlassControls()  
    }  
      
    override func viewDidAppear(\_ animated: Bool) {  
        super.viewDidAppear(animated)  
        presentPersistentSheetWithOverlayTabBar()  
    }  
      
    private func setupFullScreenMap() {  
        mapView.translatesAutoresizingMaskIntoConstraints \= false  
        view.addSubview(mapView)  
        NSLayoutConstraint.activate(\[  
            mapView.topAnchor.constraint(equalTo: view.topAnchor),  
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor),  
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),  
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor)  
        \])  
    }  
      
    private func setupTopRightGlassControls() {  
        // Conteneur de fusion Liquid Glass en UIKit  
        let containerEffect \= UIGlassContainerEffect()  
        containerEffect.spacing \= 16.0  
        let containerVisualView \= UIVisualEffectView(effect: containerEffect)  
        containerVisualView.translatesAutoresizingMaskIntoConstraints \= false  
        view.addSubview(containerVisualView)  
          
        // Pilule de verre interactive pour les boutons Carte / Localisation  
        let glassEffect \= UIGlassEffect()  
        glassEffect.isInteractive \= true  
        let pillGlassView \= UIVisualEffectView(effect: glassEffect)  
        pillGlassView.translatesAutoresizingMaskIntoConstraints \= false  
        pillGlassView.cornerConfiguration \= .corners(radius: .fixed(22))  
        pillGlassView.clipsToBounds \= true  
          
        containerVisualView.contentView.addSubview(pillGlassView)  
          
        NSLayoutConstraint.activate(\[  
            containerVisualView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),  
            containerVisualView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: \-16),  
            containerVisualView.widthAnchor.constraint(equalToConstant: 44),  
            containerVisualView.heightAnchor.constraint(equalToConstant: 96),  
              
            pillGlassView.topAnchor.constraint(equalTo: containerVisualView.contentView.topAnchor),  
            pillGlassView.bottomAnchor.constraint(equalTo: containerVisualView.contentView.bottomAnchor),  
            pillGlassView.leadingAnchor.constraint(equalTo: containerVisualView.contentView.leadingAnchor),  
            pillGlassView.trailingAnchor.constraint(equalTo: containerVisualView.contentView.trailingAnchor)  
        \])  
    }  
      
    private func presentPersistentSheetWithOverlayTabBar() {  
        guard presentedViewController \== nil else { return }  
          
        let sheetVC \= FlowPeopleSheetViewController()  
        sheetVC.modalPresentationStyle \= .pageSheet  
        sheetVC.isModalInPresentation \= true // Empêche la fermeture par balayage  
          
        if let sheet \= sheetVC.sheetPresentationController {  
            let collapsedDetent \= UISheetPresentationController.Detent.custom(identifier: .init("collapsedBar")) { \_ in  
                return 84.0  
            }  
            sheet.detents \= \[collapsedDetent, .medium(), .large()\]  
            sheet.selectedDetentIdentifier \= .medium  
            // Permet d'interagir avec la carte jusqu'au palier .medium  
            sheet.largestUndimmedDetentIdentifier \= .medium  
            sheet.prefersGrabberVisible \= true  
            sheet.prefersScrollingExpandsWhenScrolledToEdge \= false  
            // Coins concentriques avec le matériel de l'écran iOS 26  
            sheet.preferredCornerRadius \= nil  
        }  
          
        present(sheetVC, animated: true)  
    }  
}

@available(iOS 26.0, \*)  
final class FlowPeopleSheetViewController: UIViewController {  
    private let scrollView \= UIScrollView()  
      
    override func viewDidLoad() {  
        super.viewDidLoad()  
        view.backgroundColor \= .clear  
          
        // Configuration de l'effet de bord de défilement Liquid Glass d'iOS 26  
        scrollView.frame \= view.bounds  
        scrollView.autoresizingMask \= \[.flexibleWidth, .flexibleHeight\]  
        scrollView.topEdgeEffect.style \= .automatic  
        scrollView.bottomEdgeEffect.style \= .hard  
        view.addSubview(scrollView)  
          
        // Création de la Tab Bar flottante en verre au bas de la feuille  
        let tabGlass \= UIGlassEffect()  
        tabGlass.isInteractive \= true  
          
        let tabBarVisualView \= UIVisualEffectView(effect: tabGlass)  
        tabBarVisualView.translatesAutoresizingMaskIntoConstraints \= false  
        tabBarVisualView.cornerConfiguration \= .corners(radius: .containerConcentric())  
        tabBarVisualView.clipsToBounds \= true  
        view.addSubview(tabBarVisualView)  
          
        // Enregistrement de l'interaction de bord pour que la ScrollView réfracte sous la Tab Bar  
        let edgeInteraction \= UIScrollEdgeElementContainerInteraction()  
        tabBarVisualView.addInteraction(edgeInteraction)  
          
        NSLayoutConstraint.activate(\[  
            tabBarVisualView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),  
            tabBarVisualView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: \-16),  
            tabBarVisualView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: \-6),  
            // Hauteur \< 65pt pour préserver le matériau fin  
            tabBarVisualView.heightAnchor.constraint(equalToConstant: 58\)  
        \])  
    }  
}

## **Directives Techniques et Contraintes Système pour l'Agent Argon (Antigravity)**

Pour garantir une génération de code exempte de régressions lors de la transmission de ce dossier technique à l'agent Argon sur Antigravity, l'intégration au sein du projet Flow doit obéir à un ensemble strict de garde-fous architecturaux. En premier lieu, toute tentative de simuler le verre par des matériaux d'ancienne génération tels: 140, 143\]. Toutes les surfaces en verre personnalisées — incluant la barre d'onglets inférieure, la pilule de boutons sur que .background(.ultraThinMaterial), .background(.thinMaterial), UIBlurEffect(style: .systemUltraThinMaterial) ou des bordures blanches semi-transparentes (stroke(Color.white.opacity(0.3))) doit être formellement proscrite sur les cibles iOS 26 \[cite la carte et le bouton d'ajout circulaire \+ — doivent exclusivement invoquer .glassEffect(\_:in:) en SwiftUI ou UIGlassEffect en UIKit, en isolant si nécessaire les versions antérieures du système derrière une condition \#available(iOS 26, \*)29.  
En second lieu, la configuration de la feuille modale ne doit comporter aucun modificateur .presentationBackground personnalisé6. L'agent ne doit jamais injecter .presentationBackground(.glass) (qui échoue à la compilation car .glass n'appartient pas à ShapeStyle) ni .presentationBackground(Color.white)4. En l'absence de fond explicite, iOS 26 applique automatiquement le matériau Liquid Glass concentrique aux paliers partiels et gère nativement la transition vers un fond opaque au palier .large, à condition que les vues défilantes internes (List, ScrollView ou Form) déclarent .scrollContentBackground(.hidden)10.  
Enfin, l'agent Argon doit respecter scrupuleusement la géométrie et l'ordre des modificateurs SwiftUI30. Le modificateur .glassEffect(.regular.interactive(), in: .capsule) doit systématiquement figurer en fin de chaîne après .padding() et .frame(), tout en maintenant la hauteur totale de layout de la barre d'onglets flottante strictement sous le plafond de ![][image2] (en ciblant ![][image16] à ![][image5]) pour préserver le matériau fin du UIVisualEffectView2. Tous les éléments en verre proches doivent être regroupés dans un GlassEffectContainer(spacing:) unique4, et la feuille doit associer .presentationDetents(\[.height(84), .medium, .large\], selection: \$selectedDetent) avec .presentationBackgroundInteraction(.enabled(upThrough: .medium)), .presentationContentInteraction(.scrolls) et .interactiveDismissDisabled(true) afin de garantir une manipulation simultanée fluide de la carte, de la liste et de la barre d'onglets6.

| Règle d'Ingénierie pour Argon | Implémentation Requise (Valide iOS 26\) | Anti-Pattern Interdit (À Bloquer) | Justification Technique |
| :---- | :---- | :---- | :---- |
| **Matériau des Contrôles Flottants** | .glassEffect(.regular.interactive(), in: .capsule)13 | .background(.ultraThinMaterial) \+ .overlay(Stroke...)29 | Utilise le vrai moteur de réfraction et de rebond tactile d'iOS 267. |
| **Arrière-plan de la .sheet** | Aucun .presentationBackground \+ .scrollContentBackground(.hidden) | .presentationBackground(.glass) ou Color.white4 | .glass ne compile pas sur ShapeStyle ; iOS 26 applique déjà le verre nativement aux petits paliers10. |
| **Hauteur de la Tab Bar Flottante** | height totale de layout entre ![][image17] et ![][image8] (![][image6])2 | height ![][image9]2 | Au-delà de ![][image18], UIVisualEffectView force un matériau lourd et écrase les teintes2. |
| **Groupement d'Éléments en Verre** | Envelopper dans GlassEffectContainer(spacing:)4 | Vues .glassEffect() adjacentes non conteneurisées7 | Évite les artefacts d'auto-échantillonnage et mutualise le rendu GPU4. |
| **Interaction Carte \+ Liste** | .presentationBackgroundInteraction(.enabled(upThrough: .medium)) \+ .scrolls32 | Valeur upThrough absente du tableau presentationDetents54 | Toute désynchronisation des paliers bloque les gestes sur la carte en arrière-plan25. |

#### **Sources des citations**

> 1. Understanding GlassEffectContainer in iOS 26 \- DEV Community, [https\://dev.to/arshtechpro/understanding-glasseffectcontainer-in-ios-26-2n8p](https://dev.to/arshtechpro/understanding-glasseffectcontainer-in-ios-26-2n8p)  
> 2. iOS 26: How to achieve TabView/sheet effect like in the Find My app, [https\://stackoverflow.com/questions/79660575/ios-26-how-to-achieve-tabview-sheet-effect-like-in-the-find-my-app](https://stackoverflow.com/questions/79660575/ios-26-how-to-achieve-tabview-sheet-effect-like-in-the-find-my-app)  
> 3. Adopting Liquid Glass \| Apple Developer Documentation, [https\://developer.apple.com/documentation/technologyoverviews/adopting-liquid-glass](https://developer.apple.com/documentation/technologyoverviews/adopting-liquid-glass)  
> 4. iOS 26 Liquid Glass: Comprehensive Swift/SwiftUI Reference \- GitHub, [https\://github.com/conorluddy/LiquidGlassReference](https://github.com/conorluddy/LiquidGlassReference)  
> 5. Shapes in glassEffect with SwiftUI and iOS 26 \- DevTechie, [https\://www\.devtechie.com/blog/shapes-in-glasseffect-with-swiftui-and-ios-26](https://www.devtechie.com/blog/shapes-in-glasseffect-with-swiftui-and-ios-26)  
> 6. Exploring Interactive Bottom Sheets in SwiftUI \- Create with Swift, [https\://www\.createwithswift.com/exploring-interactive-bottom-sheets-in-swiftui/](https://www.createwithswift.com/exploring-interactive-bottom-sheets-in-swiftui/)  
> 7. Liquid Glass in SwiftUI: A Practical Guide for iOS 27 \- Spaceport, [https\://spaceport.build/blog/liquid-glass-swiftui](https://spaceport.build/blog/liquid-glass-swiftui)  
> 8. SwiftUI Sheet: Modal, Bottom, and full screen presentation in iOS, [https\://www\.swiftyplace.com/blog/swiftui-sheets-modals-bottom-sheets-fullscreen-presentation-in-ios](https://www.swiftyplace.com/blog/swiftui-sheets-modals-bottom-sheets-fullscreen-presentation-in-ios)  
> 9. What's New in UIKit \- Seb Vidal, [https\://sebvidal.com/blog/whats-new-in-uikit-26/](https://sebvidal.com/blog/whats-new-in-uikit-26/)  
> 10. Apple Liquid Glass in iOS 26: Complete SwiftUI Implementation Guide, [https\://getskyscraper.com/blog/apple-liquid-glass-ios-26-swiftui-guide](https://getskyscraper.com/blog/apple-liquid-glass-ios-26-swiftui-guide)  
> 11. Build a SwiftUI app with the new design \- WWDCNotes, [https\://wwdcnotes.com/documentation/wwdc25-323-build-a-swiftui-app-with-the-new-design/](https://wwdcnotes.com/documentation/wwdc25-323-build-a-swiftui-app-with-the-new-design/)  
> 12. TabBar Above Bottom Sheet \- SwiftUI iOS26 \- Reddit, [https\://www\.reddit.com/r/SwiftUI/comments/1ld6x9o/tabbar\_above\_bottom\_sheet\_swiftui\_ios26/](https://www.reddit.com/r/SwiftUI/comments/1ld6x9o/tabbar_above_bottom_sheet_swiftui_ios26/)  
> 13. GitHub \- unionst/union-tab-view, [https\://github.com/unionst/union-tab-view](https://github.com/unionst/union-tab-view)  
> 14. Glassifying custom SwiftUI views \- Swift with Majid, [https\://swiftwithmajid.com/2025/07/16/glassifying-custom-swiftui-views/](https://swiftwithmajid.com/2025/07/16/glassifying-custom-swiftui-views/)  
> 15. Bottom Sheet above Tab Bar like Find My app? \- Stack Overflow, [https\://stackoverflow.com/questions/78594926/bottom-sheet-above-tab-bar-like-find-my-app](https://stackoverflow.com/questions/78594926/bottom-sheet-above-tab-bar-like-find-my-app)  
> 16. UISheetPresentationController with a tabBar \- Stack Overflow, [https\://stackoverflow.com/questions/72704414/uisheetpresentationcontroller-with-a-tabbar](https://stackoverflow.com/questions/72704414/uisheetpresentationcontroller-with-a-tabbar)  
> 17. definesPresentationContext \| Apple Developer Documentation, [https\://developer.apple.com/documentation/uikit/uiviewcontroller/definespresentationcontext](https://developer.apple.com/documentation/uikit/uiviewcontroller/definespresentationcontext)  
> 18. Mastering Modal Presentation in UIKit for iOS Developers \| Swiftyn, [https\://www\.swiftyn.com/articles/uikit-modal-presentation-mastery](https://www.swiftyn.com/articles/uikit-modal-presentation-mastery)  
> 19. SwiftUI \- Background color for view of tab item \- Stack Overflow, [https\://stackoverflow.com/questions/76658863/swiftui-background-color-for-view-of-tab-item](https://stackoverflow.com/questions/76658863/swiftui-background-color-for-view-of-tab-item)  
> 20. UISheetPresentationController Underneath Tab Bar \- Stack Overflow, [https\://stackoverflow.com/questions/73085277/uisheetpresentationcontroller-underneath-tab-bar](https://stackoverflow.com/questions/73085277/uisheetpresentationcontroller-underneath-tab-bar)  
> 21. Exploring tab bars on iOS 26 with Liquid Glass \- Donny Wals, [https\://www\.donnywals.com/exploring-tab-bars-on-ios-26-with-liquid-glass/](https://www.donnywals.com/exploring-tab-bars-on-ios-26-with-liquid-glass/)  
> 22. Custom iOS TabBar with system-like selection animation (sliding, [https\://www\.reddit.com/r/SwiftUI/comments/1sttts6/custom\_ios\_tabbar\_with\_systemlike\_selection/](https://www.reddit.com/r/SwiftUI/comments/1sttts6/custom_ios_tabbar_with_systemlike_selection/)  
> 23. 如何实现UISheetPresentationController展示时不遮挡tabBar \- 火山引擎, [https\://www\.volcengine.com/article/2860359](https://www.volcengine.com/article/2860359)  
> 24. visionOS: Adding Glass Effect Behind SwiftUI Views \- YouTube, [https\://www\.youtube.com/watch?v=DvERp4lD1rM](https://www.youtube.com/watch?v=DvERp4lD1rM)  
> 25. [https\://github.com/claesjacobsson/FindMyLab](https://github.com/claesjacobsson/FindMyLab)  
> 26. how do we recreate this liquid glass segmented tab bar thats in, [https\://www\.reddit.com/r/SwiftUI/comments/1se3d40/how\_do\_we\_recreate\_this\_liquid\_glass\_segmented/](https://www.reddit.com/r/SwiftUI/comments/1se3d40/how_do_we_recreate_this_liquid_glass_segmented/)  
> 27. UIKit updates \| Apple Developer Documentation, [https\://developer.apple.com/documentation/updates/uikit](https://developer.apple.com/documentation/updates/uikit)  
> 28. Glass effect \| Explore SwiftUI, [https\://exploreswiftui.com/library/view/glass-effect](https://exploreswiftui.com/library/view/glass-effect)  
> 29. Liquid Glass in SwiftUI & UIKit \- Medium, [https\://medium.com/icommunity/liquid-glass-in-swiftui-uikit-77d480db1d29](https://medium.com/icommunity/liquid-glass-in-swiftui-uikit-77d480db1d29)  
> 30. 将Liquid Glass应用于自定义视图, [https\://developer.apple.com/cn/documentation/swiftui/applying-liquid-glass-to-custom-views](https://developer.apple.com/cn/documentation/swiftui/applying-liquid-glass-to-custom-views)  
> 31. UIKit-Implementing-Liquid-Glass-Design.md \- GitHub, [https\://github.com/artemnovichkov/xcode-26-system-prompts/blob/main/AdditionalDocumentation/UIKit-Implementing-Liquid-Glass-Design.md](https://github.com/artemnovichkov/xcode-26-system-prompts/blob/main/AdditionalDocumentation/UIKit-Implementing-Liquid-Glass-Design.md)  
> 32. design-thesis/APPLE\_NATIVE.md at main \- tszaks \- GitHub, [https\://github.com/tszaks/design-thesis/blob/main/APPLE\_NATIVE.md](https://github.com/tszaks/design-thesis/blob/main/APPLE_NATIVE.md)  
> 33. glassEffect(\_:in:) \| Apple Developer Documentation, [https\://developer.apple.com/documentation/swiftui/view/glasseffect(\_:in:)](https://developer.apple.com/documentation/swiftui/view/glasseffect\(_:in:\))  
> 34. glassBackgroundEffect(\_:in:displayMode:) \| Apple Developer, [https\://developer.apple.com/fr/documentation/swiftui/view/glassbackgroundeffect(\_:in:displaymode:)](https://developer.apple.com/fr/documentation/swiftui/view/glassbackgroundeffect\(_:in:displaymode:\))  
> 35. glassBackgroundEffect(in:displayMode:) \- Apple Developer, [https\://developer.apple.com/documentation/swiftui/view/glassbackgroundeffect(in:displaymode:)](https://developer.apple.com/documentation/swiftui/view/glassbackgroundeffect\(in:displaymode:\))  
> 36. Glass \| Apple Developer Documentation, [https\://developer.apple.com/documentation/swiftui/glass](https://developer.apple.com/documentation/swiftui/glass)  
> 37. How to access clear Liquid Glass Effect? \- Apple Developer, [https\://developer.apple.com/forums/thread/787414](https://developer.apple.com/forums/thread/787414)  
> 38. interactive(\_:) \| Apple Developer Documentation, [https\://developer.apple.com/documentation/swiftui/glass/interactive(\_:)](https://developer.apple.com/documentation/swiftui/glass/interactive\(_:\))  
> 39. swiftui \- glassEffect not visible on button \- Stack Overflow, [https\://stackoverflow.com/questions/79796454/glasseffect-not-visible-on-button](https://stackoverflow.com/questions/79796454/glasseffect-not-visible-on-button)  
> 40. Liquid Glass (Grade A) \- Claude Skill \- Skills Directory, [https\://www\.skillsdirectory.com/skills/stanfish06-liquid-glass](https://www.skillsdirectory.com/skills/stanfish06-liquid-glass)  
> 41. DefaultGlassEffectShape \| Apple Developer Documentation, [https\://developer.apple.com/documentation/swiftui/defaultglasseffectshape](https://developer.apple.com/documentation/swiftui/defaultglasseffectshape)  
> 42. glassEffect SwiftUI Modifier \- iOS Compatibility, [https\://ioscompatibility.com/modifiers/glass-effect](https://ioscompatibility.com/modifiers/glass-effect)  
> 43. カスタムビューにLiquid Glassを適用する \- Apple Developer, [https\://developer.apple.com/jp/documentation/swiftui/applying-liquid-glass-to-custom-views](https://developer.apple.com/jp/documentation/swiftui/applying-liquid-glass-to-custom-views)  
> 44. GlassEffectContainer \| Apple Developer Documentation, [https\://developer.apple.com/documentation/swiftui/glasseffectcontainer](https://developer.apple.com/documentation/swiftui/glasseffectcontainer)  
> 45. Mastering iOS 26's Liquid Glass: A Comprehensive Developer's, [https\://medium.com/@jaikrishnavj/mastering-ios-26s-liquid-glass-a-comprehensive-developer-s-handbook-2bba9965b024](https://medium.com/@jaikrishnavj/mastering-ios-26s-liquid-glass-a-comprehensive-developer-s-handbook-2bba9965b024)  
> 46. Appearance customization \| Apple Developer Documentation, [https\://developer.apple.com/documentation/uikit/appearance-customization](https://developer.apple.com/documentation/uikit/appearance-customization)  
> 47. UIVisualEffect \| Apple Developer Documentation, [https\://developer.apple.com/documentation/uikit/uivisualeffect](https://developer.apple.com/documentation/uikit/uivisualeffect)  
> 48. UIGlassEffect \| Apple Developer Documentation, [https\://developer.apple.com/documentation/uikit/uiglasseffect](https://developer.apple.com/documentation/uikit/uiglasseffect)  
> 49. UIGlassContainerEffect \| Apple Developer Documentation, [https\://developer.apple.com/documentation/uikit/uiglasscontainereffect](https://developer.apple.com/documentation/uikit/uiglasscontainereffect)  
> 50. Newest 'uikit' Questions \- Page 3 \- Stack Overflow, [https\://stackoverflow.com/questions/tagged/uikit?tab=Newest\&page=3](https://stackoverflow.com/questions/tagged/uikit?tab=Newest&page=3)  
> 51. BottomSheet \- Expo documentation, [https\://docs.expo.dev/versions/latest/sdk/ui/swift-ui/bottomsheet/](https://docs.expo.dev/versions/latest/sdk/ui/swift-ui/bottomsheet/)  
> 52. SwiftUI: Some Really Interesting (Annoying) Glass Effect Tint Behavior, [https\://medium.com/@itsuki.enjoy/swiftui-some-really-interesting-annoying-glass-effect-tint-behavior-58aea8bf8866](https://medium.com/@itsuki.enjoy/swiftui-some-really-interesting-annoying-glass-effect-tint-behavior-58aea8bf8866)  
> 53. How Can You Use presentationBackgroundInteraction in SwiftUI?, [https\://www\.bigmountainstudio.com/blog/presentationbackgroundinteraction](https://www.bigmountainstudio.com/blog/presentationbackgroundinteraction)  
> 54. .presentationBackgroundInteraction() bugged 18.0 and 18.1 : r/SwiftUI, [https\://www\.reddit.com/r/SwiftUI/comments/1i98anc/presentationbackgroundinteraction\_bugged\_180\_and/](https://www.reddit.com/r/SwiftUI/comments/1i98anc/presentationbackgroundinteraction_bugged_180_and/)  
> 55. enabled(upThrough:) \| Apple Developer Documentation, [https\://developer.apple.com/documentation/swiftui/presentationbackgroundinteraction/enabled(upthrough:)](https://developer.apple.com/documentation/swiftui/presentationbackgroundinteraction/enabled\(upthrough:\))  
> 56. SwiftUI Modal Sheets: From Basic Presentations to Advanced iOS, [https\://dev.to/swift\_pal/swiftui-modal-sheets-from-basic-presentations-to-advanced-customization-1834](https://dev.to/swift_pal/swiftui-modal-sheets-from-basic-presentations-to-advanced-customization-1834)  
> 57. Customizing SwiftUI Bottom Sheet's Background and Scrolling, [https\://www\.appcoda.com/swiftui-bottom-sheet-background/](https://www.appcoda.com/swiftui-bottom-sheet-background/)  
> 58. Liquid Glass Custom Tab Bar with Action Button(updated) \- Reddit, [https\://www\.reddit.com/r/SwiftUI/comments/1vzsmy4/liquid\_glass\_custom\_tab\_bar\_with\_action/](https://www.reddit.com/r/SwiftUI/comments/1vzsmy4/liquid_glass_custom_tab_bar_with_action/)  
> 59. prefersScrollingExpandsWhenSc, [https\://developer.apple.com/documentation/uikit/uisheetpresentationcontroller/prefersscrollingexpandswhenscrolledtoedge](https://developer.apple.com/documentation/uikit/uisheetpresentationcontroller/prefersscrollingexpandswhenscrolledtoedge)

[image1]: <data:image/png;base64,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>

[image2]: <data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAFEAAAAVCAYAAAA+RgJMAAADGUlEQVR4Xu2XS8hNURTHl/crjxSSgTIgEgpFJkwkj1AkMwaKInxlICIh8koYUCRhoCgZKFKGorwyUihvktdAJl7r/6217llnffveey7X90XnV//uXv+9zj5nr3vu3vsSlZSUlJSU/EX6sh6zfrLuhL71rHOsMRqPZp1Rv735QR1z37osIyleN423sj5Xeol2kPR73XX97cVCknt/jR0NcDkazWAQyYP1dJ4VykBRD7FOsTazuri+9mZENBrEz6tpxIKB3iFG4WYE71+kM7Wda1PAoA+0PZVkbYxsosaL2J+1krWftUu9FayzrEmWFOjE2sN6Sdk1nuWs3azzGiMfY+5lHVYPc8A9kOsZwvpGMt/Zqpm5DKK1rEesC6wJrIP57jTYIDAobnqf1Yd1RD3PRtZO9U/q57FcRluGsY5StoZh/AEkk4H3MUttZZr6vTQeqPG4SoZMCh42F9CddUC9h6wPJG8bliZ4uKfRQrIcwUcbWu368TxjXXyTZDOty1KSQWPR8JB+8cYNr7gY4JrtwUuBvNfB66f+cechXuJisEp9jy+i92LepYS3OOEZ8OMyVqiIc0kufhX86+rXIvXgKZDzNJqUvx4/3dRY+LnCx5dtFC0iChC9ekWEMPc5oa8mw0kuxJnPY9/iZI0xmch3qv5AHuSkiohC2PVPXDsC/2qIixQRc4perSLieGfPZBqZy6gBkuNri7OUHwTt91l3xav2QB7kpIror7/o2p4eJP4J5yEuUsTTCW9R8G64NpYYYzylx6wKErEjee6pb6C9wcXmFbkJcqoV8a22h2o8MetuxZabeIYtUsTUm7ggeH5zi7mDE15VsCPFZMTbXPyF5FBuTCfJGeW8atgEsSsbL9TzXKN0cew4471UXhwPS0D0uqqHkwDwmyf8eS6eQrLbF2YNySD23zl1RsPP2R4WKvrPAbl4E23zgG7nMjLmU5aDNXeW60MB8Aw4Q0KfSH6C70i+FAht5KEP8XPWG5I/C8YWyu6BI53xjLXP9d1yfR2OFbHkD0AR8S2X/AbYLPB3EUXEGrYu3/1/8AuC6AEEcsv5xQAAAABJRU5ErkJggg==>

[image3]: <data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABMAAAAVCAYAAACkCdXRAAAAwElEQVR4XmNgGAWDCsQA8U8g/o+E3yDJ/0KTu40khxO4MUAUP0UT5wbif0DMhSZOEMBsRxcjC6xkgGhuhvJBbGaENGmAkQHhum9ALIAqTTr4zQAxzB5dghxwkgFi2D10CVLBLCAuZ8AeESSBHCBeAmXDIgJkMMnABYhPI/GRI4IkoAHEL9AFGRApXwJdAhtgB+L5DBANbGhyIFDMAJF7hi6BDm4B8QcgfgvEH4H4K6o0wzuoOIgG4c9AXImiYmQBAL/YNZBwWhalAAAAAElFTkSuQmCC>

[image4]: <data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAVCAYAAAA0GqweAAABsElEQVR4Xu2Vuy8EURTGj0cnQSIigkg0HrVOQ6NQKfgTJAoFEoUQCkSlUZFIREKhUGgIhUahEMSf4JEgISrReH0n91x75szOZGYnm2yxv+TL3vudc89+u7MzS1SmTJlETEH7UI/su6Fd8aNoh36tWSyWyb2Z1k2gI4zvy8KRNaJYhNahHWgeqgqWQ5xCH5Q9YOLzHGrAmhG0QofQK6V4gzxUUorzc5Q8oB9qA9ZB49AatCreGLQH9fomoQn6Ind+SDQY6DDMQivkDmzL62agw3EAtcnaBmyBNsT7hG6henJh2HvPtdI0uZ8T+7xmTah6CG44MR4fXlL7BuhM7W1AD3tPxqsVf0t5o+IVDB/WA+ywuIB31qTwvFQBK6wBvik3gC93l6oxaQP+UIaA3PiWx/MDjqFzI1/ntb50UQHtNzhi9hdqHYIbZ/J4cZ8wqh4X8EXth8Xz6JsoBD90G9W+n9zhTuVZ4gKy+O71PIqnqRavT/Z858fCl9gPZ3UEy/9cQ8/Qg4jXl6ruv0F+FvpZV6quWaBcT42pFQ0fsGThgPfWLAWayf1lckB+pEwGy4XxBzBxjDbGoWdnAAAAAElFTkSuQmCC>

[image5]: <data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAVCAYAAAA0GqweAAAByUlEQVR4Xu2VPyhFcRTHTyIi/wZJBlmUMpLEbJDBwGCzKAMlqyIZTCaSwSIMVoPVyEL+rAwkUkoWSv6dr9/5eeeee+97976iN7xPfeuez+/ce0/33d99REWKFElFNeeK88U5MWugj/NIbv2IUxJc/lvGyN24TOp5zvPvKtEKZ03VL+T6W5VLy74VcTSQu1mFcqgRXXer2jvdk5bE50bdqFIdV1F0T5RLCl6PxOei8UKOe8i9i5ZFTq9xesBazgRnmbMkbpyzw+mU2tPIeSd37oCkP9ChaCfXiAudkXtaq+JygZ5POW7mrIt7JXetOnLDwD1JH5jhbIrHMTKp1gOMUvRPhRvjRnGckztHvwoA7t64GvEbyo2Iy8kgucY74w/ER4HNgjVsLgv8tZUUfgiJB2wh17ht/J74LuPrxZcb74kbEL9IXgMCNO4ah28UfJtyUTtvy9RxA9onOGzqQ3UcAo2Xxp2K1/gNofkwdbYBH1Q9JM6jN1GIDgoPg3pB1W/ioqLxDrvXcytOUyrOf7qybcgfpsid4P+L/bcM4BNih/KxF4bDE8T5vuc40JFhjjI9+Lz9C37AggUD3lhZCDRxZskNiM00HVzOj2/Yf5PU1fPZgwAAAABJRU5ErkJggg==>

[image6]: <data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADsAAAATCAYAAAAu2nXoAAAAi0lEQVR4Xu3UMQrCQBhE4RgtDEgawcYLeBivkTuJt5C0nkAC6dJKihRpAkKsYuHbdk6gw//ga3bKXTbLoiiKoujnO+uBY1csOOng1B0vHHRwaYMOPQrZbCoxokEum01HvFHr4Fj6dD646OBcuuEZNx2c22HAAyvZbFujxRNb2axLT3vCXgfnKj34l77oUxIhB9mTVgAAAABJRU5ErkJggg==>

[image7]: <data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAATCAYAAADiQ08DAAABxklEQVR4Xu2VPSwEURDHx1cixEcjCoVEQYiSQjQ0ClEoKHQaiYKCRCGECKLSiIJEIhIKrUKiUqp8RUshEaIQUYjG18zNzO3s3N7tiaO6X/LPvfnP7Huzt/veAuTJkycrJlD7qBaJm1G74nsqUDeoL9SZy/0ZS8ALWp2HKphh4FyJxPOol2Q2Nxx6g6CF1lA7qFlUUTidoAa4uVLj6c3kksj5qKlubzqimilz8W8phNQ1EsxAdg1eybgD+F2Mowo1ilpFrYg3gtpDtWmRUIt6B16nV9SjyWnUsiS35XdTk8Cbhjya+BJVjloXLxN1qA3gujfga6uBmyHvOSiFSeBXjHwak8Zs8kgDgQoXZTwksW/oE3jhOOi6B+dVir9lvEHxssI21Cfj+yCd4Fj8OKjm1puQetNpGyzwBvIBQXG9jOlstByI3+58T7oG6Qlk1SCZTxGeLaYxHeYWOrPIb3S+J12Dfo0BF5/ogMwpk1DPN3htYuJC/DgyNfho4n7xlOQmegU+iJUu4MIm47WKZ6F4wXlR6M3S7lXuxLMUi9cpcWgD0iPWiUgNNimMA+f0W6xnWxz6D1K9zn8aqgiYg6CGjrN/QRv8Md+XvYshVvxlhAAAAABJRU5ErkJggg==>

[image8]: <data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAATCAYAAADiQ08DAAABtElEQVR4Xu2VvyuFYRTHTyIivwYZDLIoZSSJ2SCDgcFmUQYWfwDJYDKRDBZhsBqsRhbyY2VQIqVkoeTX+facc+95j+e9r5sf0/3Wt97zOed9ntNz3/NcopJKKqko1bIv2R/sY5eD+tn3FPKH7LJk+m81TmHjConn2I+5LNEye9XETxTq2wz7De15ADVR2KzKMMSwjXtMrMzW/Iai68U2qjbPNRSvibGfCJ9MdD3Ac3nupfAtei2w+xzLarCePcleYi8Km2Bvs7u0SNTMfqWw3qB4AIkOgXjplMJprQjLEmrePTRqYa9RqHumsH4DhWbAHvKlNMPeEI5neAqJMYG+IWyMRdN0RuEd+ymkCXW3jtUJXzdsVFhCQwJvHN8XHhOGBTkM13eE2isP6evBRBtsFbjl+K7wbscbhVc6XkhpDeJXymwQAtxxDPcReLthsSnbdHFMaQ36Exxx8YE+AF6YBHQi3Co2EG8eRFSowTsTDwtT5Yao0yUgxPMmfhEWc5a0DtOruhZmVS5Mr7PEkE5TSOp/sd5bEK4L35S60KSrUIcTxJr63lGiIq9ZytfgyvsXaYNF6xOq/47ys2DB5AAAAABJRU5ErkJggg==>

[image9]: <data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADsAAAATCAYAAAAu2nXoAAAAiUlEQVR4Xu3UoQ2DUBSF4UtqGICwQYPHkuBq8V0Bwg44BFsgmAHdIWoZASw19CTXnQnak/slv3lHXfPMQgjhxyX8oOyBLtTyoKwyP3riQdkdnWjhQVmGdvTiQVmKNvRGN9ok5ehAKw9KCvRBMw9KavOfeeRBydP8yI4HJb35kQ0PagZU8mMI/+ELb1ISMn0TnWEAAAAASUVORK5CYII=>

[image10]: <data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA4AAAATCAYAAACgADyUAAAAfElEQVR4XmNgGAUEASO6ALHAFYj/A3EWugSxwJoBYkA3ugSxQBWIfwLxMnQJYoEIEL8H4kPoEsQCDiC+D8TXgJgZTY4gEAPiD0C8A10CF1AH4l9AvAhdAhewY4CEcDu6BC4QyQDRkI0ugQvkMkA0+KFL4AMNQGyELji4AABtoBIyDMPkrwAAAABJRU5ErkJggg==>

[image11]: <data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAATCAYAAADiQ08DAAABv0lEQVR4Xu2VSytFURTHNymv8kwGRr6AIiWRiTIwQphIRmRgIEMDAwZGJpQMTCTJFzDwBSgM+AZKSSkjj+S1/mevdc46q32vw8Xo/urf3eu/191nnf06zhUpUiQzvaQ70gfphFSa7o6oJh05n3NKKkl3/x0bpE0VPzpfRKvyWtir5LiR49CLFMKhNQAe1BXwIOGBdKBicEZ6Nl6h6GdGYNlsMcB6aI+rGCyy/1tgNYLjrZB6jKcL7OM29qlmiv0G4wu1pFnSGmmVvWnSHqlTkphm0qvz4w2yBlIZBiS+c3ue446kO2KMfbs9BOzbLedznkgXpDrni4F3n6S6BdIO+2hDc6o/xaXziVUcL3PcFmd4htmfML4FOTfGq2F/W3nywnnBbCCpSXkz7LUrD4yy3298C3KurOm8rwv6ssB65xPKjS97sNv4k+xjKfORq0BsocwFhk7QLv9WON/301Ocq0A7g7IiwrFqxwdC86ba+OO6igEu1UILvFXxEHtCfIheuCMkITRbiEeMF0LGwukVrtnTlLEnVx5OfvwJCylKUOw7P6v4RT+unywgFzOIu1DGPk9lJCy5JAcfkX9BCvw2n2Igi4Z+/elIAAAAAElFTkSuQmCC>

[image12]: <data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAATCAYAAADiQ08DAAABr0lEQVR4Xu2VvSuFcRTHDxlIIQYDspoUKYksymBCWCQTGQwyGgwWk8VEWQySwWChDBaDwUv5E0ShlEkM3s635xz393yf596uS3e6n/p2f+fznPvcc59XkRIlShREq+aLpVKtOZZo27mmLL65eGAAHrDJXJXVDVaX/3T8D4csGByhF0kOCLdH7kLzRu6v8O/GaNYcaJ4k2Yh6gtyS+f8CZyPn/nwjD9hvdV/gwLT5evJOrWZOs6ZZNTej2dF0eZPRqHmXaH9DlsGwYV/TYmsecMHqzsCBcfPd5B1ctxsS9bxqrjV1Eg0D95xplUXNtnmskXnfiAv+xAtJDrhidXvgwIj5SfIMeu7J1ZjfCpz/4QQsecBZqzsCB8bMD5Bn0HPDUiIf/k7qgJuaNnI8oF+DPYEDU+ZxKnORbcBPyWPAI80pxf8Z1jgFlVYXehdnG5CPoJ8R5yxYx+Avulsnh4cq96WRa8DHoB4254Q3UYy0AdOOFupRcmn4/nD3OnfmQirM9VqNOz/GleZBc2vBGu9cZ1fzYZ/YER4/+eBHEM9CH/Yy1pFhWTI9ePcXBR/w13wDOwKKRJsNJc0AAAAASUVORK5CYII=>

[image13]: <data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACYAAAATCAYAAAD8in+wAAAB1ElEQVR4Xu2VzyttURTHlyd6L0IYkPwFoihJHhNJyoQwIJmpR36Vgd7wyeyp1xuaKBP0ihFJJqYYSolMmEiZSL3Ij7XOXvdY+9u+171k5lPfzlmfve8++9yzzz5En3ySMWWcKpRALoqPZo+zzJngXENbgm+cJ5SWac4PlEoeZ5vcAPucLL85SDn5F9zh3HCOOJ2cDs6Z9mk2/SLkbu7INUpG/OaICnJtcmdCidZf4h5hVsifWD25CQk55MaTnMY9kpBsYrecVXAHnP/gkEPyJ5bNmTW18AB1kGQTE98H7qf6VMyQ36eN027qvxR4hCFCE2tR/x38kPpi8JZC8idmF38+58TUKQlNbFJ9Hfhe9Q3gkW7OPblFPmj8ozl/FbnQKLhf6mvAd6kfAJ8OC5wmU8+RG6vfOA9pHAM3rL4WfI/6VvCvUcA5NvUGZ0vP1ziVpi1GLjQOLrHGGsHLYxEvW0km2DUXqoObsHSSNWX5qv4tbyWySP6alE0ax8A6QuQUSnJeXm3Lpvp0KSK3ryE4BtZUqvI3NlD435Fa3rh0wd8nQB8/yn+cK84F51yPl+Q+Uxb5dMkuLcfQI0/FEqcapTJPL1+Vdcp8zb6LXRTAH3I3G209zzmqcYHls1FRAAAAAElFTkSuQmCC>

[image14]: <data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADkAAAATCAYAAAAqL6XVAAAAZklEQVR4Xu3SMQ5AYAyG4SKxO4vNaLSbHJUbOIjFFYTKT1Q3Y+V9km/o16lJRQAAAPAzi2a/srqd1/oiglHTmbmRdGxluluvyXwZweQLlUs6dDBdqdnMHErtC2OW543PFO81AHxzALesDdI4rJfTAAAAAElFTkSuQmCC>

[image15]: <data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAC8AAAATCAYAAAAAn1R6AAACN0lEQVR4Xu2WzUsWURTGT23KxAitjf0PgbWIIN2ICxdChblIJEKIPigKWgVtQpAwkFyKrUIkWrlxoWs36qKgRFy06AMKd5aifXqed859O/O8c+ZtJ4g/eJh5njsz987MnTNXZJ999gQXVAc4JDo52G2aVH9Vbao11ZV8c5Vp1TMOEw9UNzk0GlWzknWyKPETeqRaV22qBqktYlt1zXn0AQ2rulRD5v+4YypMqX7IvxNu5ZsrnJSsrcF8i/mD1SMyllVzzr9VzTsfgWvh4XifaLXtquqIy2uIBr+heknZkmrL+aOS7zSB7BiHBJ/3m3y7lEyXRDR45H2UPbQ88Zp8AtkEhwSOOUHeUzNdiigafIfl5ym/anmzeexzpyDKPR9U47Z/XDXp2t5LnemSKBr8PctPU37Z8rPmo0FGOYOn+0ryUwZlcdT5UtDJbcoeW36K8ouW95uPBhnl/4O/EbzhL6o3LsuBTu5Qdt1y1GBPr+XppxENMsrrgamUqhvw1/jp9qvggLuUpTl/jvIBy1FGQTTIKC+jWzXi/AvJ/h2JwgKATjDHPYctr1dtvpFPIFvhsA6/yKMkv3Mey4ga0NF9DiXLxyibsTyBm4sGf4bDEj6rDlH2VfKDx/eWAyUKHT3lBql9ygD+UkF2w3m8ej6vjB7JCgTzRPXd+edpB+UJi6FPqo+2xZ1iyeDBMgJfP7ZF0wvgA0PbgmRVAa87WgMVgTVOBK6brsVj23Xwk+K1kgfLD3y0+JPLDlBbnlJEXtRoAAAAAElFTkSuQmCC>

[image16]: <data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAVCAYAAAA0GqweAAAB2UlEQVR4Xu2VPShGYRTHj68S+VgkGZSByMggC4tBBgODzaIMFMogIiGTRQZKSTFYDcpkNPnKykAig2SQxdf5v8953HPPva/e9y0yvL/69z7nf87z3HPve5/nEmXJkiUlxli7rEaJG1jb4ltKWFesT9aJyf0aC+QuqHUaqnAMkMsVSDzLev7Ops++NZKBC62wtljTrLxwOkEFueYKledvJlNSnoumOqxpiGumyMTpkEvR9ZIyRak1eCHjVnLvoqaMNcRaZi2JN8jaYTX7IqGS9UZuzS5RZ6jCMMlaJDdhU37XVR6bBh4uds4qZq2K56lmrYn3KnXl5JqB9xSU0ji51wk+xtCwykdAwYHxMHlexv0S27/kg1wzGtTcG69U/A3l9YmXMbqhbhnfBekEh+JrEF8bD9gbTKvBHGsw7xQsUCNjnI2aPfFblJesQTztjBtE4WOMpxfAGIe5BucY/DrlJWvQrtdr4iM1joDCiRjPNnipYnAmvuanBh9U3COeR2+iCC/kDmJPO7nJ9cprEk+DeC7Gg7B7PbfiafLFa5PYbrYI+Iv94lBtOJ1ghFzOf4v9eafxTxA5v9ZxqCJghoIaHF1/gm/w34IGb6z5H6gi98lEgzhSRsPpzPgC+BCQAw4WaBsAAAAASUVORK5CYII=>

[image17]: <data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAATCAYAAADiQ08DAAABmElEQVR4Xu2UPS8EURSGj49OgkREgUg0PmqdhkahUvATJAoNiUIIBaLSqEgkIqFQKDSEQqPYQhA/QUiQEJVofL0nc87OmTsz3Imdbp7kyd77nrN3z+7sDFFBQYEXU3Af9sq+B+5KnkYH/HbDvFim4MOs15GOONpXaY7cgFmE63AHzsOaaDnGKXyjfAZMPJOHGnTDFNrgIXymlMP+QTWlnDlH/gPqAT4DNsAJuAZXJRuHe7BPm4QW+EHBmcPikBZn4YoUt+V1U4uGA9gua58BW+EGBX3v8AY2UjAMZ69hK01T8BfjnNfspC2e6EbgxiWzb4JnZu8zoMJ9D05WL/mWycYk84IbbbP7xqwD3rohxT8jdcAqNwCfFDbz5e42NaYSA36R54AcviRk2nwMzx21zmt7mZJIG9D9BUedfUkXHM6YgmaJ30b4q275bcAnsx+RTCnfRPzQbTaFAQoau0zmknVAlu9e5V4yS61k/bLnO78MX2I9iO20RcMVfIR3Iq8vIh1x9BfkZ6GefxnpCFmgsKfOqeWGDpiZH5g0h1TAVgJ+AAAAAElFTkSuQmCC>

[image18]: <data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAATCAYAAADiQ08DAAABp0lEQVR4Xu2VvytFYRjHn0SJ/CjJgO4mysggu0EGA4PNogws/gAymWwGyqIYDAYGysBgMOiKrAwiP0rJIIvwfHuf5973POeHe7rc6XzqW+/7fZ7znO89555ziDIyMlLRwLphfbPOTc2SI9dXMSbJnbBG9gust0I1DHr/I+C+NUAruZPVel5SgEPWO8XXyyFyZlSYOrNXOli7rBcKH1MuVRQzE+aVrAfI/Rfj0AGlBGxiTbOWWUviTbG2WH3aJLSxPsnNHBYNodAjJg66ZNWzVsSz7LA6ZV1KwHbWKrm+D3Lzm8mFgfdabKU51ob4WEMzKEyIaU/2RW6o0sI68valBFTQ92i8RvHXPW9cvAAjYj4Y/1h8xR6YNuCtNSl8YSID5sTcNP6e+P2sNVZ3sPwnAXGXfg0IYG4bD+8j+F2sA9aJkf56rP3bFEVcQHsFx8z+VBcwr70CuBA/Djs8iaSAz95+VDyl8BD1mgLAftF4PmkDQnh6lXvxfKrFG5S9/5DSLLmifov1vWXBN/qJdSfC+izQEUavIGZq2Hygo8g8FXvwyqsIGjA1P7EpjbCnlOtKAAAAAElFTkSuQmCC>