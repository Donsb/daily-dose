//
//  PurchaseManager.swift
//  daily-dose
//
//  Created by Donald Belliveau on 2017-12-17.
//  Copyright © 2017 Donald Belliveau. All rights reserved.
//

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
    
    /*
     Functions
     */
    
    
    /* Products Request Function. */
    
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        
    } // END Products Request.

    
    /* Payment Queue Function. */
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        
    } // END Payment Queue.

    
}
// END Class.


// PurchaseManager:  















