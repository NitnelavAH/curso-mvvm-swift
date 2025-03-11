//
//  TodoEntity+CoreDataProperties.swift
//  CursoMVVMSwift
//
//  Created by Jose Valentin Abundo Hernadez on 04/03/25.
//
//

import Foundation
import CoreData


extension TodoEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TodoEntity> {
        return NSFetchRequest<TodoEntity>(entityName: "TodoEntity")
    }

    @NSManaged public var isArchived: Bool
    @NSManaged public var isCompleted: Bool
    @NSManaged public var date: Date?
    @NSManaged public var note: String?
    @NSManaged public var title: String?
    @NSManaged public var id: String?

}

extension TodoEntity : Identifiable {

}
