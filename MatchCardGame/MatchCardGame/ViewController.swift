//
//  ViewController.swift
//  MatchCardGame
//
//  Copyright © 2020 aya fathy. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    
    var model = CardModel()
    var cardArray = [Card]()
    var firstFlippedCardIndex:IndexPath?
    var secondFlippedCardIndex:IndexPath?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cardArray = model.getCards()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cardArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as! CardCollectionViewCell
        
        cell.configure(card: cardArray[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! CardCollectionViewCell
        let card = cardArray[indexPath.row]
        
        if card.isFlipped == false {
            cell.flip()
            card.isFlipped = true
            
            if firstFlippedCardIndex == nil {
                firstFlippedCardIndex = indexPath
                
            }else {
                checkForMatches(secondFlippedCardIndex: indexPath)
            }
        }
    }
    func checkForMatches(secondFlippedCardIndex:IndexPath){
        let cardOneCell = collectionView.cellForItem(at: firstFlippedCardIndex!) as? CardCollectionViewCell
        let cardTwoCell = collectionView.cellForItem(at: secondFlippedCardIndex) as! CardCollectionViewCell
        
        let cardOne = cardArray[firstFlippedCardIndex!.row]
        let cardTwo = cardArray[secondFlippedCardIndex.row]
        
        if cardOne.imageName == cardTwo.imageName {
            cardOne.isMathed = true
            cardTwo.isMathed = true
            
            cardOneCell?.remove()
            cardTwoCell.remove()
        }else{
            cardOne.isFlipped = false
            cardTwo.isFlipped = false
            cardTwoCell.flipBack()
            cardTwoCell.flipBack()
        }
        
    }
}

