//
//  BadUsages.swift
//  PaymentExample
//
//  Created by Cemal on 6.10.2024.
//

import Foundation

enum BadUsagePaymentMethod {
    case card
    case point
    case wallet
    case transfer
}

struct BadUsages {
    
    var selectedPaymentMethod: BadUsagePaymentMethod?
    
    func loadCards(cards: [Card]) {
        
        switch selectedPaymentMethod {
        case .card:
            // TODO: - Kart ödeme yöntemine ait görünüme kartları yükle
            break
        case .point:
            // TODO: - Puan ödeme yöntemine ait görünüme kartları yükle
            break
        case .wallet:
            // TODO: - Cüzdan ödeme yöntemine ait görünüme kartları yükle
            break
        default:
            break
        }
    }
}

struct BadCardPaymentMethodView {
    // some codes
    
    func validateCardPaymentMethod() -> Bool {
        // some codes
        return true
    }
}

struct BadXPaymentMethodView {
    // Soma codes
    
    func validateXPaymentView() -> Bool {
        // some codes
        return false
    }
}
