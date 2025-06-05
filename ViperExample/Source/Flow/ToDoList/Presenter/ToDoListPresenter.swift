//  
//  ToDoListPresenter.swift
//  ViperExample
//
//  Created by Kostiantyn Antoniuk on 05.06.2025.
//

import Foundation

protocol ToDoListPresenterType: AnyObject {
    var numberOfRowsInSection: Int { get }
    
    func viewDidLoad()
    func cellForRowAt(_ indexPath: IndexPath) -> ToDoListEntity
    func didTapAddTask()
    func didToggleTask(at index: Int)
}

final class ToDoListPresenter: ToDoListPresenterType {
    
    private(set) weak var view: ToDoListViewType?
    private(set) var interactor: ToDoListInteractorType
    private(set) var router: ToDoListRouterType
    
    // MARK: - Protocol property
    
    var numberOfRowsInSection: Int {
        interactor.tasks.count
    }
    
    init(view: ToDoListViewType,
         interactor: ToDoListInteractorType,
         router: ToDoListRouterType) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    // MARK: - Protocol methods
    
    func viewDidLoad() {
        interactor.fetchTasks { [weak self] in
            guard let self else { return }
            view?.reloadData()
        }
    }
    
    func didTapAddTask() {
        router.showAddTaskAlert { [weak self] title in
            guard let self else { return }
            interactor.addTask(title: title)
            view?.reloadData()
        }
    }
    
    func didToggleTask(at index: Int) {
        interactor.toggleTask(at: index)
        view?.reloadData()
    }
    
    func cellForRowAt(_ indexPath: IndexPath) -> ToDoListEntity {
        interactor.tasks[indexPath.row]
    }
}

