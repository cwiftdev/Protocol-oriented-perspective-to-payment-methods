//
//  ViewController.swift
//  PaymentExample
//
//  Created by Cemal on 5.10.2024.
//

import UIKit

class ViewController: UIViewController {
    
    private let contentVStackView = UIStackView()
    private let methodViewTypeFactory: PaymentMethodViewTypeFactory = MyPaymentMethodViewTypeFactory()
    
    weak var presenter: MockViewControllerPresenterInput?
}

// MARK: - MockViewControllerPresenterOutput
extension ViewController: MockViewControllerPresenterOutput {
    
    func mockPresenterOutput(didLoad paymentMethods: [PaymentMethod]) {
        for paymentMethod in paymentMethods {
            let paymentMethodViewType = methodViewTypeFactory.createPaymentMethodView(type: paymentMethod)
            let paymentMethodView = paymentMethodViewType.init()
            registerPaymentMethodDelegates(paymentMethodView)
            contentVStackView.addArrangedSubview(paymentMethodView)
        }
    }
    
    func mockPresenterOutput(select paymentMethod: PaymentMethod) {
        for paymentMethodView in paymentMethodViews {
            let isSelected = paymentMethodView.paymentMethod == paymentMethod
            paymentMethodView.setSelected(isSelected: isSelected)
        }
    }
    
    func mockPresenterOutPut(didLoad cards: [Card], selectedCard: Card?) {
        guard let cardListConfigurableMethodView = getCurrentSelectedPaymentMethodView(as: CardListViewConfigurable.self) else { return }
        cardListConfigurableMethodView.loadCards(cards: cards, selectedCard: selectedCard)
    }
    
    func mockPresenterOutput(didLoad points: [Point]) {
        guard let pointConfigurableMethodView = getCurrentSelectedPaymentMethodView(as: PointViewConfigurable.self) else { return }
        pointConfigurableMethodView.loadPoints(points: points)
    }
}

// MARK: - PaymentMethodViewDelegate
extension ViewController: PaymentMethodViewDelegate {
    func paymentMethodView(select paymentMethod: PaymentMethod) {
        presenter?.presenterInput(didSelectPaymentMethod: paymentMethod)
    }
}

// MARK: - CardListViewDelegate
extension ViewController: CardListViewDelegate {
    func cardListView(didSelect card: Card) {
        presenter?.presenterInput(didSelectCard: card)
    }
    
    func cardListView(didRemove card: Card) {
        presenter?.presenterInput(didRemoveCard: card)
    }
}

// MARK: - PointViewDelegate
extension ViewController: PointViewDelegate {
    func pointView(usePoint amount: Double) {
        presenter?.presenterInput(usePoint: amount)
    }
}

// MARK: - CardInputViewDelegate
extension ViewController: CardInputViewDelegate {
    func cardInputView(didEnter binNumber: String) {
        presenter?.presenterInput(didEnterBinNumber: binNumber)
    }
}

// MARK: - Helpers
extension ViewController {
    
    final func registerPaymentMethodDelegates(_ paymentMethodView: PaymentMethodView) {
        paymentMethodView.delegate = self
        (paymentMethodView as? CardListViewConfigurable)?.cardListViewDelegate = self
        (paymentMethodView as? CardInputViewConfigurable)?.cardInputViewDelegate = self
        (paymentMethodView as? PointViewConfigurable)?.pointViewDelegate = self
    }
    
    var paymentMethodViews: [PaymentMethodView] {
        return contentVStackView.arrangedSubviews.compactMap { $0 as? PaymentMethodView }
    }
    
    var selectedPaymentMethodView: PaymentMethodView? {
        return paymentMethodViews.first(where: { return $0.isSelected })
    }
    
    final func getCurrentSelectedPaymentMethodView<T>(as type: T.Type) -> T? {
        return selectedPaymentMethodView as? T
    }
    
    final func getPaymentMethodViews<T>(as type: T.Type) -> [T] {
        return paymentMethodViews.compactMap { $0 as? T }
    }
}
