//
//  CardListView.swift
//  PaymentExample
//
//  Created by Cemal on 5.10.2024.
//

import UIKit

// MARK: - CardListView
typealias CardListView = UIView & CardListViewConfigurable & Validatable

// MARK: - CardListViewConfigurable
protocol CardListViewConfigurable: AnyObject {
    var cardListViewDelegate: CardListViewDelegate? { get set }
    func loadCards(cards: [Card], selectedCard: Card?)
}

// MARK: - CardListViewDelegate
protocol CardListViewDelegate: AnyObject {
    func cardListView(didSelect card: Card)
    func cardListView(didRemove card: Card)
}

// MARK: - MyCardListView
final class MyCardListView: CardListView {
    var cardListViewDelegate: (any CardListViewDelegate)?
    
    func loadCards(cards: [Card], selectedCard: Card?) {
        // Do something
    }
}
