//  
//  ToDoListConfigurator.swift
//  ViperExample
//
//  Created by Kostiantyn Antoniuk on 05.06.2025.
//

import UIKit

final class ToDoListAssembly {
    static func build(container: DIContainer) -> UIViewController {
        let interactor = ToDoListInteractor(
            taskManager: container.resolve(TaskManager.self)
        )

        let view = ToDoListViewController()
        let router = ToDoListRouter(viewController: view)
        let presenter = ToDoListPresenter(view: view, interactor: interactor, router: router)

        view.presenter = presenter
        return UINavigationController(rootViewController: view)
    }
}
