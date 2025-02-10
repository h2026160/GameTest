//
//  Map.swift
//  GameTest
//
//  Created by H2026160 on 7/1/2025.
//

import Foundation
import SpriteKit

class Map: SKNode{
    private var isPressed: Bool
    private var mapNum: Int
    private var mapNode: SKSpriteNode!
    
    init(mapNum: Int) {
        self.isPressed = false
        self.mapNum = mapNum
        super.init()
        
        self.zPosition=8.0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension Map{
    func setUpMapA(mapIndex: Int){
        if(mapIndex==1){
            mapNode=SKSpriteNode(imageNamed: "Beijing_M11")
            mapNode.name="Beijing_M11_Button"
            mapNode.xScale=0.6
            mapNode.yScale=0.6
            mapNode.position=CGPoint(x: -480, y: 0)
        }
        if(mapIndex==2){
            mapNode=SKSpriteNode(imageNamed: "MTR_East_Rail")
            mapNode.name="MTR_East_Rail_Button"
            mapNode.xScale=0.6
            mapNode.yScale=0.6
            mapNode.position=CGPoint(x: -160, y: 0)
        }
        if(mapIndex==3){
            mapNode=SKSpriteNode(imageNamed: "Shenzhen_M11")
            mapNode.name="Shenzhen_M11_Button"
            mapNode.xScale=0.6
            mapNode.yScale=0.6
            mapNode.position=CGPoint(x: 160, y: 0)
        }
        if(mapIndex==4){
            mapNode=SKSpriteNode(imageNamed: "Singapore_MRT_Circle")
            mapNode.name="Singapore_Circle_Button"
            mapNode.xScale=0.6
            mapNode.yScale=0.6
            mapNode.position=CGPoint(x: -480, y: 0)
        }
    }
}
