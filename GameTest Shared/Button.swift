//
//  Button.swift
//  GameTest
//
//  Created by H2026160 on 3/12/2024.
//

import Foundation
import SpriteKit

class Button: SKNode {
    private var isPressed: Bool
    private var buttonNum: Int
    private var buttonNode: SKSpriteNode!
        
    init(buttonNum: Int) {
        self.isPressed=false
        self.buttonNum = buttonNum
        super.init()
        
        self.zPosition=8.0
        
        setButton()
        
        isUserInteractionEnabled=true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension Button{
    func setButton(){
        if(buttonNum==0){
            buttonNode=SKSpriteNode(imageNamed: "Continue_Game")
            buttonNode.name="ContinueGameButton"
            buttonNode.xScale=0.1
            buttonNode.yScale=0.1
            buttonNode.position=CGPoint(x: 0, y: 160)
        }
        if(buttonNum==1){
            buttonNode=SKSpriteNode(imageNamed: "New_Game")
            buttonNode.name="NewGameButton"
            buttonNode.xScale=0.1
            buttonNode.yScale=0.1
            buttonNode.position=CGPoint(x: 0, y: 70)
        }
        if(buttonNum==2){
            buttonNode=SKSpriteNode(imageNamed: "Load_Game")
            buttonNode.name="LoadGameButton"
            buttonNode.xScale=0.1
            buttonNode.yScale=0.1
            buttonNode.position=CGPoint(x: 0, y: -20)
        }
        if(buttonNum==3){
            buttonNode=SKSpriteNode(imageNamed: "About")
            buttonNode.name="AboutButton"
            buttonNode.xScale=0.1
            buttonNode.yScale=0.1
            buttonNode.position=CGPoint(x: 0, y: -110)
        }
        if(buttonNum==4){
            buttonNode=SKSpriteNode(imageNamed: "Settings")
            buttonNode.name="SettingsButton"
            buttonNode.xScale=0.1
            buttonNode.yScale=0.1
            buttonNode.position=CGPoint(x: 0, y: -200)
        }
        if(buttonNum==5){
            buttonNode=SKSpriteNode(imageNamed: "Exit_Game")
            buttonNode.name="ExitGameButton"
            buttonNode.xScale=0.1
            buttonNode.yScale=0.1
            buttonNode.position=CGPoint(x: 0, y: -290)
        }
        if(buttonNum==6){
            buttonNode=SKSpriteNode(imageNamed: "News")
            buttonNode.name="NewsButton"
            buttonNode.xScale=0.1
            buttonNode.yScale=0.1
            buttonNode.position=CGPoint(x: -320, y: 70)
        }
        if(buttonNum==7){
            buttonNode=SKSpriteNode(imageNamed: "Achievements")
            buttonNode.name="AchievementsButton"
            buttonNode.xScale=0.1
            buttonNode.yScale=0.1
            buttonNode.position=CGPoint(x: 320, y: 70)
        }
        if(buttonNum==8){
            buttonNode=SKSpriteNode(imageNamed: "Daily_Challenges")
            buttonNode.name="DailyChallengesButton"
            buttonNode.xScale=0.1
            buttonNode.yScale=0.1
            buttonNode.position=CGPoint(x: -320, y: -200)
        }
        if(buttonNum==9){
            buttonNode=SKSpriteNode(imageNamed: "Mods")
            buttonNode.name="ModsButton"
            buttonNode.xScale=0.1
            buttonNode.yScale=0.1
            buttonNode.position=CGPoint(x: 320, y: -200)
        }
        addChild(buttonNode)
    }
}
