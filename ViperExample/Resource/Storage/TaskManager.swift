//
//  TaskManager.swift
//  ViperExample
//
//  Created by Kostiantyn Antoniuk on 05.06.2025.
//

import Foundation

final class TaskManager {
    
    private let storage: TaskStorable

    init(storage: TaskStorable) {
        self.storage = storage
    }

    private(set) var tasks: [ToDoListEntity] = []

    func load() {
        tasks = storage.loadTasks()
    }

    func add(title: String) {
        let task = ToDoListEntity(id: UUID(), title: title, isDone: false)
        tasks.append(task)
        storage.saveTasks(tasks)
    }

    func toggle(index: Int) {
        guard tasks.indices.contains(index) else { return }
        tasks[index].isDone.toggle()
        storage.saveTasks(tasks)
    }
}
