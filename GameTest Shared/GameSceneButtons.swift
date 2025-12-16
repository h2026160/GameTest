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
    private var buttonRowCount: Int
    private var buttonPageNum: Int
    private var gameSceneButtonNode: SKSpriteNode!
    
    init(buttonNum: Int) {
        self.buttonNum = buttonNum
        self.buttonRowCount=1
        self.buttonPageNum=1
        super.init()
        
        self.zPosition=6.0
        
        setUpGameButtons(buttonIndex: buttonNum)
    }
    
    init(buttonNum: Int,buttonRowCount: Int,buttonPageNum: Int) {
        self.buttonNum = buttonNum
        self.buttonRowCount = buttonRowCount
        self.buttonPageNum=buttonPageNum
        super.init()
        
        self.zPosition=6.0
        
        setUpMovableButtons(buttonIndex: buttonNum,buttonRow: buttonRowCount,buttonPage: buttonPageNum)
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
        if(buttonIndex==34){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Add")
            gameSceneButtonNode.name="Add_Button"
            gameSceneButtonNode.xScale=0.075
            gameSceneButtonNode.yScale=0.075
            gameSceneButtonNode.position=CGPoint(x: -380, y: 80)
        }
        if(buttonIndex==35){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Stop_Time")
            gameSceneButtonNode.name="Stop_Time_Title"
            gameSceneButtonNode.xScale=0.06
            gameSceneButtonNode.yScale=0.06
            gameSceneButtonNode.position=CGPoint(x: 260, y: 200)
        }
        if(buttonIndex==36){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Next_Object")
            gameSceneButtonNode.name="Next_Stop_Time_Button"
            gameSceneButtonNode.xScale=0.075
            gameSceneButtonNode.yScale=0.075
            gameSceneButtonNode.position=CGPoint(x: 282, y: 85)
        }
        if(buttonIndex==37){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Previous_Object")
            gameSceneButtonNode.name="Previous_Stop_Time_Button"
            gameSceneButtonNode.xScale=0.075
            gameSceneButtonNode.yScale=0.075
            gameSceneButtonNode.position=CGPoint(x: 238, y: 85)
        }
        if(buttonIndex==38){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Object(0)")
            gameSceneButtonNode.name="Initial_Stop_Time"
            gameSceneButtonNode.xScale=0.06
            gameSceneButtonNode.yScale=0.06
            gameSceneButtonNode.position=CGPoint(x: 260, y: 140)
        }
        if(buttonIndex==39){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "30s")
            gameSceneButtonNode.name="30_Seconds_Stop_Time"
            gameSceneButtonNode.xScale=0.06
            gameSceneButtonNode.yScale=0.06
            gameSceneButtonNode.position=CGPoint(x: 260, y: 140)
        }
        if(buttonIndex==40){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "45s")
            gameSceneButtonNode.name="45_Seconds_Stop_Time"
            gameSceneButtonNode.xScale=0.06
            gameSceneButtonNode.yScale=0.06
            gameSceneButtonNode.position=CGPoint(x: 260, y: 140)
        }
        if(buttonIndex==41){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "60s")
            gameSceneButtonNode.name="60_Seconds_Stop_Time"
            gameSceneButtonNode.xScale=0.06
            gameSceneButtonNode.yScale=0.06
            gameSceneButtonNode.position=CGPoint(x: 260, y: 140)
        }
        if(buttonIndex==42){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "11001")
            gameSceneButtonNode.name="M11_Train_1"
            gameSceneButtonNode.xScale=0.04
            gameSceneButtonNode.yScale=0.04
            gameSceneButtonNode.position=CGPoint(x: 400, y: 180)
        }
        if(buttonIndex==43){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "11002")
            gameSceneButtonNode.name="M11_Train_2"
            gameSceneButtonNode.xScale=0.04
            gameSceneButtonNode.yScale=0.04
            gameSceneButtonNode.position=CGPoint(x: 400, y: 130)
        }
        if(buttonIndex==44){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "11003")
            gameSceneButtonNode.name="M11_Train_3"
            gameSceneButtonNode.xScale=0.04
            gameSceneButtonNode.yScale=0.04
            gameSceneButtonNode.position=CGPoint(x: 400, y: 80)
        }
        if(buttonIndex==45){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "11004")
            gameSceneButtonNode.name="M11_Train_4"
            gameSceneButtonNode.xScale=0.04
            gameSceneButtonNode.yScale=0.04
            gameSceneButtonNode.position=CGPoint(x: 400, y: 30)
        }
        if(buttonIndex==46){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "11005")
            gameSceneButtonNode.name="M11_Train_5"
            gameSceneButtonNode.xScale=0.04
            gameSceneButtonNode.yScale=0.04
            gameSceneButtonNode.position=CGPoint(x: 400, y: -20)
        }
        if(buttonIndex==47){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "11001(H)")
            gameSceneButtonNode.name="M11_Train_1(H)"
            gameSceneButtonNode.xScale=0.04
            gameSceneButtonNode.yScale=0.04
            gameSceneButtonNode.position=CGPoint(x: 400, y: 180)
        }
        if(buttonIndex==48){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "11002(H)")
            gameSceneButtonNode.name="M11_Train_2(H)"
            gameSceneButtonNode.xScale=0.04
            gameSceneButtonNode.yScale=0.04
            gameSceneButtonNode.position=CGPoint(x: 400, y: 130)
        }
        if(buttonIndex==49){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "11003(H)")
            gameSceneButtonNode.name="M11_Train_3(H)"
            gameSceneButtonNode.xScale=0.04
            gameSceneButtonNode.yScale=0.04
            gameSceneButtonNode.position=CGPoint(x: 400, y: 80)
        }
        if(buttonIndex==50){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "11004(H)")
            gameSceneButtonNode.name="M11_Train_4(H)"
            gameSceneButtonNode.xScale=0.04
            gameSceneButtonNode.yScale=0.04
            gameSceneButtonNode.position=CGPoint(x: 400, y: 30)
        }
        if(buttonIndex==51){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "11005(H)")
            gameSceneButtonNode.name="M11_Train_5(H)"
            gameSceneButtonNode.xScale=0.04
            gameSceneButtonNode.yScale=0.04
            gameSceneButtonNode.position=CGPoint(x: 400, y: -20)
        }
        addChild(gameSceneButtonNode)
    }
    
    func setUpMovableButtons(buttonIndex: Int,buttonRow: Int,buttonPage: Int){
        if(buttonIndex==1){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Add")
            gameSceneButtonNode.name="Add_Button-\(buttonPage)"
            gameSceneButtonNode.xScale=0.075
            gameSceneButtonNode.yScale=0.075
            gameSceneButtonNode.position=CGPoint(x: -380, y: 140-110*buttonRow)
        }
        if(buttonIndex==2){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Time(0)")
            gameSceneButtonNode.name="Initial_Time\(buttonRow)-\(buttonPage)"
            gameSceneButtonNode.xScale=0.06
            gameSceneButtonNode.yScale=0.06
            gameSceneButtonNode.position=CGPoint(x: -300, y: 250-110*buttonRow)
        }
        if(buttonIndex==3){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Next_Object")
            gameSceneButtonNode.name="Next_Time_Button\(buttonRow)-\(buttonPage)"
            gameSceneButtonNode.xScale=0.075
            gameSceneButtonNode.yScale=0.075
            gameSceneButtonNode.position=CGPoint(x: -278, y: 195-110*buttonRow)
        }
        if(buttonIndex==4){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Previous_Object")
            gameSceneButtonNode.name="Previous_Time_Button\(buttonRow)-\(buttonPage)"
            gameSceneButtonNode.xScale=0.075
            gameSceneButtonNode.yScale=0.075
            gameSceneButtonNode.position=CGPoint(x: -322, y: 195-110*buttonRow)
        }
        if(buttonIndex==5){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Object(0)")
            gameSceneButtonNode.name="Initial_Departure_Station\(buttonRow)-\(buttonPage)"
            gameSceneButtonNode.xScale=0.06
            gameSceneButtonNode.yScale=0.06
            gameSceneButtonNode.position=CGPoint(x: -160, y: 250-110*buttonRow)
        }
        if(buttonIndex==6){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Next_Object")
            gameSceneButtonNode.name="Next_Departure_Station_Button\(buttonRow)-\(buttonPage)"
            gameSceneButtonNode.xScale=0.075
            gameSceneButtonNode.yScale=0.075
            gameSceneButtonNode.position=CGPoint(x: -138, y: 195-110*buttonRow)
        }
        if(buttonIndex==7){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Previous_Object")
            gameSceneButtonNode.name="Previous_Departure_Station_Button\(buttonRow)-\(buttonPage)"
            gameSceneButtonNode.xScale=0.075
            gameSceneButtonNode.yScale=0.075
            gameSceneButtonNode.position=CGPoint(x: -182, y: 195-110*buttonRow)
        }
        if(buttonIndex==8){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Object(0)")
            gameSceneButtonNode.name="Initial_Terminus_Station\(buttonRow)-\(buttonPage)"
            gameSceneButtonNode.xScale=0.06
            gameSceneButtonNode.yScale=0.06
            gameSceneButtonNode.position=CGPoint(x: -20, y: 250-110*buttonRow)
        }
        if(buttonIndex==9){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Moshikou")
            gameSceneButtonNode.name="Moshikou_Station\(buttonRow)-\(buttonPage)"
            gameSceneButtonNode.xScale=0.06
            gameSceneButtonNode.yScale=0.06
            gameSceneButtonNode.position=CGPoint(x: -160, y: 250-110*buttonRow)
        }
        if(buttonIndex==10){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Shougang_Park")
            gameSceneButtonNode.name="Shougang_Park_Station\(buttonRow)-\(buttonPage)"
            gameSceneButtonNode.xScale=0.06
            gameSceneButtonNode.yScale=0.06
            gameSceneButtonNode.position=CGPoint(x: -160, y: 250-110*buttonRow)
        }
        if(buttonIndex==11){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Shougang_Park")
            gameSceneButtonNode.name="Shougang_Park_Station\(buttonRow)-\(buttonPage)"
            gameSceneButtonNode.xScale=0.06
            gameSceneButtonNode.yScale=0.06
            gameSceneButtonNode.position=CGPoint(x: -20, y: 250-110*buttonRow)
        }
        if(buttonIndex==12){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Moshikou")
            gameSceneButtonNode.name="Moshikou_Station\(buttonRow)-\(buttonPage)"
            gameSceneButtonNode.xScale=0.06
            gameSceneButtonNode.yScale=0.06
            gameSceneButtonNode.position=CGPoint(x: -20, y: 250-110*buttonRow)
        }
        if(buttonIndex==13){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Time(1)")
            gameSceneButtonNode.name="1st_Time\(buttonRow)-\(buttonPage)"
            gameSceneButtonNode.xScale=0.06
            gameSceneButtonNode.yScale=0.06
            gameSceneButtonNode.position=CGPoint(x: -300, y: 250-110*buttonRow)
        }
        if(buttonIndex==14){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Time(2)")
            gameSceneButtonNode.name="2nd_Time\(buttonRow)-\(buttonPage)"
            gameSceneButtonNode.xScale=0.06
            gameSceneButtonNode.yScale=0.06
            gameSceneButtonNode.position=CGPoint(x: -300, y: 250-110*buttonRow)
        }
        if(buttonIndex==15){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Time(3)")
            gameSceneButtonNode.name="3rd_Time\(buttonRow)-\(buttonPage)"
            gameSceneButtonNode.xScale=0.06
            gameSceneButtonNode.yScale=0.06
            gameSceneButtonNode.position=CGPoint(x: -300, y: 250-110*buttonRow)
        }
        if(buttonIndex==16){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Time(4)")
            gameSceneButtonNode.name="4th_Time\(buttonRow)-\(buttonPage)"
            gameSceneButtonNode.xScale=0.06
            gameSceneButtonNode.yScale=0.06
            gameSceneButtonNode.position=CGPoint(x: -300, y: 250-110*buttonRow)
        }
        if(buttonIndex==17){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Time(5)")
            gameSceneButtonNode.name="5th_Time\(buttonRow)-\(buttonPage)"
            gameSceneButtonNode.xScale=0.06
            gameSceneButtonNode.yScale=0.06
            gameSceneButtonNode.position=CGPoint(x: -300, y: 250-110*buttonRow)
        }
        if(buttonIndex==18){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Time(6)")
            gameSceneButtonNode.name="6th_Time\(buttonRow)-\(buttonPage)"
            gameSceneButtonNode.xScale=0.06
            gameSceneButtonNode.yScale=0.06
            gameSceneButtonNode.position=CGPoint(x: -300, y: 250-110*buttonRow)
        }
        if(buttonIndex==19){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Time(7)")
            gameSceneButtonNode.name="7th_Time\(buttonRow)-\(buttonPage)"
            gameSceneButtonNode.xScale=0.06
            gameSceneButtonNode.yScale=0.06
            gameSceneButtonNode.position=CGPoint(x: -300, y: 250-110*buttonRow)
        }
        if(buttonIndex==20){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Time(8)")
            gameSceneButtonNode.name="8th_Time\(buttonRow)-\(buttonPage)"
            gameSceneButtonNode.xScale=0.06
            gameSceneButtonNode.yScale=0.06
            gameSceneButtonNode.position=CGPoint(x: -300, y: 250-110*buttonRow)
        }
        if(buttonIndex==21){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Time(9)")
            gameSceneButtonNode.name="9th_Time\(buttonRow)-\(buttonPage)"
            gameSceneButtonNode.xScale=0.06
            gameSceneButtonNode.yScale=0.06
            gameSceneButtonNode.position=CGPoint(x: -300, y: 250-110*buttonRow)
        }
        if(buttonIndex==22){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Time(10)")
            gameSceneButtonNode.name="10th_Time\(buttonRow)-\(buttonPage)"
            gameSceneButtonNode.xScale=0.06
            gameSceneButtonNode.yScale=0.06
            gameSceneButtonNode.position=CGPoint(x: -300, y: 250-110*buttonRow)
        }
        if(buttonIndex==23){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Time(11)")
            gameSceneButtonNode.name="11th_Time\(buttonRow)-\(buttonPage)"
            gameSceneButtonNode.xScale=0.06
            gameSceneButtonNode.yScale=0.06
            gameSceneButtonNode.position=CGPoint(x: -300, y: 250-110*buttonRow)
        }
        if(buttonIndex==24){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Time(12)")
            gameSceneButtonNode.name="12th_Time\(buttonRow)-\(buttonPage)"
            gameSceneButtonNode.xScale=0.06
            gameSceneButtonNode.yScale=0.06
            gameSceneButtonNode.position=CGPoint(x: -300, y: 250-110*buttonRow)
        }
        if(buttonIndex==25){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Time(13)")
            gameSceneButtonNode.name="13th_Time\(buttonRow)-\(buttonPage)"
            gameSceneButtonNode.xScale=0.06
            gameSceneButtonNode.yScale=0.06
            gameSceneButtonNode.position=CGPoint(x: -300, y: 250-110*buttonRow)
        }
        if(buttonIndex==26){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Time(14)")
            gameSceneButtonNode.name="14th_Time\(buttonRow)-\(buttonPage)"
            gameSceneButtonNode.xScale=0.06
            gameSceneButtonNode.yScale=0.06
            gameSceneButtonNode.position=CGPoint(x: -300, y: 250-110*buttonRow)
        }
        if(buttonIndex==27){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Time(15)")
            gameSceneButtonNode.name="15th_Time\(buttonRow)-\(buttonPage)"
            gameSceneButtonNode.xScale=0.06
            gameSceneButtonNode.yScale=0.06
            gameSceneButtonNode.position=CGPoint(x: -300, y: 250-110*buttonRow)
        }
        if(buttonIndex==28){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Time(16)")
            gameSceneButtonNode.name="16th_Time\(buttonRow)-\(buttonPage)"
            gameSceneButtonNode.xScale=0.06
            gameSceneButtonNode.yScale=0.06
            gameSceneButtonNode.position=CGPoint(x: -300, y: 250-110*buttonRow)
        }
        if(buttonIndex==29){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Time(17)")
            gameSceneButtonNode.name="17th_Time\(buttonRow)-\(buttonPage)"
            gameSceneButtonNode.xScale=0.06
            gameSceneButtonNode.yScale=0.06
            gameSceneButtonNode.position=CGPoint(x: -300, y: 250-110*buttonRow)
        }
        if(buttonIndex==30){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Time(18)")
            gameSceneButtonNode.name="18th_Time\(buttonRow)-\(buttonPage)"
            gameSceneButtonNode.xScale=0.06
            gameSceneButtonNode.yScale=0.06
            gameSceneButtonNode.position=CGPoint(x: -300, y: 250-110*buttonRow)
        }
        if(buttonIndex==31){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Time(19)")
            gameSceneButtonNode.name="19th_Time\(buttonRow)-\(buttonPage)"
            gameSceneButtonNode.xScale=0.06
            gameSceneButtonNode.yScale=0.06
            gameSceneButtonNode.position=CGPoint(x: -300, y: 250-110*buttonRow)
        }
        if(buttonIndex==32){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Time(20)")
            gameSceneButtonNode.name="20th_Time\(buttonRow)-\(buttonPage)"
            gameSceneButtonNode.xScale=0.06
            gameSceneButtonNode.yScale=0.06
            gameSceneButtonNode.position=CGPoint(x: -300, y: 250-110*buttonRow)
        }
        if(buttonIndex==33){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Time(21)")
            gameSceneButtonNode.name="21st_Time\(buttonRow)-\(buttonPage)"
            gameSceneButtonNode.xScale=0.06
            gameSceneButtonNode.yScale=0.06
            gameSceneButtonNode.position=CGPoint(x: -300, y: 250-110*buttonRow)
        }
        if(buttonIndex==34){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Time(22)")
            gameSceneButtonNode.name="22nd_Time\(buttonRow)-\(buttonPage)"
            gameSceneButtonNode.xScale=0.06
            gameSceneButtonNode.yScale=0.06
            gameSceneButtonNode.position=CGPoint(x: -300, y: 250-110*buttonRow)
        }
        if(buttonIndex==35){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Time(23)")
            gameSceneButtonNode.name="23rd_Time\(buttonRow)-\(buttonPage)"
            gameSceneButtonNode.xScale=0.06
            gameSceneButtonNode.yScale=0.06
            gameSceneButtonNode.position=CGPoint(x: -300, y: 250-110*buttonRow)
        }
        if(buttonIndex==36){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Time(24)")
            gameSceneButtonNode.name="24th_Time\(buttonRow)-\(buttonPage)"
            gameSceneButtonNode.xScale=0.06
            gameSceneButtonNode.yScale=0.06
            gameSceneButtonNode.position=CGPoint(x: -300, y: 250-110*buttonRow)
        }
        if(buttonIndex==37){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Time(25)")
            gameSceneButtonNode.name="25th_Time\(buttonRow)-\(buttonPage)"
            gameSceneButtonNode.xScale=0.06
            gameSceneButtonNode.yScale=0.06
            gameSceneButtonNode.position=CGPoint(x: -300, y: 250-110*buttonRow)
        }
        if(buttonIndex==38){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Time(26)")
            gameSceneButtonNode.name="26th_Time\(buttonRow)-\(buttonPage)"
            gameSceneButtonNode.xScale=0.06
            gameSceneButtonNode.yScale=0.06
            gameSceneButtonNode.position=CGPoint(x: -300, y: 250-110*buttonRow)
        }
        if(buttonIndex==39){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Time(27)")
            gameSceneButtonNode.name="27th_Time\(buttonRow)-\(buttonPage)"
            gameSceneButtonNode.xScale=0.06
            gameSceneButtonNode.yScale=0.06
            gameSceneButtonNode.position=CGPoint(x: -300, y: 250-110*buttonRow)
        }
        if(buttonIndex==40){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Time(28)")
            gameSceneButtonNode.name="28th_Time\(buttonRow)-\(buttonPage)"
            gameSceneButtonNode.xScale=0.06
            gameSceneButtonNode.yScale=0.06
            gameSceneButtonNode.position=CGPoint(x: -300, y: 250-110*buttonRow)
        }
        if(buttonIndex==41){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Time(29)")
            gameSceneButtonNode.name="29th_Time\(buttonRow)-\(buttonPage)"
            gameSceneButtonNode.xScale=0.06
            gameSceneButtonNode.yScale=0.06
            gameSceneButtonNode.position=CGPoint(x: -300, y: 250-110*buttonRow)
        }
        if(buttonIndex==42){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Time(30)")
            gameSceneButtonNode.name="30th_Time\(buttonRow)-\(buttonPage)"
            gameSceneButtonNode.xScale=0.06
            gameSceneButtonNode.yScale=0.06
            gameSceneButtonNode.position=CGPoint(x: -300, y: 250-110*buttonRow)
        }
        if(buttonIndex==43){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Time(31)")
            gameSceneButtonNode.name="31st_Time\(buttonRow)-\(buttonPage)"
            gameSceneButtonNode.xScale=0.06
            gameSceneButtonNode.yScale=0.06
            gameSceneButtonNode.position=CGPoint(x: -300, y: 250-110*buttonRow)
        }
        if(buttonIndex==44){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Time(32)")
            gameSceneButtonNode.name="32nd_Time\(buttonRow)-\(buttonPage)"
            gameSceneButtonNode.xScale=0.06
            gameSceneButtonNode.yScale=0.06
            gameSceneButtonNode.position=CGPoint(x: -300, y: 250-110*buttonRow)
        }
        if(buttonIndex==45){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Time(33)")
            gameSceneButtonNode.name="33rd_Time\(buttonRow)-\(buttonPage)"
            gameSceneButtonNode.xScale=0.06
            gameSceneButtonNode.yScale=0.06
            gameSceneButtonNode.position=CGPoint(x: -300, y: 250-110*buttonRow)
        }
        if(buttonIndex==46){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Time(34)")
            gameSceneButtonNode.name="34th_Time\(buttonRow)-\(buttonPage)"
            gameSceneButtonNode.xScale=0.06
            gameSceneButtonNode.yScale=0.06
            gameSceneButtonNode.position=CGPoint(x: -300, y: 250-110*buttonRow)
        }
        if(buttonIndex==47){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Time(35)")
            gameSceneButtonNode.name="35th_Time\(buttonRow)-\(buttonPage)"
            gameSceneButtonNode.xScale=0.06
            gameSceneButtonNode.yScale=0.06
            gameSceneButtonNode.position=CGPoint(x: -300, y: 250-110*buttonRow)
        }
        if(buttonIndex==48){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Time(36)")
            gameSceneButtonNode.name="36th_Time\(buttonRow)-\(buttonPage)"
            gameSceneButtonNode.xScale=0.06
            gameSceneButtonNode.yScale=0.06
            gameSceneButtonNode.position=CGPoint(x: -300, y: 250-110*buttonRow)
        }
        if(buttonIndex==49){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Time(37)")
            gameSceneButtonNode.name="37th_Time\(buttonRow)-\(buttonPage)"
            gameSceneButtonNode.xScale=0.06
            gameSceneButtonNode.yScale=0.06
            gameSceneButtonNode.position=CGPoint(x: -300, y: 250-110*buttonRow)
        }
        if(buttonIndex==50){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Time(38)")
            gameSceneButtonNode.name="38th_Time\(buttonRow)-\(buttonPage)"
            gameSceneButtonNode.xScale=0.06
            gameSceneButtonNode.yScale=0.06
            gameSceneButtonNode.position=CGPoint(x: -300, y: 250-110*buttonRow)
        }
        if(buttonIndex==51){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Time(39)")
            gameSceneButtonNode.name="39th_Time\(buttonRow)-\(buttonPage)"
            gameSceneButtonNode.xScale=0.06
            gameSceneButtonNode.yScale=0.06
            gameSceneButtonNode.position=CGPoint(x: -300, y: 250-110*buttonRow)
        }
        if(buttonIndex==52){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Time(40)")
            gameSceneButtonNode.name="40th_Time\(buttonRow)-\(buttonPage)"
            gameSceneButtonNode.xScale=0.06
            gameSceneButtonNode.yScale=0.06
            gameSceneButtonNode.position=CGPoint(x: -300, y: 250-110*buttonRow)
        }
        if(buttonIndex==53){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Time(41)")
            gameSceneButtonNode.name="41st_Time\(buttonRow)-\(buttonPage)"
            gameSceneButtonNode.xScale=0.06
            gameSceneButtonNode.yScale=0.06
            gameSceneButtonNode.position=CGPoint(x: -300, y: 250-110*buttonRow)
        }
        if(buttonIndex==54){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Time(42)")
            gameSceneButtonNode.name="42nd_Time\(buttonRow)-\(buttonPage)"
            gameSceneButtonNode.xScale=0.06
            gameSceneButtonNode.yScale=0.06
            gameSceneButtonNode.position=CGPoint(x: -300, y: 250-110*buttonRow)
        }
        if(buttonIndex==55){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Time(43)")
            gameSceneButtonNode.name="43rd_Time\(buttonRow)-\(buttonPage)"
            gameSceneButtonNode.xScale=0.06
            gameSceneButtonNode.yScale=0.06
            gameSceneButtonNode.position=CGPoint(x: -300, y: 250-110*buttonRow)
        }
        if(buttonIndex==56){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Time(44)")
            gameSceneButtonNode.name="44th_Time\(buttonRow)-\(buttonPage)"
            gameSceneButtonNode.xScale=0.06
            gameSceneButtonNode.yScale=0.06
            gameSceneButtonNode.position=CGPoint(x: -300, y: 250-110*buttonRow)
        }
        if(buttonIndex==57){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Time(45)")
            gameSceneButtonNode.name="45th_Time\(buttonRow)-\(buttonPage)"
            gameSceneButtonNode.xScale=0.06
            gameSceneButtonNode.yScale=0.06
            gameSceneButtonNode.position=CGPoint(x: -300, y: 250-110*buttonRow)
        }
        if(buttonIndex==58){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Time(46)")
            gameSceneButtonNode.name="46th_Time\(buttonRow)-\(buttonPage)"
            gameSceneButtonNode.xScale=0.06
            gameSceneButtonNode.yScale=0.06
            gameSceneButtonNode.position=CGPoint(x: -300, y: 250-110*buttonRow)
        }
        if(buttonIndex==59){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Time(47)")
            gameSceneButtonNode.name="47th_Time\(buttonRow)-\(buttonPage)"
            gameSceneButtonNode.xScale=0.06
            gameSceneButtonNode.yScale=0.06
            gameSceneButtonNode.position=CGPoint(x: -300, y: 250-110*buttonRow)
        }
        if(buttonIndex==60){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Time(48)")
            gameSceneButtonNode.name="48th_Time\(buttonRow)-\(buttonPage)"
            gameSceneButtonNode.xScale=0.06
            gameSceneButtonNode.yScale=0.06
            gameSceneButtonNode.position=CGPoint(x: -300, y: 250-110*buttonRow)
        }
        if(buttonIndex==61){
            gameSceneButtonNode=SKSpriteNode(imageNamed: "Time(49)")
            gameSceneButtonNode.name="49th_Time\(buttonRow)-\(buttonPage)"
            gameSceneButtonNode.xScale=0.06
            gameSceneButtonNode.yScale=0.06
            gameSceneButtonNode.position=CGPoint(x: -300, y: 250-110*buttonRow)
        }
        addChild(gameSceneButtonNode)
    }
}
