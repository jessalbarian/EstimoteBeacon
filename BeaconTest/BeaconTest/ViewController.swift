//
//  ViewController.swift
//  BeaconTest
//
//  Created by Jessie Albarian on 6/13/16.
//  Copyright © 2016 mademovement. All rights reserved.
//

import UIKit
import AudioToolbox
import CoreLocation
import AVFoundation

class ViewController: UIViewController, ESTBeaconManagerDelegate, CLLocationManagerDelegate {

    
    
    //-----------
    // Variables
    //-----------
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var textView: UILabel!
    @IBOutlet var demoImage: UIImageView!
    @IBOutlet var distanceText: UILabel!
    @IBOutlet var opaqueImage: UIImageView!
    let beacon = Beacon()
    let beaconManager = ESTBeaconManager()
    let locationManager = CLLocationManager()
    let notification = UILocalNotification()
    
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
    
    
    
    

    
    
    //-------------------------
    // Main function to change 
    // images based on beacon
    //-------------------------
    var previousBeacon = 0
    
    
    
    func locationManager(manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], inRegion region: CLBeaconRegion) {
        print(beacons)
        
        //TODO need to test for proximity being negative, or weird numbers
//        let knownBeacons = beacons.filter {
//            $0.proximity != CLProximity.Unknown
//        }
        let knownBeacons = beacons
       
        
        
        //-----------------------
        // If beacons are around
        //-----------------------
        if (knownBeacons.count > 0) {
            let closestBeacon = knownBeacons[0] as CLBeacon

            
        
//            let currentBeacon = closestBeacon.major.integerValue
            
//            // 1 ft = 0.3048 m
            let accuracy = Double(String(format: "%.2f", closestBeacon.accuracy))
//
            let feetNum = accuracy!/0.3048
            let feetString = String(format: "%.2f", accuracy!/0.3048)
            if (feetNum > 0){
                distanceText!.text = "~ \(feetString)ft"
            } else {
                distanceText!.text = "Locating"
            }
//
            
            self.imageView.image = self.images[closestBeacon.major.integerValue]!
//            if feetNum <= 1 {
////                self.imageView.image = self.images[closestBeacon.major.integerValue]!
//                
//            }
//            if feetNum > 1  {
//            }
//            
            
            
            //--------------------------
            // Adds vibration and sound
            //--------------------------
//            if(currentBeacon != previousBeacon || previousBeacon == 0) {
//                //Add vibration
//                AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
//                
//                // Play tweet sound
//                //let systemSoundID: SystemSoundID = 1016
//                
//                // Play horn sound
//                let systemSoundID: SystemSoundID = 1010
//                AudioServicesPlaySystemSound (systemSoundID)
//                
//                previousBeacon = currentBeacon
//            }
            
            //----------------------------
            // Add text based on major id
            //----------------------------
//            if (currentBeacon == 60912){
//                textView.text = "Kitchen"
//            } else if (currentBeacon == 12140){
//                textView.text = "Living Room"
//            } else if (currentBeacon == 2040){
//                textView.text = "Dining Room"
//            } else if (currentBeacon == 34137){
//                textView.text = "Master Bedroom"
//            } else if (currentBeacon == 61561){
//                textView.text = "Master Bathroom"
//            } else if (currentBeacon == 23109){
//                textView.text = "Laundry Room"
//            }

        }

        
        //-----------------------------
        // "Walk around the room" view
        //-----------------------------
//        if (knownBeacons.count == 0){
//                demoImage.image = UIImage(named: ("demo"))
////                opaqueImage.image = nil
////                textView.text = ""
////                distanceText.text = ""
//            }
        }


    
    //-------------
    // ViewDidLoad
    //-------------
    override func viewDidLoad() {
        super.viewDidLoad()
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
    }


}

