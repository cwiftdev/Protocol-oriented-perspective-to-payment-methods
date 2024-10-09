//
//  MockViewControllerPresenter.swift
//  PaymentExample
//
//  Created by Cemal on 6.10.2024.
//

import Foundation

// MARK: - MockViewControllerPresenterOutput
protocol MockViewControllerPresenterOutput: AnyObject {
    func mockPresenterOutPut(didLoad cards: [Card], selectedCard: Card?)
    func mockPresenterOutput(didLoad points: [Point])
    func mockPresenterOutput(didLoad paymentMethods: [PaymentMethod])
    func mockPresenterOutput(select paymentMethod: PaymentMethod)
}
