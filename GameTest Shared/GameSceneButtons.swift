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
        if(buttonIndex==6){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Time(0)")
            gameSceneButtonNode.name="Initial_Time"
            gameSceneButtonNode.xScale=0.06
            gameSceneButtonNode.yScale=0.06
            gameSceneButtonNode.position=CGPoint(x: -300, y: 140)
        }
        if(buttonIndex==7){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Next_Object")
            gameSceneButtonNode.name="Next_Time_Button"
            gameSceneButtonNode.xScale=0.075
            gameSceneButtonNode.yScale=0.075
            gameSceneButtonNode.position=CGPoint(x: -278, y: 85)
        }
        if(buttonIndex==8){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Previous_Object")
            gameSceneButtonNode.name="Previous_Time_Button"
            gameSceneButtonNode.xScale=0.075
            gameSceneButtonNode.yScale=0.075
            gameSceneButtonNode.position=CGPoint(x: -322, y: 85)
        }
        if(buttonIndex==9){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Time(1)")
            gameSceneButtonNode.name="First_Time"
            gameSceneButtonNode.xScale=0.06
            gameSceneButtonNode.yScale=0.06
            gameSceneButtonNode.position=CGPoint(x: -300, y: 140)
        }
        if(buttonIndex==10){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Time(2)")
            gameSceneButtonNode.name="Second_Time"
            gameSceneButtonNode.xScale=0.06
            gameSceneButtonNode.yScale=0.06
            gameSceneButtonNode.position=CGPoint(x: -300, y: 140)
        }
        if(buttonIndex==11){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Time(3)")
            gameSceneButtonNode.name="Third_Time"
            gameSceneButtonNode.xScale=0.06
            gameSceneButtonNode.yScale=0.06
            gameSceneButtonNode.position=CGPoint(x: -300, y: 140)
        }
        if(buttonIndex==12){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Departure_Time")
            gameSceneButtonNode.name="Time_Title"
            gameSceneButtonNode.xScale=0.06
            gameSceneButtonNode.yScale=0.06
            gameSceneButtonNode.position=CGPoint(x: -300, y: 200)
        }
        if(buttonIndex==13){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Departure_Station")
            gameSceneButtonNode.name="Departing_Station_Title"
            gameSceneButtonNode.xScale=0.06
            gameSceneButtonNode.yScale=0.06
            gameSceneButtonNode.position=CGPoint(x: -160, y: 200)
        }
        if(buttonIndex==14){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Object(0)")
            gameSceneButtonNode.name="Initial_Departure_Station"
            gameSceneButtonNode.xScale=0.06
            gameSceneButtonNode.yScale=0.06
            gameSceneButtonNode.position=CGPoint(x: -160, y: 140)
        }
        if(buttonIndex==15){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Next_Object")
            gameSceneButtonNode.name="Next_Departure_Station_Button"
            gameSceneButtonNode.xScale=0.075
            gameSceneButtonNode.yScale=0.075
            gameSceneButtonNode.position=CGPoint(x: -138, y: 85)
        }
        if(buttonIndex==16){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Previous_Object")
            gameSceneButtonNode.name="Previous_Departure_Station_Button"
            gameSceneButtonNode.xScale=0.075
            gameSceneButtonNode.yScale=0.075
            gameSceneButtonNode.position=CGPoint(x: -182, y: 85)
        }
        if(buttonIndex==17){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Moshikou")
            gameSceneButtonNode.name="Moshikou_Station"
            gameSceneButtonNode.xScale=0.06
            gameSceneButtonNode.yScale=0.06
            gameSceneButtonNode.position=CGPoint(x: -160, y: 140)
        }
        if(buttonIndex==18){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Shougang_Park")
            gameSceneButtonNode.name="Shougang_Park_Station"
            gameSceneButtonNode.xScale=0.06
            gameSceneButtonNode.yScale=0.06
            gameSceneButtonNode.position=CGPoint(x: -160, y: 140)
        }
        if(buttonIndex==19){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Terminus_Station")
            gameSceneButtonNode.name="Terminus_Station_Title"
            gameSceneButtonNode.xScale=0.06
            gameSceneButtonNode.yScale=0.06
            gameSceneButtonNode.position=CGPoint(x: -20, y: 200)
        }
        if(buttonIndex==20){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Object(0)")
            gameSceneButtonNode.name="Initial_Terminus_Station"
            gameSceneButtonNode.xScale=0.06
            gameSceneButtonNode.yScale=0.06
            gameSceneButtonNode.position=CGPoint(x: -20, y: 140)
        }
        if(buttonIndex==21){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Shougang_Park")
            gameSceneButtonNode.name="Shougang_Park_Station"
            gameSceneButtonNode.xScale=0.06
            gameSceneButtonNode.yScale=0.06
            gameSceneButtonNode.position=CGPoint(x: -20, y: 140)
        }
        if(buttonIndex==22){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Moshikou")
            gameSceneButtonNode.name="Moshikou_Station"
            gameSceneButtonNode.xScale=0.06
            gameSceneButtonNode.yScale=0.06
            gameSceneButtonNode.position=CGPoint(x: -20, y: 140)
        }
        if(buttonIndex==23){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Ticket_Price")
            gameSceneButtonNode.name="Ticket_Price_Title"
            gameSceneButtonNode.xScale=0.06
            gameSceneButtonNode.yScale=0.06
            gameSceneButtonNode.position=CGPoint(x: 120, y: 200)
        }
        if(buttonIndex==24){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Object(0)")
            gameSceneButtonNode.name="Initial_Ticket_Price"
            gameSceneButtonNode.xScale=0.06
            gameSceneButtonNode.yScale=0.06
            gameSceneButtonNode.position=CGPoint(x: 120, y: 140)
        }
        if(buttonIndex==25){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Pause")
            gameSceneButtonNode.name="Pause_Button"
            gameSceneButtonNode.xScale=0.2
            gameSceneButtonNode.yScale=0.2
            gameSceneButtonNode.position=CGPoint(x: 600, y: -300)
        }
        if(buttonIndex==26){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Play")
            gameSceneButtonNode.name="Play_Button"
            gameSceneButtonNode.xScale=0.2
            gameSceneButtonNode.yScale=0.2
            gameSceneButtonNode.position=CGPoint(x: 600, y: -300)
        }
        if(buttonIndex==27){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Exit_Game_Icon")
            gameSceneButtonNode.name="Exit_Game_Scene_Button"
            gameSceneButtonNode.xScale=0.2
            gameSceneButtonNode.yScale=0.2
            gameSceneButtonNode.position=CGPoint(x: -600, y: -300)
        }
        if(buttonIndex==28){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Next_Object")
            gameSceneButtonNode.name="Next_Ticket_Price_Button"
            gameSceneButtonNode.xScale=0.075
            gameSceneButtonNode.yScale=0.075
            gameSceneButtonNode.position=CGPoint(x: 142, y: 85)
        }
        if(buttonIndex==29){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Previous_Object")
            gameSceneButtonNode.name="Previous_Ticket_Price_Button"
            gameSceneButtonNode.xScale=0.075
            gameSceneButtonNode.yScale=0.075
            gameSceneButtonNode.position=CGPoint(x: 98, y: 85)
        }
        if(buttonIndex==30){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "10_Yuan")
            gameSceneButtonNode.name="10_Yuan_Ticket_Price"
            gameSceneButtonNode.xScale=0.06
            gameSceneButtonNode.yScale=0.06
            gameSceneButtonNode.position=CGPoint(x: 120, y: 140)
        }
        if(buttonIndex==31){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "15_Yuan")
            gameSceneButtonNode.name="15_Yuan_Ticket_Price"
            gameSceneButtonNode.xScale=0.06
            gameSceneButtonNode.yScale=0.06
            gameSceneButtonNode.position=CGPoint(x: 120, y: 140)
        }
        if(buttonIndex==32){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Yes")
            gameSceneButtonNode.name="Yes_Button"
            gameSceneButtonNode.xScale=0.075
            gameSceneButtonNode.yScale=0.075
            gameSceneButtonNode.position=CGPoint(x: 220, y: 140)
        }
        if(buttonIndex==33){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "No")
            gameSceneButtonNode.name="No_Button"
            gameSceneButtonNode.xScale=0.075
            gameSceneButtonNode.yScale=0.075
            gameSceneButtonNode.position=CGPoint(x: 280, y: 140)
        }
        addChild(gameSceneButtonNode)
    }
}
