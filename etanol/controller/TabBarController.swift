//
//  TabBarController.swift
//  etanol
//
//  Created by Felipe Santos on 23/05/25.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabBar()
    }
    
    func configureTabBar() {
        
        let homeViewController = HomeViewController()
        let homeNavigationController = UINavigationController(rootViewController: homeViewController)
        
        let tableViewController = TableViewController()
        let tableNavigationController = UINavigationController(rootViewController: tableViewController)
        
        homeNavigationController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), selectedImage: nil)
        tableNavigationController.tabBarItem = UITabBarItem(title: "Tabela", image: UIImage(systemName: "list.bullet"), selectedImage: nil)
        
        self.viewControllers = [homeNavigationController, tableNavigationController]
        
    }
    
}
