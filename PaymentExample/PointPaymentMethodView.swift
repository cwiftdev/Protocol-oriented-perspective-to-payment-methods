//
//  PointPaymentMethodView.swift
//  PaymentExample
//
//  Created by Cemal on 5.10.2024.
//

import UIKit

// MARK: - PointPaymentMethodView
typealias PointPaymentMethodView = PaymentMethodView & CardListViewConfigurable & CardInputViewConfigurable & PointViewConfigurable

// MARK: - MyPointPaymentMethodView
final class MyPointPaymentMethodView: PointPaymentMethodView {
    
    // MARK: - Views
    private lazy var payWithCardView: PayWithCardView = {
        let diffrentPayWithCardView = DiffrentPayWithCardView()
        diffrentPayWithCardView.translatesAutoresizingMaskIntoConstraints = false
        return diffrentPayWithCardView
    }()
    
    private lazy var payWithPointView: PayWithPointView = {
        let payWithPointView = MyPayWithPointView()
        payWithPointView.translatesAutoresizingMaskIntoConstraints = false
        return payWithPointView
    }()
    
    // MARK: - Protocol Properties
    weak var delegate: (any PaymentMethodViewDelegate)?
    weak var cardListViewDelegate: (any CardListViewDelegate)?
    weak var cardInputViewDelegate: (any CardInputViewDelegate)?
    weak var pointViewDelegate: (any PointViewDelegate)?
    
    var isSelected: Bool {
        return _isSelected
    }
    var paymentMethod: PaymentMethod {
        return .point
    }
    
    // MARK: - Private properties
    private var _isSelected: Bool = false
    
    func setSelected(isSelected: Bool) {
        // Do somethings
    }
    
    func loadCards(cards: [Card], selectedCard: Card?) {
        payWithCardView.loadCards(cards: cards, selectedCard: selectedCard)
    }
    
    func loadPoints(points: [Point]) {
        payWithPointView.loadPoints(points: points)
    }
}
