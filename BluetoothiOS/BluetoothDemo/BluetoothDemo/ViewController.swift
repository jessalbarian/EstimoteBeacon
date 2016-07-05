//
//  ViewController.swift
//  BluetoothDemo
//
//  Created by Jessie Albarian on 6/23/16.
//  Copyright © 2016 mademovement. All rights reserved.
//

import UIKit
import CoreBluetooth

class ViewController: UIViewController, CBCentralManagerDelegate, CBPeripheralDelegate {

    // BLE
    var centralManager : CBCentralManager!
    var sensorTagPeripheral : CBPeripheral!
//    let mainUUID = CBUUID(string: "00050001-0000-1000-8000-00805F9B0131")
    let IRTemperatureServiceUUID = CBUUID(string: "00050001-0000-1000-8000-00805f9b0131")
    
    
    var titleLabel : UILabel!
    var statusLabel : UILabel!
    var tempLabel : UILabel!
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialize central manager on load
        centralManager = CBCentralManager(delegate: self, queue: nil)
        
        
        // Set up title label
        titleLabel = UILabel()
        titleLabel.text = "My Solar Powered Device"
        titleLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 26)
        titleLabel.sizeToFit()
        titleLabel.center = CGPoint(x: self.view.frame.midX, y: self.titleLabel.bounds.midY+28)
        self.view.addSubview(titleLabel)
        
        // Set up status label
        statusLabel = UILabel()
        statusLabel.textAlignment = NSTextAlignment.Center
        statusLabel.text = "Loading..."
        statusLabel.font = UIFont(name: "HelveticaNeue-Light", size: 20)
        statusLabel.sizeToFit()
        statusLabel.frame = CGRect(x: self.view.frame.origin.x, y: self.titleLabel.frame.maxY, width: self.view.frame.width, height: self.statusLabel.bounds.height)
        self.view.addSubview(statusLabel)
        
        // Set up temperature label
        tempLabel = UILabel()
        tempLabel.text = "00.00"
        tempLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 72)
        tempLabel.sizeToFit()
        tempLabel.center = self.view.center
        self.view.addSubview(tempLabel)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Check status of BLE hardware
    func centralManagerDidUpdateState(central: CBCentralManager) {
        if central.state == CBCentralManagerState.PoweredOn {
            // Scan for peripherals if BLE is turned on
            central.scanForPeripheralsWithServices(nil, options: nil)
            self.statusLabel.text = "Searching for BLE Devices"
        }
        else {
            // Can have different conditions for all states if needed - print generic message for now
            print("Bluetooth switched off or not initialized")
        }
    }

    
    // Check out the discovered peripherals to find Sensor Tag
    func centralManager(central: CBCentralManager, didDiscoverPeripheral peripheral: CBPeripheral, advertisementData: [String : AnyObject], RSSI: NSNumber) {
//        let ID = "00050001-0000-1000-8000-00805F9B0131"
//        let deviceName =
        
//        let nameOfDeviceFound = (advertisementData as NSDictionary).objectForKey(CBAdvertisementDataLocalNameKey) as? NSString
//        let power = (advertisementData as NSDictionary).objectForKey(CBAdvertisementDataTxPowerLevelKey) as? Int
        let ppl = (advertisementData as NSDictionary).objectForKey(CBAdvertisementDataServiceDataKey) as? String
        
//        let connect = (advertisementData as NSDictionary).objectForKey(CBAdvertisementDataIsConnectable) as? Bool
        let id = (advertisementData as NSDictionary).objectForKey(CBAdvertisementDataServiceUUIDsKey) as? String
        
        
            print(id)
        
        if (ppl == "Hi") {
            // Update Status Label
            self.statusLabel.text = "Sensor Tag Found"
            // Stop scanning
//            self.centralManager.stopScan()
            // Set as the peripheral to use and establish connection
            self.sensorTagPeripheral = peripheral
            print(peripheral)
            self.sensorTagPeripheral.delegate = self
            self.centralManager.connectPeripheral(peripheral, options: nil)
        }
        else {
            self.statusLabel.text = "Sensor Tag NOT Found"
        }
    }
    
    
    // Discover services of the peripheral
    func centralManager(central: CBCentralManager, didConnectPeripheral peripheral: CBPeripheral) {
        self.statusLabel.text = "Discovering peripheral services..."
        peripheral.discoverServices(nil)
    }
    
    
    // Check if the service discovered is a valid IR Temperature Service
    func peripheral(peripheral: CBPeripheral, didDiscoverServices error: NSError?) {
        self.statusLabel.text = "Looking at peripheral services..."
        for service in peripheral.services! {
            print(service)
            let thisService = service as CBService
            if thisService.UUID == "B9401000-F5F8-466E-AFF9-25556B57FE6D" {
                // Discover characteristics of IR Temperature Service
                print("hi")
                peripheral.discoverCharacteristics(nil, forService: thisService)
                print(peripheral.discoverCharacteristics(nil, forService: thisService))
            }
            // Uncomment to print list of UUIDs
            print(thisService.UUID)
        }
    }
    
    // If disconnected, start searching again
    func centralManager(central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: NSError?) {
        self.statusLabel.text = "Disconnected"
        central.scanForPeripheralsWithServices(nil, options: nil)
    }
    

    
    // Enable notification and sensor for each characteristic of valid service
//    func peripheral(peripheral: CBPeripheral, didDiscoverCharacteristicsForService service: CBService, error: NSError?) {
//        
//        // update status label
//        self.statusLabel.text = "Enabling sensors..."
//        
//        // 0x01 data byte to enable sensor
//        var enableValue = 1
//        let enablyBytes = NSData(bytes: &enableValue, length: sizeof(UInt8))
//        
//        // check the uuid of each characteristic to find config and data characteristics
//        for charateristic in service.characteristics! {
//            let thisCharacteristic = charateristic as CBCharacteristic
//            // check for data characteristic
//            if thisCharacteristic.UUID == IRTemperatureServiceUUID {
//                // Enable Sensor Notification
//                self.sensorTagPeripheral.setNotifyValue(true, forCharacteristic: thisCharacteristic)
//            }
//            // check for config characteristic
//            if thisCharacteristic.UUID == IRTemperatureServiceUUID {
//                // Enable Sensor
//                self.sensorTagPeripheral.writeValue(enablyBytes, forCharacteristic: thisCharacteristic, type: CBCharacteristicWriteType.WithResponse)
//            }
//        }
//        
//    }
    
    // Get data values when they are updated
//    func peripheral(peripheral: CBPeripheral, didUpdateValueForCharacteristic characteristic: CBCharacteristic, error: NSError?) {
//        
//        self.statusLabel.text = "Connected"
//        
//        if characteristic.UUID == IRTemperatureServiceUUID {
//            // Convert NSData to array of signed 16 bit values
//            let dataBytes = characteristic.value
//            let dataLength = dataBytes!.length
//            var dataArray = [Int16](count: dataLength, repeatedValue: 0)
//            dataBytes!.getBytes(&dataArray, length: dataLength * sizeof(Int16))
//            
//            // Element 1 of the array will be ambient temperature raw value
//            let ambientTemperature = Double(dataArray[1])/128
//            
//            // Display on the temp label
//            self.tempLabel.text = NSString(format: "%.2f", ambientTemperature) as String
//        }
//    }
    

}

