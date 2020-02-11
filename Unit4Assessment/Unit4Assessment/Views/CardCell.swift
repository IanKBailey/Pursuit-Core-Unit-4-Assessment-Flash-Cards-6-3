//
//  CardCell.swift
//  Unit4Assessment
//
//  Created by Ian Bailey on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit

class CardCell: UICollectionViewCell {
    
    
    private var currentCard: Card!
    
    private var isShowingAnswer = false
    
    public lazy var cardTitle: UILabel = {
        let lbl = UILabel()
        lbl.backgroundColor = .green
        lbl.numberOfLines = 3
        return lbl
    }()
    
    public lazy var cardFactOne: UILabel = {
        let lbl = UILabel ()
        lbl.backgroundColor = .red
        lbl.numberOfLines = 10
        lbl.alpha = 0.0
        return lbl
    }()
    

    
    public lazy var optionsButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "ellipsis.circle.fill"), for: .normal)
        return button
    }()
    
    
    
    private lazy var longPressGesture: UILongPressGestureRecognizer = {
      let gesture = UILongPressGestureRecognizer()
      gesture.addTarget(self, action: #selector(didLongPress(_:)))
      return gesture
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
        addGestureRecognizer(longPressGesture)
        setupFactOne()

    }
    
    
    @objc private func didLongPress(_ gesture: UILongPressGestureRecognizer) {
    if gesture.state == .began || gesture.state == .changed {
             return
           }
        isShowingAnswer.toggle()
        self.animate()
    }
    
    
    private func animate() {
       let duration: Double = 1.0
       if isShowingAnswer {
         UIView.transition(with: self, duration: duration, options: [.transitionFlipFromRight], animations: {
            self.cardTitle.alpha = 0.0
            self.cardFactOne.alpha = 1.0
            self.cardFactOne.text = self.currentCard.facts.randomElement()
         }, completion: nil)
       } else {
         UIView.transition(with: self, duration: duration, options: [.transitionFlipFromLeft], animations: {
            self.cardTitle.alpha = 1.0
            self.cardFactOne.alpha = 0.0
         }, completion: nil)
       }
     }
     
        
    private func setupLabel() {
        addSubview(cardTitle)
        cardTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cardTitle.centerYAnchor.constraint(equalTo: centerYAnchor),
            cardTitle.centerXAnchor.constraint(equalTo: centerXAnchor),
            cardTitle.leadingAnchor.constraint(equalTo: leadingAnchor),
            cardTitle.trailingAnchor.constraint(equalTo: trailingAnchor),
            
        ])
    }
    
    private func setupFactOne() {
        addSubview(cardFactOne)
        cardFactOne.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cardFactOne.leadingAnchor.constraint(equalTo: leadingAnchor),
            cardFactOne.trailingAnchor.constraint(equalTo: trailingAnchor),
            cardFactOne.centerYAnchor.constraint(equalTo: centerYAnchor),
            cardFactOne.centerXAnchor.constraint(equalTo: centerXAnchor)
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
        currentCard = card
        cardTitle.text = currentCard.quizTitle
    }
    
    
    
    
    
}
