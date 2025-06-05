//  
//  ToDoListRouter.swift
//  ViperExample
//
//  Created by Kostiantyn Antoniuk on 05.06.2025.
//

import UIKit

protocol ToDoListRouterType {
    func showAddTaskAlert(completion: @escaping (String) -> Void)
}

class ToDoListRouter: ToDoListRouterType {
    
    private weak var viewController: ToDoListViewController?
    
    // MARK: - Protocol property
    
    init(viewController: ToDoListViewController) {
        self.viewController = viewController
    }
    
    // MARK: - Protocol methods
    
    func showAddTaskAlert(completion: @escaping (String) -> Void) {
        let alert = UIAlertController(title: "New Task", message: "Enter task title", preferredStyle: .alert)
        alert.addTextField()
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        alert.addAction(UIAlertAction(title: "Add", style: .default) { _ in
            if let title = alert.textFields?.first?.text, !title.isEmpty {
                completion(title)
            }
        })
        viewController?.present(alert, animated: true)
    }
}
