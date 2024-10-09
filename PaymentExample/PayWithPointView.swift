//
//  PayWithPointView.swift
//  PaymentExample
//
//  Created by Cemal on 5.10.2024.
//

import UIKit

// MARK: - PointView
typealias PayWithPointView = PointViewConfigurable & UIView

// MARK: - PointViewConfigurable
protocol PointViewConfigurable: AnyObject {
    var pointViewDelegate: PointViewDelegate? { get set }
    func loadPoints(points: [Point])
}

// MARK: - PointViewDelegate
protocol PointViewDelegate: AnyObject {
    func pointView(usePoint amount: Double)
}

// MARK: - MyPayWithPointView
final class MyPayWithPointView: PayWithPointView {
    weak var pointViewDelegate: (any PointViewDelegate)?
    
    func loadPoints(points: [Point]) {
        // Do something
    }
}
