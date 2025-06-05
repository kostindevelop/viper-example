//  
//  ToDoListInteractor.swift
//  ViperExample
//
//  Created by Kostiantyn Antoniuk on 05.06.2025.
//

import Foundation

protocol ToDoListInteractorType {
    var tasks: [ToDoListEntity] { get }
    
    func fetchTasks(_ completion: () -> Void)
    func addTask(title: String)
    func toggleTask(at index: Int)
}

final class ToDoListInteractor: ToDoListInteractorType {
    
    private let taskManager: TaskManager
    
    // MARK: - Protocol property
    
    var tasks: [ToDoListEntity] = []
    
    init(taskManager: TaskManager) {
        self.taskManager = taskManager
    }
    
    // MARK: - Protocol methods
    
    func fetchTasks(_ completion: () -> Void) {
        taskManager.load()
        tasks = taskManager.tasks
        completion()
    }
    
    func addTask(title: String) {
        taskManager.add(title: title)
        tasks = taskManager.tasks
    }
    
    func toggleTask(at index: Int) {
        guard tasks.indices.contains(index) else { return }
        taskManager.toggle(index: index)
        tasks = taskManager.tasks
    }
}
