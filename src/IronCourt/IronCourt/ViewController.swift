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
    @IBOutlet var statusLabel: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.particleManager = ParticleManager( delegate: self )
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func didReceiveSendAlertTap(sender: AnyObject) {
        self.particleManager.sendAssassinationAlert()
    }
}

