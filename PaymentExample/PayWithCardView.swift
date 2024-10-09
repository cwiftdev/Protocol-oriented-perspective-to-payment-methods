//
//  PayWithCardView.swift
//  PaymentExample
//
//  Created by Cemal on 5.10.2024.
//

import UIKit

// MARK: - PayWithCardView
typealias PayWithCardView = CardListViewConfigurable & CardInputViewConfigurable & UIView

// MARK: - CardPaymentView
final class CardPaymentView: PayWithCardView {

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
    
    // MARK: - Protocol Functions
    func loadCards(cards: [Card], selectedCard: Card?) {
        cardListView.loadCards(cards: cards, selectedCard: selectedCard)
    }
}
