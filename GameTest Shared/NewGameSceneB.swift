//
//  NewGameSceneB.swift
//  GameTest
//
//  Created by H2026160 on 10/1/2025.
//

import SpriteKit

class NewGameSceneB: SKScene{
    private var MainNode=SKNode()
    private var MapNumber:Int
    
    init(MapNumber: Int) {
        self.MapNumber = MapNumber
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func didMove(to view: SKView) {
        addChild(MainNode)
    }
}
