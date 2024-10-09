//
//  CardInputView.swift
//  PaymentExample
//
//  Created by Cemal on 5.10.2024.
//

import UIKit

// MARK: - CardInputView
typealias CardInputView = UIView & CardInputViewConfigurable & Validatable

// MARK: - CardInputConfigurable
protocol CardInputViewConfigurable: AnyObject {
    var cardInputViewDelegate: CardInputViewDelegate? { get set }
}

// MARK: - CardInputViewDelegate
protocol CardInputViewDelegate: AnyObject {
    func cardInputView(didEnter binNumber: String)
}

// MARK: - MyCardInputView
final class MyCardInputView: CardInputView {
    weak var cardInputViewDelegate: (any CardInputViewDelegate)?
}
