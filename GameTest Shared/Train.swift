//
//  Train.swift
//  GameTest
//
//  Created by H2026160 on 20/5/2025.
//

import Foundation
import SpriteKit

class Train:SKNode{
    private var isRunning: Bool=false
    private var trainNumber: Int
    private var trainNode: SKSpriteNode!
    
    init(trainNumber: Int, trainNode: SKSpriteNode!) {
        self.trainNumber = trainNumber
        self.trainNode = trainNode
        
        super.init()
        
        self.zPosition=9.0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
