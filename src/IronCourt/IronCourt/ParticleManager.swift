//
//  ParticleManager.swift
//  IronCourt
//
//  Created by Sean Mc Mains on 2/5/16.
//  Copyright © 2016 Sean Mc Mains. All rights reserved.
//

import UIKit
import Spark_SDK

protocol ParticleManagerDelegate {
    func didReceiveAssassinationAlert()
}

class ParticleManager {
    var ironThronePhoton : SparkDevice?
    let delegate : ParticleManagerDelegate
    
    init( delegate: ParticleManagerDelegate ) {
        self.delegate = delegate
        
        self.loginToParticle()
    }
    
    private func loginToParticle() {
        let ( username, password ) = self.getUsernameAndPasswordFromPlist()
        
        SparkCloud.sharedInstance().loginWithUser(username, password: password) { (error:NSError!) -> Void in
            if let error = error {
                print("Wrong credentials or no internet connectivity, please try again. Error: " + error.localizedDescription )
            } else {
                print("Logged in")
                self.findPhoton()
            }
        }
    }
    
    private func findPhoton() {
        SparkCloud.sharedInstance().getDevices { (sparkDevices:[AnyObject]!, error:NSError!) -> Void in
            
            guard let devices = sparkDevices as? [SparkDevice]
                else {
                    print( "Could not get list of devices." )
                    return
            }
            
            for device in devices where device.name == "iron-throne" {
                self.ironThronePhoton = device
            }
        }
    }
    
    final func sendAssassinationAlert() {
        ironThronePhoton?.callFunction("notify",
            withArguments: ["assassination"],
            completion: nil );
    }
    
    private func getUsernameAndPasswordFromPlist() -> (String, String) {
        if let path = NSBundle.mainBundle().pathForResource("ParticleKeys", ofType: "plist"), dict = NSDictionary(contentsOfFile: path) as? [String: AnyObject] {
            if let username = dict["username"] as? String, let password = dict["password"] as? String {
                return ( username, password )
            }
        }
        
        return ( "", "" )
    }


}