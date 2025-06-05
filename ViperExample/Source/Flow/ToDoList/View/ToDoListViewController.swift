//  
//  ToDoListViewController.swift
//  ViperExample
//
//  Created by Kostiantyn Antoniuk on 05.06.2025.
//

import UIKit

protocol ToDoListViewType: AnyObject {
    func reloadData()
}

class ToDoListViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    var presenter: ToDoListPresenterType?
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoad()
        
        configureUI()
        setupTableView()
        setupAddButton()
    }
}

// MARK: - ToDoListViewType
extension ToDoListViewController: ToDoListViewType {
    func reloadData() {
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource
extension ToDoListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.numberOfRowsInSection ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let task = presenter?.cellForRowAt(indexPath) else { return .init() }
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        var config = cell.defaultContentConfiguration()
        config.text = task.title
        config.secondaryText = task.isDone ? "✅ Done" : "❌ Not done"
        
        cell.contentConfiguration = config
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension ToDoListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didToggleTask(at: indexPath.row)
    }
}

// MARK: - Private methods
private extension ToDoListViewController {
    func configureUI() {
        title = "ToDo List"
        view.backgroundColor = .white
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func setupAddButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(didTapAdd)
        )
    }
    
    @objc func didTapAdd() {
        presenter?.didTapAddTask()
    }
}
