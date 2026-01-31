#!/usr/bin/env swift
// Script pour réinitialiser la base de données CoreData

import Foundation

print("🗄️ Recherche du fichier CoreData...")

// Chemin vers le dossier de données de l'application
let libraryPath = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true).first!
let appSupportPath = (libraryPath as NSString).appendingPathComponent("Application Support")

print("🔍 Recherche dans: \(appSupportPath)")

// Supprimer tous les fichiers .sqlite CoreData
let fileManager = FileManager.default
if let enumerator = fileManager.enumerator(atPath: appSupportPath) {
    for case let file as String in enumerator {
        if file.hasSuffix(".sqlite") || file.hasSuffix(".sqlite-shm") || file.hasSuffix(".sqlite-wal") {
            let fullPath = (appSupportPath as NSString).appendingPathComponent(file)
            do {
                try fileManager.removeItem(atPath: fullPath)
                print("✅ Supprimé: \(file)")
            } catch {
                print("❌ Erreur suppression \(file): \(error)")
            }
        }
    }
}

print("\n💡 Lancez l'application pour recharger les données depuis le CSV corrigé.")
