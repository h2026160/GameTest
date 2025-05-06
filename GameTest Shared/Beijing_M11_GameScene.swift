//
//  Beijing_M11_GameScene.swift
//  GameTest
//
//  Created by H2026160 on 11/2/2025.
//

import SpriteKit

class Beijing_M11_GameScene: SKScene{
    private var MainNode=SKNode()
    private var hasScheduleButton: Bool=true
    private var scheduleButtonBackground: SKNode=GameSceneButtons(buttonNum: 5)
    private var scheduleTimePage: Int=0
    private var scheduleDepartureStationPage: Int=0
    private var scheduleTicketPricePage: Int=0
    private var scheduleSetupRowNumber: Int=1
    private var runGame: Bool=false
    private var startTime: TimeInterval=0
    private var pauseStartTime: TimeInterval=0
    private var totalTime: TimeInterval=0
    private var passengerFlow: Double=600.0
    let timeLabel=SKLabelNode(text: "Time:0")
    let passengerLabel=SKLabelNode(text: "0")
    let moneyLabel=SKLabelNode(text: "0")
    private var gameTime: TimeInterval=0{
        didSet{
            if gameTime>648000.0{
                winGame()
            }
        }
    }
    private var money: Double=120000.0{
        didSet{
            if money>360000{
                winGame()
            }
            if money<=0{
                loseGame()
            }
        }
    }
    private var totalPassenger: Double=0.0{
        didSet{
            if totalPassenger>450000{
                winGame()
            }
        }
    }


    
    override func didMove(to view: SKView) {
        startTime=Date().timeIntervalSinceReferenceDate
        
        timeLabel.position=CGPoint(x: 600, y: 260)
        timeLabel.fontSize=24
        timeLabel.fontColor = .blue
        timeLabel.fontName="Arial-BoldMT"
        addChild(timeLabel)
        
        passengerLabel.position=CGPoint(x: 0, y: 310)
        passengerLabel.fontSize=24
        passengerLabel.fontColor = .blue
        passengerLabel.fontName="Arial-BoldMT"
        addChild(passengerLabel)
        
        moneyLabel.position=CGPoint(x: 300, y: 310)
        moneyLabel.fontSize=24
        moneyLabel.fontColor = .blue
        moneyLabel.fontName="Arial-BoldMT"
        addChild(moneyLabel)
        
        setUpButton()
        setUpScheduleButton()
    }
    
    
    func winGame(){
        let newScene=SKScene(fileNamed: "MenuScene")
        self.view?.presentScene(newScene)
    }
    
    func loseGame(){
        let newScene=SKScene(fileNamed: "MenuScene")
        self.view?.presentScene(newScene)
    }
}
extension Beijing_M11_GameScene{
    func setUpButton(){
        for i in 1...4{
            MainNode.addChild(GameSceneButtons(buttonNum: i))
        }
        MainNode.addChild(GameSceneButtons(buttonNum: 25))
        MainNode.addChild(GameSceneButtons(buttonNum: 27))
        addChild(MainNode)
    }
    
    func setUpScheduleButton(){
        for i in 6...8{
            scheduleButtonBackground.addChild(GameSceneButtons(buttonNum: i))
        }
        for i in 12...16{
            scheduleButtonBackground.addChild(GameSceneButtons(buttonNum: i))
        }
        for i in 19...20{
            scheduleButtonBackground.addChild(GameSceneButtons(buttonNum: i))
        }
        for i in 23...24{
            scheduleButtonBackground.addChild(GameSceneButtons(buttonNum: i))
        }
        for i in 28...29{
            scheduleButtonBackground.addChild(GameSceneButtons(buttonNum: i))
        }
        scheduleButtonBackground.addChild(GameSceneButtons(buttonNum: 32))
        scheduleButtonBackground.addChild(GameSceneButtons(buttonNum: 34))

        //scheduleButtonBackground.addChild(GameSceneButtons(buttonNum: 23))
    }
    
    func setUpMovableSceduleButton(rowNumber: Int){
        
    }
    
