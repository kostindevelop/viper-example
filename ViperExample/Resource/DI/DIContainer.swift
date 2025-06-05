//
//  DIContainer.swift
//  ViperExample
//
//  Created by Kostiantyn Antoniuk on 05.06.2025.
//

final class DIContainer {
    
    static let shared = DIContainer()
    
    private var factories: [String: () -> Any] = [:]
    
    func register<Service>(_ type: Service.Type, factory: @escaping () -> Service) {
        let key = "\(type)"
        factories[key] = factory
    }
    
    func resolve<Service>(_ type: Service.Type) -> Service {
        let key = "\(type)"
        guard let factory = factories[key], let service = factory() as? Service else {
            fatalError("No registered factory for type \(type)")
        }
        return service
    }
}
