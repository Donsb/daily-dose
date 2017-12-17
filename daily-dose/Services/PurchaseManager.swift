//
//  PurchaseManager.swift
//  daily-dose
//
//  Created by Donald Belliveau on 2017-12-17.
//  Copyright © 2017 Donald Belliveau. All rights reserved.
//

typealias CompletionHandler = (_ success: Bool)-> ()

import Foundation
import StoreKit

class PurchaseManager: NSObject, SKProductsRequestDelegate, SKPaymentTransactionObserver {
    
    /*
     Singleton
     */
    
    static let instance = PurchaseManager()
    
    
    /*
     Instance Variables
     */
    
    let IAP_REMOVE_ADS = "com.donaldbelliveau.daily.dose.remove.ads"
    var productsRequest: SKProductsRequest! // Request we send to the App Stor to get Products
    var products = [SKProduct]() // Array of Products the App Store sends me back -> Our IAP ID's.
    var transactionComplete: CompletionHandler?
    
    /*
     Functions
     */
    
    
    /* Fetch Products Function. */
    
    func fetchProducts() {
        
            // This is How Apple requires you to fetch the IAP ID's.
        let productIds = NSSet(object: IAP_REMOVE_ADS) as! Set<String>
        
            // Save our request.
        productsRequest = SKProductsRequest(productIdentifiers: productIds)
        
            // Set delegate to Self.-> This will call the productsRequest Function below (Next Function).
        productsRequest.delegate = self
        
            // Starts the process.
        productsRequest.start()
        
    } // END Fetch Products
    
    
    /* Products Request Function. */
    
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        
            // Check if there are some, and if so store them to products.
        if response.products.count > 0 {
            print("TEST: \(response.products.debugDescription)")
            products = response.products
        }
        
    } // END Products Request.
    
    
    /*  */
    
    func purchaseRemoveAds(onComplete: @escaping CompletionHandler) {
            // Make sure user CAN make a payment-> Room on card, not a child...
        if SKPaymentQueue.canMakePayments() && products.count > 0 {
            transactionComplete = onComplete
                // You will receive the items in order they are in iTunes Connect
            let removeAdsProduct = products[0]
                // Create a payment
            let payment = SKPayment(product: removeAdsProduct)
                // Add Observer
            SKPaymentQueue.default().add(self)
                // Add the payment
            SKPaymentQueue.default().add(payment)
            
        } else {
            onComplete(false)
        }
    }

    
    /* Payment Queue Function. */
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        
        for transaction in transactions {
            switch transaction.transactionState {
            case .purchased:
                SKPaymentQueue.default().finishTransaction(transaction)
                if transaction.payment.productIdentifier == IAP_REMOVE_ADS {
                    UserDefaults.standard.set(true, forKey: IAP_REMOVE_ADS)
                    transactionComplete?(true)
                }
                break
            case .failed:
                SKPaymentQueue.default().finishTransaction(transaction)
                transactionComplete?(false)
                break
            case .restored:
                SKPaymentQueue.default().finishTransaction(transaction)
                transactionComplete?(true)
            default:
                transactionComplete?(false)
                break
            }
        }
        
        
    } // END Payment Queue.

    
}
// END Class.


// PurchaseManager:















