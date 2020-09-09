//
//  CardModel.swift
//  MatchCardGame
//
//  Copyright © 2020 aya fathy. All rights reserved.
//

import Foundation
class CardModel {
    
    func getCards() ->[Card] {
        
        var generateCards = [Card]()
        
        for _ in 1...8{
            let randomNumber = arc4random_uniform(13) + 1
            
            print(randomNumber)
            
            let cardOne = Card()
            let cardTwo = Card()
            
            cardOne.imageName = "card\(randomNumber)"
            cardTwo.imageName = "card\(randomNumber)"
            generateCards += [cardOne,cardTwo]
            
            generateCards.shuffle()
           
        }
         return generateCards
        
    }
}

