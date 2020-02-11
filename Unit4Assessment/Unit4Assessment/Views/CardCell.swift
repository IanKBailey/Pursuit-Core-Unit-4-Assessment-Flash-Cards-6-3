//
//  CardCell.swift
//  Unit4Assessment
//
//  Created by Ian Bailey on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit

class CardCell: UICollectionViewCell {
    
    
    public lazy var cardText: UILabel = {
        let lbl = UILabel()
        lbl.backgroundColor = .green
        return lbl
    }()
    
    public lazy var optionsButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "ellipsis.circle.fill"), for: .normal)
        return button
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        setupLabel()
        setupButton()
    }
    
    private func setupLabel() {
        addSubview(cardText)
        cardText.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cardText.centerYAnchor.constraint(equalTo: centerYAnchor),
            cardText.centerXAnchor.constraint(equalTo: centerXAnchor),
            cardText.leadingAnchor.constraint(equalTo: leadingAnchor),
            cardText.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    private func setupButton() {
        addSubview(optionsButton)
        optionsButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            optionsButton.topAnchor.constraint(equalTo: topAnchor),
            optionsButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            optionsButton.heightAnchor.constraint(equalToConstant: 44),
            optionsButton.widthAnchor.constraint(equalTo: optionsButton.heightAnchor)
        ])
    }
    
    public func configureCell(with card: Card) {
        cardText.text = card.cardTitle
    }
    
    
    
    
    
}
