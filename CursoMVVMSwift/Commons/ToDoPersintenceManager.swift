//
//  ToDoPersintenceManager.swift
//  CursoMVVMSwift
//
//  Created by Jose Valentin Abundo Hernadez on 04/03/25.
//

import Foundation
import CoreData

 final class ToDoPersistenceManager {
     static let shared = ToDoPersistenceManager()
     
     let container: NSPersistentContainer
     
     private init() {
         container = NSPersistentContainer(name: "DataModel")
         container.loadPersistentStores { storeDescription, error in
             
             if let error = error {
                 print("Error cargando datos: \(error)")
             } else {
                 print("Carga de datos exitosa.")
             }
             
         }
         
     }
}
