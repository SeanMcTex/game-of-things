//
//  ViewController.swift
//  IronCourt
//
//  Created by Sean Mc Mains on 2/5/16.
//  Copyright © 2016 Sean Mc Mains. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ParticleManagerDelegate {
    
    var particleManager : ParticleManager!
    let dateFormatter = NSDateFormatter()
    
    @IBOutlet var statusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.particleManager = ParticleManager( delegate: self )

        dateFormatter.dateStyle = .NoStyle
        dateFormatter.timeStyle = .ShortStyle
    }
    
    @IBAction func didReceiveSendAlertTap(sender: AnyObject) {
        self.particleManager.sendAssassinationAlert()
    }
    
    func didRecieveOccupantUpdate(occupantName: String) {
        let dateString = dateFormatter.stringFromDate( NSDate() )
        
        dispatch_async(dispatch_get_main_queue()) { () -> Void in
            let labelText = "\(dateString): \(occupantName)"
            self.statusLabel.text = labelText
        }
        
    }
}

