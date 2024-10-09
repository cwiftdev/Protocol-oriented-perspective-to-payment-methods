//
//  MockViewControllerPresenterInput.swift
//  PaymentExample
//
//  Created by Cemal on 6.10.2024.
//

import Foundation

// MARK: - MockViewControllerPresenterInput
protocol MockViewControllerPresenterInput: AnyObject {
    func presenterInput(didSelectCard card: Card)
    func presenterInput(didRemoveCard card: Card)
    func presenterInput(usePoint amount: Double)
    func presenterInput(didEnterBinNumber binNumber: String)
    func presenterInput(didSelectPaymentMethod paymentMethod: PaymentMethod)
}
