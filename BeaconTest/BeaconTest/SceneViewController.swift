//
//  SceneViewController.swift
//  BeaconTest
//
//  Created by Jessie Albarian on 6/27/16.
//  Copyright © 2016 mademovement. All rights reserved.
//

import UIKit
import SceneKit
import AVFoundation

class SceneViewController: UIViewController, ESTBeaconManagerDelegate, CLLocationManagerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // Location stuff
        locationManager.delegate = self
        if (CLLocationManager.authorizationStatus() != CLAuthorizationStatus.AuthorizedWhenInUse) {
            locationManager.requestWhenInUseAuthorization()
        }
        locationManager.startRangingBeaconsInRegion(region)
        self.beaconManager.delegate = self
        self.beaconManager.requestAlwaysAuthorization()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    let bluescene = BlueScene()
    let greenscene = GreenScene()
    let purpscene = PurpScene()
    
    let beacon = Beacon()
    let beaconManager = ESTBeaconManager()
    let locationManager = CLLocationManager()
    
    // Identify UUID from Beacons (same for all)
    let region = CLBeaconRegion(proximityUUID: NSUUID(UUIDString: "979291BF-D2C4-39BB-D497-973985193E6E")!, identifier: "Estimotes")
    
    // Set image based on major id
    let images = [
        60912: UIImage(named: ("blue")),
        12140: UIImage(named: ("green")),
        2040: UIImage(named: ("purple")),
        34137: UIImage(named: ("green")),
        61561: UIImage(named: ("blue")),
        23109: UIImage(named: ("purple"))
    ]
    
    
    
    //---------------
    // Main function
    //---------------
    var previousBeacon = 0

    
    
    func locationManager(manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], inRegion region: CLBeaconRegion) {
//        print(beacons)
        
        //TODO need to test for proximity being negative, or weird numbers
                let knownBeacons = beacons.filter {
                    $0.proximity != CLProximity.Unknown
                }
//        let knownBeacons = beacons
        

        
        //-----------------------
        // If beacons are around
        //-----------------------
        if (knownBeacons.count > 0) {
            let closestBeacon = knownBeacons[0] as CLBeacon
            let currentBeacon = closestBeacon.major.integerValue
            let prox = closestBeacon.proximity.rawValue
            print(prox)
            if prox > 1 {
                let scnView = self.view as! SCNView
                scnView.scene = nil
                scnView.backgroundColor = UIColor.whiteColor()
//                previousBeacon = currentBeacon
            } else {
                if(currentBeacon != previousBeacon || previousBeacon == 0){
               
                // If blue beacon
                if (closestBeacon.major.integerValue == 60912 || closestBeacon.major.integerValue == 61561){
                    if(prox == 0 || prox == 1){
                        let scnView = self.view as! SCNView
                        scnView.backgroundColor = UIColor.whiteColor()
                        scnView.autoenablesDefaultLighting = true
                        scnView.allowsCameraControl = true
                        scnView.scene = BlueScene()
                        previousBeacon = currentBeacon
                    }
                // If green beacon
                } else if (closestBeacon.major.integerValue == 12140 || closestBeacon.major.integerValue == 34137){
                    if(prox == 0 || prox == 1){
                        let scnView = self.view as! SCNView
                        scnView.backgroundColor = UIColor.whiteColor()
                        scnView.autoenablesDefaultLighting = true
                        scnView.allowsCameraControl = true
                        scnView.scene = GreenScene()
                        previousBeacon = currentBeacon
                    }
                // If purple beacon
                } else if (closestBeacon.major.integerValue == 2040 || closestBeacon.major.integerValue == 23109){
                    if(prox == 0 || prox == 1){
                        let scnView = self.view as! SCNView
                        scnView.backgroundColor = UIColor.whiteColor()
                        scnView.autoenablesDefaultLighting = true
                        scnView.allowsCameraControl = true
                        scnView.scene = PurpScene()
                        previousBeacon = currentBeacon
                    }
                }
                }
                
            }
        }
        //---------------------
        // No beacons in range
        //---------------------
        if (knownBeacons.count == 0){
            let scnView = self.view as! SCNView
            scnView.scene = nil
            scnView.backgroundColor = UIColor.whiteColor()
        }
        
        
            //            let currentBeacon = closestBeacon.major.integerValue
            
            //            // 1 ft = 0.3048 m
//            let accuracy = Double(String(format: "%.2f", closestBeacon.accuracy))
//            //
//            let feetNum = accuracy!/0.3048
//            let feetString = String(format: "%.2f", accuracy!/0.3048)
//            if (feetNum > 0){
//                distanceText!.text = "~ \(feetString)ft"
//            } else {
//                distanceText!.text = "Locating"
//            }
            //
            
//            self.imageView.image = self.images[closestBeacon.major.integerValue]!
//                        if feetNum <= 1 {
//            //                self.imageView.image = self.images[closestBeacon.major.integerValue]!
//            
//                        }
//                        if feetNum > 1  {
//                        }
            
            
//            
//            --------------------------
//             Adds vibration and sound
//            --------------------------
//                        if(currentBeacon != previousBeacon || previousBeacon == 0) {
//                            //Add vibration
//                            AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
//            
//                            // Play tweet sound
//                            //let systemSoundID: SystemSoundID = 1016
//            
//                            // Play horn sound
//                            let systemSoundID: SystemSoundID = 1010
//                            AudioServicesPlaySystemSound (systemSoundID)
//            
//                            previousBeacon = currentBeacon
//                        }
   
//            ----------------------------
//             Add text based on major id
//            ----------------------------
//                        if (currentBeacon == 60912){
//                            textView.text = "Kitchen"
//                        } else if (currentBeacon == 12140){
//                            textView.text = "Living Room"
//                        } else if (currentBeacon == 2040){
//                            textView.text = "Dining Room"
//                        } else if (currentBeacon == 34137){
//                            textView.text = "Master Bedroom"
//                        } else if (currentBeacon == 61561){
//                            textView.text = "Master Bathroom"
//                        } else if (currentBeacon == 23109){
//                            textView.text = "Laundry Room"
//                        }
//            

        
        
        }
    
}
