//
//  AppDependencies.swift
//  ViperExample
//
//  Created by Kostiantyn Antoniuk on 05.06.2025.
//

import UIKit

final class AppDependencies {
    let container = DIContainer()

    init() {
        registerServices()
    }

    private func registerServices() {
        container.register(TaskStorable.self) {
            UserDefaultsTaskStore()
        }

        container.register(TaskManager.self) {
            TaskManager(storage: self.container.resolve(TaskStorable.self))
        }
    }

    func makeToDoListModule() -> UIViewController {
        ToDoListAssembly.build(container: container)
    }
}
