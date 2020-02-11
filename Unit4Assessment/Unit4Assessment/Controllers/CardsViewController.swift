//
//  CardsViewController.swift
//  Unit4Assessment
//
//  Created by Ian Bailey on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {

    
    private let cardsView = CardView()
    
    
    
    private var cards = [Card]() {
        didSet {
            DispatchQueue.main.async {
                self.cardsView.collectionView.reloadData()
            }
        }
    }
    
    
    
    override func loadView() {
        view = cardsView
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Cards"
        cardsView.collectionView.register(CardCell.self, forCellWithReuseIdentifier: "CardCell")
        cardsView.collectionView.dataSource = self
    }
    private func getCards() {
        CardsAPIClient.fetchCards { [weak self] (result) in
            switch result {
            case .failure(let appError):
                print("error getting stories \(appError)")
            case .success(let data):
                self?.cards = data
            }
        }
    }



}

extension CardsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as? CardCell else {
           fatalError("Couldn't downcast to CardCell")
        }
        let card = cards[indexPath.row]
        cell.configureCell(with: card)
        return cell
    }
    
    
}
