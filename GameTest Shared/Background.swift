//
//  Background.swift
//  GameTest
//
//  Created by H2026160 on 28/8/2025.
//

import Foundation
import SpriteKit

class Background: SKNode{
    private var backgroundNum: Int
    private var backgroundNode: SKSpriteNode!
    
    init(backgroundNum: Int) {
        self.backgroundNum = backgroundNum
        super.init()
        
        self.zPosition=1
        
        setGameSceneBackground()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension Background{
    func setGameSceneBackground(){
        if backgroundNum==2{
            backgroundNode=SKSpriteNode(imageNamed: "Beijing_M6_Background")
            backgroundNode.name="Beijing_M6_BackgroundNode"
            backgroundNode.xScale=1
            backgroundNode.yScale=1
            backgroundNode.position=CGPoint(x: 0, y: 0)
        }
        addChild(backgroundNode)
    }
}
