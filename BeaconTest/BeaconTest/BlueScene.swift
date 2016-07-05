//
//  PrimitivesScene.swift
//  BeaconTest
//
//  Created by Jessie Albarian on 6/27/16.
//  Copyright © 2016 mademovement. All rights reserved.
//

import UIKit
import SceneKit

class BlueScene: SCNScene {
    
    override init() {
        super.init()
        
        // Create torus
        let torus = SCNTorus(ringRadius: 1.0, pipeRadius: 0.08)
        let torusNode = SCNNode(geometry: torus)
        torus.firstMaterial?.diffuse.contents = UIColor(red: 64/255, green: 196/255, blue: 242/255, alpha: 1)
        torusNode.pivot = SCNMatrix4MakeRotation(1.57, 1, 0, 0)
        self.rootNode.addChildNode(torusNode)
        
        // Create second torus
        let torusSecond = SCNTorus(ringRadius: 0.75, pipeRadius: 0.08)
        let torusSecondNode = SCNNode(geometry: torusSecond)
        torusSecond.firstMaterial?.diffuse.contents = UIColor(red: 64/255, green: 196/255, blue: 242/255, alpha: 1)
        torusSecondNode.pivot = SCNMatrix4MakeRotation(1.57, 1, 0, 0)
        self.rootNode.addChildNode(torusSecondNode)
        
        // Create third torus
        let torusThird = SCNTorus(ringRadius: 0.5, pipeRadius: 0.08)
        let torusThirdNode = SCNNode(geometry: torusThird)
        torusThird.firstMaterial?.diffuse.contents = UIColor(red: 64/255, green: 196/255, blue: 242/255, alpha: 1)
        torusThirdNode.pivot = SCNMatrix4MakeRotation(1.57, 1, 0, 0)
        self.rootNode.addChildNode(torusThirdNode)
        
        // Create fourth torus
        let torusFourth = SCNTorus(ringRadius: 0.25, pipeRadius: 0.08)
        let torusFourthNode = SCNNode(geometry: torusFourth)
        torusFourth.firstMaterial?.diffuse.contents = UIColor(red: 64/255, green: 196/255, blue: 242/255, alpha: 1)
        torusFourthNode.pivot = SCNMatrix4MakeRotation(1.57, 1, 0, 0)
        self.rootNode.addChildNode(torusFourthNode)
        //        // Create sphere
//        let sphereGeometry = SCNSphere(radius: 0.5)
//        let sphereNode = SCNNode(geometry: sphereGeometry)
//        sphereGeometry.firstMaterial?.diffuse.contents = UIColor.redColor()
//        self.rootNode.addChildNode(sphereNode)
//        
//        // Create second sphere
//        let secondSphereGeometry = SCNSphere(radius: 0.5)
//        let secondSphereNode = SCNNode(geometry: secondSphereGeometry)
//        secondSphereGeometry.firstMaterial?.diffuse.contents = UIColor.greenColor()
//        secondSphereNode.position = SCNVector3(x: 3.0, y: 0.0, z: 0.0)
//        self.rootNode.addChildNode(secondSphereNode)
    }
    
    
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    


}
