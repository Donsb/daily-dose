//
//  HomeVC.swift
//  daily-dose
//
//  Created by Donald Belliveau on 2017-12-17.
//  Copyright © 2017 Donald Belliveau. All rights reserved.
//

import UIKit
import GoogleMobileAds

class HomeVC: UIViewController {
    
    /*
     IBOutlets
     */
    
    @IBOutlet weak var bannerView: GADBannerView!
    /*
     Functions.
     */
    
    
    
    /* View Did Load Function. */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            // Set the ad to my Google Dev Account -> This is a test fake account.
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerView.rootViewController = self
        
            // Next, Load the Ad Request.
        bannerView.load(GADRequest())
        
    } // END View Did Load
    
    
    /* Did Receive Memory Warning Function. */
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    } // END Did Receive Memory Warning
    
    
}
// END Class


// HomeVC:



























