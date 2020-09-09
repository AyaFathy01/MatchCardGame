//
//  CardCollectionViewCell.swift
//  MatchCardGame
//
//  Copyright © 2020 aya fathy. All rights reserved.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var frontImageView: UIImageView!
    
    @IBOutlet weak var backImageView: UIImageView!
    
    var card:Card?
    
    func configure (card:Card) {
        frontImageView.image = UIImage(named: card.imageName)
        
        if card.isFlipped == true {
            flip(speed: 0)
        }else{
            flipBack(speed: 0)
        }
    }
    
    
    
    func flip(speed:TimeInterval = 0.3) {
        
        UIView.transition(from: backImageView, to: frontImageView, duration: speed, options: [.showHideTransitionViews,.transitionFlipFromLeft], completion: nil)
        
        card?.isFlipped = true
        
    }
    
    
    
    func flipBack(speed:TimeInterval = 0.3) {
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
            
            UIView.transition(from: self.frontImageView, to: self.backImageView, duration: speed, options: [.showHideTransitionViews,.transitionFlipFromLeft], completion: nil)
            
            self.card?.isFlipped = false
        }
        
    }
    func remove(){
        
        frontImageView.alpha = 0
        backImageView.alpha = 0
    }
}
