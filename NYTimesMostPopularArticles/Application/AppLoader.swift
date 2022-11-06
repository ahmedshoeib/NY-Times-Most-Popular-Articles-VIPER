//
//  AppLoader.swift
//  NYTimesMostPopularArticles
//
//  Created by Ahmed Shoeib on 06/11/2022.
//

import UIKit

struct AppLoader {
    private var window: UIWindow!
    private let navigationController: UINavigationController
    private let moduleFactory: ModuleFactoryProtocol
    
    init(navigationController: UINavigationController = UINavigationController(),
         moduleFactory: ModuleFactoryProtocol = ModuleFactory()) {
        self.navigationController = navigationController
        self.moduleFactory = moduleFactory
    }
    
    mutating func build(forWindow window: UIWindow, testing: Bool) {
        self.window = window
        let module = moduleFactory.createArticleMostPopularModule(using: navigationController, testing: testing)
        let viewController = module.assemble()
        setRootViewController(viewController)
    }
    
    private func setRootViewController(_ viewController: UIViewController?) {
        window.rootViewController = navigationController
        
        if let viewController = viewController {
            navigationController.pushViewController(viewController, animated: true)
        }
        
        window.makeKeyAndVisible()
    }
}

