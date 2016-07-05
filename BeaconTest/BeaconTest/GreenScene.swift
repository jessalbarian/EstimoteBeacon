//
//  GreenScene.swift
//  BeaconTest
//
//  Created by Jessie Albarian on 6/28/16.
//  Copyright © 2016 mademovement. All rights reserved.
//

import UIKit
import SceneKit

class GreenScene: SCNScene {
    override init() {
        super.init()
        
        // Create torus
        let torus = SCNTorus(ringRadius: 1.0, pipeRadius: 0.08)
        let torusNode = SCNNode(geometry: torus)
        torus.firstMaterial?.diffuse.contents = UIColor(red: 159/255, green: 213/255, blue: 185/255, alpha: 1.0)
        torusNode.pivot = SCNMatrix4MakeRotation(1.57, 1, 0, 0)
        self.rootNode.addChildNode(torusNode)
        
        // Create second torus
        let torusSecond = SCNTorus(ringRadius: 0.75, pipeRadius: 0.08)
        let torusSecondNode = SCNNode(geometry: torusSecond)
        torusSecond.firstMaterial?.diffuse.contents = UIColor(red: 159/255, green: 213/255, blue: 185/255, alpha: 1.0)
        torusSecondNode.pivot = SCNMatrix4MakeRotation(1.57, 1, 0, 0)
        self.rootNode.addChildNode(torusSecondNode)
        
        // Create third torus
        let torusThird = SCNTorus(ringRadius: 0.5, pipeRadius: 0.08)
        let torusThirdNode = SCNNode(geometry: torusThird)
        torusThird.firstMaterial?.diffuse.contents = UIColor(red: 159/255, green: 213/255, blue: 185/255, alpha: 1.0)
        torusThirdNode.pivot = SCNMatrix4MakeRotation(1.57, 1, 0, 0)
        self.rootNode.addChildNode(torusThirdNode)
        
        // Create fourth torus
        let torusFourth = SCNTorus(ringRadius: 0.25, pipeRadius: 0.08)
        let torusFourthNode = SCNNode(geometry: torusFourth)
        torusFourth.firstMaterial?.diffuse.contents = UIColor(red: 159/255, green: 213/255, blue: 185/255, alpha: 1.0)
        torusFourthNode.pivot = SCNMatrix4MakeRotation(1.57, 1, 0, 0)
        self.rootNode.addChildNode(torusFourthNode)
}



required init(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
}

}
