//
//  CardView.swift
//  Unit4Assessment
//
//  Created by Ian Bailey on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit

class CardView: UIView {

    public lazy var collectionView: UICollectionView = {
      // create flow layout for collection view
      let layout = UICollectionViewFlowLayout()
      layout.scrollDirection = .vertical
      layout.itemSize = CGSize(width: 325, height: 350)
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

    private func commonInit() {
        setupCollectionViewConstraints()
}
    
    
    private func setupCollectionViewConstraints() {
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
