//
//  CardPaymentMethodView.swift
//  PaymentExample
//
//  Created by Cemal on 5.10.2024.
//

import UIKit

// MARK: - CardPaymentMethodView
typealias CardPaymentMethodView = PaymentMethodView & CardListViewConfigurable & CardInputViewConfigurable

// MARK: - MyCardPaymentMethodView
final class MyCardPaymentMethodView: CardPaymentMethodView {
    // MARK: - Views
    private lazy var payWithCardView: PayWithCardView = {
        let cardPaymentView = CardPaymentView()
        cardPaymentView.translatesAutoresizingMaskIntoConstraints = false
        return cardPaymentView
    }()
    
    // MARK: - Protocol Properties
    weak var delegate: (any PaymentMethodViewDelegate)?
    
    weak var cardListViewDelegate: (any CardListViewDelegate)? {
        didSet {
            payWithCardView.cardListViewDelegate = cardListViewDelegate
        }
    }
    
    weak var cardInputViewDelegate: (any CardInputViewDelegate)? {
        didSet {
            payWithCardView.cardInputViewDelegate = cardInputViewDelegate
        }
    }
    
    var paymentMethod: PaymentMethod {
        return .card
    }
    
    var isSelected: Bool {
        return _isSelected
    }
    
    // MARK: - Private Properties
    private var _isSelected: Bool = false
    
    func setSelected(isSelected: Bool) {
        // Do Something
    }
    
    func loadCards(cards: [Card], selectedCard: Card?) {
        payWithCardView.loadCards(cards: cards, selectedCard: selectedCard)
    }
}
