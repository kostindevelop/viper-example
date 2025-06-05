//  
//  ToDoListEntity.swift
//  ViperExample
//
//  Created by Kostiantyn Antoniuk on 05.06.2025.
//

import Foundation

struct ToDoListEntity: Codable {
    let id: UUID
    let title: String
    var isDone: Bool
}
