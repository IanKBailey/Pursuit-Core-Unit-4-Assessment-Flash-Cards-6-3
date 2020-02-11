//
//  FlashCardTabBarController.swift
//  Unit4Assessment
//
//  Created by Ian Bailey on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit

class FlashCardTabBarController: UITabBarController {

    private lazy var cardsVC: CardsViewController = {
           let viewController = CardsViewController()
           viewController.tabBarItem = UITabBarItem(title: "Cards", image: UIImage(systemName: "questionmark.circle"), tag: 0)
           return viewController
         }()
         
         private lazy var createVC: CreateViewController = {
            let viewController = CreateViewController()
            viewController.tabBarItem = UITabBarItem(title: "Create", image: UIImage(systemName: "square.and.pencil"), tag: 1)
            return viewController
          }()
         
         private lazy var searchVC: SearchViewController = {
            let viewController = SearchViewController()
            viewController.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 2)
            return viewController
          }()
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [cardsVC,
                           createVC,
                           searchVC]
        
    }
    

    

}
