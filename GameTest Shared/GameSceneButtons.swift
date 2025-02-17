//
//  GameSceneButtons.swift
//  GameTest
//
//  Created by H2026160 on 11/2/2025.
//

import Foundation
import SpriteKit

class GameSceneButtons: SKNode{
    private var buttonNum: Int
    private var gameSceneButtonNode: SKSpriteNode!
    
    init(buttonNum: Int) {
        self.buttonNum = buttonNum
        super.init()
        
        self.zPosition=6.0
        
        setUpGameButtons(buttonIndex: buttonNum)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension GameSceneButtons{
    func setUpGameButtons(buttonIndex: Int){
        if(buttonIndex==1){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Schedule")
            gameSceneButtonNode.name="ScheduleButton"
            gameSceneButtonNode.xScale=0.1
            gameSceneButtonNode.yScale=0.1
            gameSceneButtonNode.position=CGPoint(x: 0, y: -320)
        }
        if(buttonIndex==2){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Time_Indicator")
            gameSceneButtonNode.name="Time_Indicator_Button"
            gameSceneButtonNode.xScale=0.1
            gameSceneButtonNode.yScale=0.1
            gameSceneButtonNode.position=CGPoint(x: 600, y: 320)
        }
        if(buttonIndex==3){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Money_Icon")
            gameSceneButtonNode.name="Money_Indicator_Button"
            gameSceneButtonNode.xScale=0.1
            gameSceneButtonNode.yScale=0.1
            gameSceneButtonNode.position=CGPoint(x: 160, y: 320)
        }
        if(buttonIndex==4){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Passenger_Icon")
            gameSceneButtonNode.name="Passenger_Indicator_Button"
            gameSceneButtonNode.xScale=0.1
            gameSceneButtonNode.yScale=0.1
            gameSceneButtonNode.position=CGPoint(x: -160, y: 320)
        }
        if(buttonIndex==5){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Schedule_Background")
            gameSceneButtonNode.name="Schedule_Button_Background"
            gameSceneButtonNode.xScale=0.7
            gameSceneButtonNode.yScale=0.7
            gameSceneButtonNode.position=CGPoint(x: 0, y: 0)
        }
        addChild(gameSceneButtonNode)
    }
}
