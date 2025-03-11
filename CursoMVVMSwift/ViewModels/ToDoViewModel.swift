//
//  ToDoViewModel.swift
//  CursoMVVMSwift
//
//  Created by Jose Valentin Abundo Hernadez on 04/03/25.
//

import Foundation
import CoreData
import Combine

public final class ToDoViewModel: ObservableObject {
    @Published private(set) var todos: [TodoEntity] = []
    
    var cancellables = Set<AnyCancellable>()
    private var storeContainer: NSPersistentContainer {
        return ToDoPersistenceManager.shared.container
    }
    
    init () {
        fetchToDos()
    }
    
    private func fetchToDos() {
        do {
            let request: NSFetchRequest<TodoEntity> = TodoEntity.fetchRequest()
            let sortDescriptor = NSSortDescriptor(key: "date", ascending: true)
            request.sortDescriptors = [sortDescriptor]
            request.returnsObjectsAsFaults = false
            todos = try storeContainer.viewContext.fetch(request)
        } catch {
            print("Error al recuperar ToDos: \(error)")
        }
    }
    
    private func savedata() {
        do {
            try storeContainer.viewContext.save()
            fetchToDos()
        } catch {
            print("Error al guardar ToDo: \(error)")
        }
    }
    
    private func getTodoIndex(_ todo: TodoEntity) -> Int? {
        guard
            let index = todos.firstIndex(where: {$0.id == todo.id})
        else { return nil }
        
        return index
            
    }
    
    public func validateInput(ofText text: String) -> Bool {
        guard
            text.trimmingCharacters(in: .whitespaces).count > 2
        else {
            return false
        }
        
        return true
    }
    
    public func addToDo(withTitle title: String, note: String, date: Date) {
        let newToDo = TodoEntity(context: storeContainer.viewContext)
        newToDo.id = UUID().uuidString
        newToDo.title = title
        newToDo.note = note
        newToDo.date = date
        newToDo.isArchived = false
        newToDo.isCompleted = false
        
        savedata()
        
    }
    
    public func updateToDo() {
        
    }
    
    public func updateStatus() {
        
    }
    
    public func deleteToDo() {
        
    }
    
    public func archiveToDo() {
        
    }
    
    public func unArchiveToDo() {
            
    }
}
