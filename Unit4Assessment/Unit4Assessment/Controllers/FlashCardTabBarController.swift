//
//  FlashCardTabBarController.swift
//  Unit4Assessment
//
//  Created by Ian Bailey on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit
import DataPersistence

class FlashCardTabBarController: UITabBarController {
    
    private var dataPersistence = DataPersistence<Card>(filename: "savedCards.plist")
    
    
    private lazy var SavedcardsVC: SavedCardsViewController = {
           let viewController = SavedCardsViewController()
           viewController.tabBarItem = UITabBarItem(title: "Saved Cards", image: UIImage(systemName: "questionmark.circle"), tag: 0)
        viewController.dataPersistence = dataPersistence
        viewController.dataPersistence.delegate = viewController
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
            viewController.dataPersistence = dataPersistence
            
            
            return viewController
          }()
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [SavedcardsVC,
                           createVC,
                           searchVC]
        
    }
    

    

}
