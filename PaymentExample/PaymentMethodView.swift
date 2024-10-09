//
//  PaymentMethodView.swift
//  PaymentExample
//
//  Created by Cemal on 5.10.2024.
//

import UIKit

// MARK: - Validatable
protocol Validatable {
    func doValidate() -> Bool
}

extension Validatable {
    func doValidate() -> Bool {
        return true
    }
}

// MARK: - PaymentMethodView
typealias PaymentMethodView = UIView & PaymentMethodViewConfigurable & Validatable

// MARK: - PaymentMethodViewConfigurable
protocol PaymentMethodViewConfigurable: AnyObject {
    var delegate: PaymentMethodViewDelegate? { get set }
    var paymentMethod: PaymentMethod { get }
    var isSelected: Bool { get }
    func setSelected(isSelected: Bool)
}

// MARK: - PaymentMethodViewDelegate
protocol PaymentMethodViewDelegate: AnyObject {
    func paymentMethodView(select paymentMethod: PaymentMethod)
}