    func updateTime(timePage: Int){
        let timeIndicatorLoaction=CGPoint(x: -300, y: 140)
        
        let nodes=nodes(at: timeIndicatorLoaction)
        for node in nodes {
            if (node.name=="Initial_Time")||(node.name=="Time(1)")||(node.name=="Time(2)")||(node.name=="Time(3)"){
                node.removeFromParent()
            }
        }
        scheduleButtonBackground.addChild(GameSceneButtons(buttonNum: 8+timePage))
    }
    
    func updateDepartureSatation(departureStationPage: Int){
        let departureStationIndicatorLoaction=CGPoint(x: -160, y: 140)
        let terminusStationIndicatorLoaction=CGPoint(x: -20, y: 140)
        
        let nodesA=nodes(at: departureStationIndicatorLoaction)
        for node in nodesA {
            if (node.name=="Initial_Departure_Station")||(node.name=="Moshikou_Station")||(node.name=="Shougang_Park_Station"){
                node.removeFromParent()
            }
        }
        scheduleButtonBackground.addChild(GameSceneButtons(buttonNum: 16+departureStationPage))
        
        let nodesB=nodes(at: terminusStationIndicatorLoaction)
        for node in nodesB {
            if (node.name=="Initial_Terminus_Station")||(node.name=="Moshikou_Station")||(node.name=="Shougang_Park_Station"){
                node.removeFromParent()
            }
        }
        scheduleButtonBackground.addChild(GameSceneButtons(buttonNum: 20+departureStationPage))
    }
    
    func updateTicketPrice(ticketPricePage: Int){
        let ticketPriceIndicatorLoaction=CGPoint(x: 120, y: 140)
        
        let nodes=nodes(at: ticketPriceIndicatorLoaction)
        for node in nodes {
            if(node.name=="Initial_Ticket_Price")||(node.name=="10_Yuan_Ticket_Price")||(node.name=="15_Yuan_Ticket_Price"){
                node.removeFromParent()
            }
        }
        scheduleButtonBackground.addChild(GameSceneButtons(buttonNum: 29+ticketPricePage))
    }
    
