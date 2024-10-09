//
//  PaymentMethodViewTypeFactory.swift
//  PaymentExample
//
//  Created by Cemal on 6.10.2024.
//

import Foundation

// MARK: - PaymentMethodViewTypeFactory
protocol PaymentMethodViewTypeFactory {
    func createPaymentMethodView(type: PaymentMethod) -> PaymentMethodView.Type
}

// MARK: - MyPaymentMethodViewTypeFactory
struct MyPaymentMethodViewTypeFactory: PaymentMethodViewTypeFactory {
    func createPaymentMethodView(type: PaymentMethod) -> any PaymentMethodView.Type {
        switch type {
        case .card:
            return MyCardPaymentMethodView.self
        case .point:
            return MyPointPaymentMethodView.self
        }
    }
}

