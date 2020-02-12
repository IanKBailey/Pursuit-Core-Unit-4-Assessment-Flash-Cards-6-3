//
//  SavedCardView.swift
//  Unit4Assessment
//
//  Created by Ian Bailey on 2/12/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit

class SavedCardView: UIView {

   public lazy var collectionView: UICollectionView = {
     
     let layout = UICollectionViewFlowLayout()
     layout.scrollDirection = .vertical
     layout.itemSize = CGSize(width: 200, height: 200)
     let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
     cv.backgroundColor = .gray
     return cv
   }()

    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
            commonInit()
        }
        
        required init?(coder: NSCoder) {
            super.init(coder: coder)
            commonInit()
        }
        
        func commonInit() {
            setupCollectionViewConstraint()
    }
    
    
    private func setupCollectionViewConstraint() {
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
          collectionView.topAnchor.constraint(equalTo: topAnchor),
          collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
          collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
          collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
        
        
    }
    
    
    
    
    
    
}
