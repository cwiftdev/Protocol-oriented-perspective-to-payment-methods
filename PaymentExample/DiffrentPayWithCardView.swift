//
//  DiffrentPayWithCardView.swift
//  PaymentExample
//
//  Created by Cemal on 5.10.2024.
//

import Foundation

// MARK: - DiffrentPayWithCardView
final class DiffrentPayWithCardView: PayWithCardView {
    
    // MARK: - Views
    private lazy var cardListView: CardListView = {
        let myCardListView = MyCardListView()
        myCardListView.translatesAutoresizingMaskIntoConstraints = false
        return myCardListView
    }()
    
    private lazy var cardInputView: CardInputView = {
        let cardInputView = MyCardInputView()
        cardInputView.translatesAutoresizingMaskIntoConstraints = false
        return cardInputView
    }()
    
    /**
     Diffrent codes
     */
    
    // MARK: - Delegates
    var cardListViewDelegate: (any CardListViewDelegate)? {
        didSet {
            cardListView.cardListViewDelegate = cardListViewDelegate
        }
    }
    
    var cardInputViewDelegate: (any CardInputViewDelegate)? {
        didSet {
            cardInputView.cardInputViewDelegate = cardInputViewDelegate
        }
    }
    
    /**
     Diffrent codes
     */
    
    // MARK: - Protocol Functions
    func loadCards(cards: [Card]) {
        cardListView.loadCards(cards: cards)
    }
}