    func clearButtons(){
        let previousTimeButtonPosition=CGPoint(x: -322, y: 85)
        let nextTimeButtonPosition=CGPoint(x: -278, y: 85)
        let previousStationButtonPosition=CGPoint(x: -182, y: 85)
        let nextStationButtonPosition=CGPoint(x: -138, y: 85)
        let previousTicketPriceButtonPosition=CGPoint(x: 98, y: 85)
        let nextTicketPriceButtonPosition=CGPoint(x: 142, y: 85)
        let yesButtonPosition=CGPoint(x: 220, y: 140)
        
        let nodesA=nodes(at: previousTimeButtonPosition)
        for node in nodesA{
            if node.name=="Previous_Time_Button"{
                node.removeFromParent()
            }
        }
        let nodesB=nodes(at: nextTimeButtonPosition)
        for node in nodesB{
            if node.name=="Next_Time_Button"{
                node.removeFromParent()
            }
        }
        let nodesC=nodes(at: previousStationButtonPosition)
        for node in nodesC{
            if node.name=="Previous_Departure_Station_Button"{
                node.removeFromParent()
            }
        }
        let nodesD=nodes(at: nextStationButtonPosition)
        for node in nodesD{
            if node.name=="Next_Departure_Station_Button"{
                node.removeFromParent()
            }
        }
        let nodesE=nodes(at: previousTicketPriceButtonPosition)
        for node in nodesE{
            if node.name=="Previous_Ticket_Price_Button"{
                node.removeFromParent()
            }
        }
        let nodesF=nodes(at: nextTicketPriceButtonPosition)
        for node in nodesF{
            if node.name=="Next_Ticket_Price_Button"{
                node.removeFromParent()
            }
        }
        let nodesG=nodes(at: yesButtonPosition)
        for node in nodesG{
            if node.name=="Yes_Button"{
                node.removeFromParent()
            }
        }




    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let location=touches.first?.location(in: self)
//        let backgroundLoaction=CGPoint(x: 0, y: 0)
//        let timeIndicatorLoaction=CGPoint(x: -300, y: 140)
//        let departureStationIndicatorLoaction=CGPoint(x: -160, y: 140)
//        let excludedArea=CGRect(x: 0, y: 0, width: 479, height: 269)
        
        if(hasScheduleButton==false){
//            if(!excludedArea.contains(location!)){
//                let nodes=nodes(at: backgroundLoaction)
//                for node in nodes {
//                    if node.name=="Schedule_Button_Background"{
//                        MainNode.addChild(GameSceneButtons(buttonNum: 1))
//                        hasScheduleButton=true
//                        node.removeFromParent()
//                    }
//                }
//            }
            if(!scheduleButtonBackground.contains(location!)){
                MainNode.addChild(GameSceneButtons(buttonNum: 1))
                hasScheduleButton=true
                scheduleButtonBackground.removeFromParent()
            }
            else{
                let nodesA=nodes(at: location!)
                for node in nodesA {
                    if (node.name=="Next_Time_Button")&&(scheduleTimePage<3){
                        scheduleTimePage+=1
                        updateTime(timePage: scheduleTimePage)
                    }
                    if (node.name=="Previous_Time_Button")&&(scheduleTimePage>1){
                        scheduleTimePage-=1
                        updateTime(timePage: scheduleTimePage)
                    }
                    if (node.name=="Next_Departure_Station_Button")&&(scheduleDepartureStationPage<2){
                        scheduleDepartureStationPage+=1
                        updateDepartureSatation(departureStationPage: scheduleDepartureStationPage)
                    }
                    if (node.name=="Previous_Departure_Station_Button")&&(scheduleDepartureStationPage>1){
                        scheduleDepartureStationPage-=1
                        updateDepartureSatation(departureStationPage: scheduleDepartureStationPage)
                    }
                    if (node.name=="Next_Ticket_Price_Button")&&(scheduleTicketPricePage<2){
                        scheduleTicketPricePage+=1
                        updateTicketPrice(ticketPricePage: scheduleTicketPricePage)
                    }
                    if (node.name=="Previous_Ticket_Price_Button")&&(scheduleTicketPricePage>1){
                        scheduleTicketPricePage-=1
                        updateTicketPrice(ticketPricePage: scheduleTicketPricePage)
                    }
                    if node.name=="Yes_Button"{
                        clearButtons()
                    }
                }
            }
        }
        else{
            let nodes=nodes(at: location!)
            for node in nodes {
                if node.name=="ScheduleButton"{
                    MainNode.addChild(scheduleButtonBackground)
                    //MainNode.addChild(GameSceneButtons(buttonNum: 5))
                    hasScheduleButton=false
                    node.removeFromParent()
                }
            }
        }
        let normalNodes=nodes(at: location!)
        for node in normalNodes {
            if node.name=="Pause_Button"{
                MainNode.addChild(GameSceneButtons(buttonNum: 26))
                //startTime=Date().timeIntervalSinceReferenceDate
                runGame=true
                node.removeFromParent()
            }
            if node.name=="Play_Button"{
                MainNode.addChild(GameSceneButtons(buttonNum: 25))
                runGame=false
                node.removeFromParent()
            }
            if node.name=="Exit_Game_Scene_Button"{
                let newScene=SKScene(fileNamed: "NewGameSceneA")
                self.view?.presentScene(newScene)
            }
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        let currentTime=Date().timeIntervalSinceReferenceDate
        gameTime=currentTime-startTime
        let formattedTime = String(format: "Time: %.1f", gameTime)
        timeLabel.text = formattedTime
        
        if(gameTime>86400){
            passengerFlow=passengerFlow*pow((1+1/1200), gameTime/86400)
            totalPassenger+=passengerFlow/86400
        }
        else{
            totalPassenger+=passengerFlow/86400
        }
        let formattedPassenger = String(format: "%.0f", totalPassenger)
        passengerLabel.text = formattedPassenger
        
        let moneyChange=passengerFlow*5*Double(scheduleTicketPricePage)-6200.0/3600
        money+=moneyChange
        let formattedMoney = String(format: "%.1f", money)
        moneyLabel.text = formattedMoney
        
    }
}
