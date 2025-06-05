//
//  UserDefaultsTaskStorage.swift
//  ViperExample
//
//  Created by Kostiantyn Antoniuk on 05.06.2025.
//

import Foundation

protocol TaskStorable {
    func loadTasks() -> [ToDoListEntity]
    func saveTasks(_ tasks: [ToDoListEntity])
}

final class UserDefaultsTaskStore: TaskStorable {
    
    private let key = "tasks_key"

    func loadTasks() -> [ToDoListEntity] {
        guard let data = UserDefaults.standard.data(forKey: key),
              let decoded = try? JSONDecoder().decode([ToDoListEntity].self, from: data) else {
            return []
        }
        return decoded
    }

    func saveTasks(_ tasks: [ToDoListEntity]) {
        if let data = try? JSONEncoder().encode(tasks) {
            UserDefaults.standard.set(data, forKey: key)
        }
    }
}
