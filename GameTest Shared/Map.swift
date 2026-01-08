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
        if(mapNum<100){
            setUpMapA(mapIndex: mapNum)
        }else{
            setUpDCMap(mapIndex: mapNum)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension Map{
    func setUpMapA(mapIndex: Int){   // sets up the button for the map
        if(mapIndex==1){
            mapNode=SKSpriteNode(imageNamed: "Beijing_M11")
            mapNode.name="Beijing_M11_Button"
            mapNode.xScale=0.6
            mapNode.yScale=0.6
            mapNode.position=CGPoint(x: -480, y: 0)
        }
        if(mapIndex==2){
            mapNode=SKSpriteNode(imageNamed: "Beijing_M6")
            mapNode.name="Beijing_M6_Button"
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
        addChild(mapNode)
    }
    
    func setUpDCMap(mapIndex: Int){   // sets up the button for the map
        if(mapIndex==101){
            mapNode=SKSpriteNode(imageNamed: "Beijing_M11")
            mapNode.name="Beijing_M11_Button"
            mapNode.xScale=0.6
            mapNode.yScale=0.6
            mapNode.position=CGPoint(x: -400, y: 0)
        }
        if(mapIndex==102){
            mapNode=SKSpriteNode(imageNamed: "MTR_East_Rail")
            mapNode.name="MTR_East_Rail_Button"
            mapNode.xScale=0.6
            mapNode.yScale=0.6
            mapNode.position=CGPoint(x: -400, y: 0)
        }
        if(mapIndex==103){
            mapNode=SKSpriteNode(imageNamed: "Shenzhen_M11")
            mapNode.name="Shenzhen_M11_Button"
            mapNode.xScale=0.6
            mapNode.yScale=0.6
            mapNode.position=CGPoint(x: -400, y: 0)
        }
        if(mapIndex==104){
            mapNode=SKSpriteNode(imageNamed: "Singapore_MRT_Circle")
            mapNode.name="Singapore_Circle_Button"
            mapNode.xScale=0.6
            mapNode.yScale=0.6
            mapNode.position=CGPoint(x: -400, y: 0)
        }
        addChild(mapNode)
    }
}
