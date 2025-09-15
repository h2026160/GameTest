//
//  Beijing_M6_GameScene.swift
//  GameTest
//
//  Created by H2026160 on 28/8/2025.
//

import Foundation
import SpriteKit

class Beijing_M6_GameScene: SKScene{
    var sceneCamera: SKCameraNode!
    
    var targetPosition: CGPoint = .zero
    var targetScale: CGFloat = 1.0
    
    var lastTouchLocation: CGPoint?
    var lastPinchDistance: CGFloat?
    
    private var MainNode=SKNode()
    private var hasScheduleButton: Bool=true
    private var scheduleButtonBackground: SKNode=GameSceneButtons(buttonNum: 5)
    private var scheduleTimePage: Int=0
    private var scheduleDepartureStationPage: Int=0
    private var scheduleTicketPricePage: Int=0
    private var scheduleStopTimePage: Int=0
    
    private var runGame: Bool=false
    private var startTime: TimeInterval=0
    private var passengerFlow: Double=11300.0
    private var timeDouble: Double=1.0
    private var pauseTime: TimeInterval=1.0
    private var stopTimeChanged: Bool=false
    
    private var stopTime: TimeInterval=1
    
    let timeLabel=SKLabelNode(text: "Time:0")
    let passengerLabel=SKLabelNode(text: "0")
    let moneyLabel=SKLabelNode(text: "0")
    
    private var gameTime: TimeInterval=0{
        didSet{
            if gameTime>1296000.0{
                //winGame()
            }
        }
    }
    private var money: Double=2150000.0{
        didSet{
            if money>6450000{
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
                //winGame()
            }
        }
    }
    
    override func didMove(to view: SKView) {
        sceneCamera = SKCameraNode()
        self.camera = sceneCamera
        self.addChild(sceneCamera)
        
        self.targetPosition = sceneCamera.position
        self.targetScale = sceneCamera.xScale
        
        startTime=Date().timeIntervalSinceReferenceDate
        
        timeLabel.position=CGPoint(x: 600, y: 260)
        timeLabel.zPosition=9
        timeLabel.fontSize=24
        timeLabel.fontColor = .blue
        timeLabel.fontName="Arial-BoldMT"
        addChild(timeLabel)
        
        passengerLabel.position=CGPoint(x: 0, y: 310)
        passengerLabel.zPosition=9
        passengerLabel.fontSize=24
        passengerLabel.fontColor = .blue
        passengerLabel.fontName="Arial-BoldMT"
        addChild(passengerLabel)
        
        moneyLabel.position=CGPoint(x: 300, y: 310)
        moneyLabel.zPosition=9
        moneyLabel.fontSize=24
        moneyLabel.fontColor = .blue
        moneyLabel.fontName="Arial-BoldMT"
        addChild(moneyLabel)
        
        setUpBackground()
        setUpButton()
        setUpScheduleButton()
        addChild(MainNode)
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

extension Beijing_M6_GameScene{
    func setUpBackground(){
        MainNode.addChild(Background(backgroundNum: 2))
    }
    func setUpButton(){
        for i in 1...4{
            MainNode.addChild(GameSceneButtons(buttonNum: i))
        }
        MainNode.addChild(GameSceneButtons(buttonNum: 25))
        MainNode.addChild(GameSceneButtons(buttonNum: 27))
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
        for i in 35...38{
            scheduleButtonBackground.addChild(GameSceneButtons(buttonNum: i))
        }
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
        
        let nodesC=nodes(at: ticketPriceIndicatorLoaction)
        for node in nodesC {
            if(node.name=="Initial_Ticket_Price")||(node.name=="10_Yuan_Ticket_Price")||(node.name=="15_Yuan_Ticket_Price"){
                node.removeFromParent()
            }
        }
        scheduleButtonBackground.addChild(GameSceneButtons(buttonNum: 29+ticketPricePage))
    }
    
    func updateStopTime(stopTimePage: Int){
        let stopTimeIndicatorLocation=CGPoint(x: 260, y: 140)
        
        let nodesD=nodes(at: stopTimeIndicatorLocation)
        for node in nodesD {
            if(node.name=="Initial_Stop_Time")||(node.name=="30_Seconds_Stop_Time")||(node.name=="45_Seconds_Stop_Time")||((node.name=="60_Seconds_Stop_Time")){
                node.removeFromParent()
            }
        }
        scheduleButtonBackground.addChild(GameSceneButtons(buttonNum: 38+stopTimePage))
    }
    
    func clearButtons(){
        let previousTimeButtonPosition=CGPoint(x: -322, y: 85)
        let nextTimeButtonPosition=CGPoint(x: -278, y: 85)
        let previousStationButtonPosition=CGPoint(x: -182, y: 85)
        let nextStationButtonPosition=CGPoint(x: -138, y: 85)
        let previousTicketPriceButtonPosition=CGPoint(x: 98, y: 85)
        let nextTicketPriceButtonPosition=CGPoint(x: 142, y: 85)
        let previousStopTimeButtonPosition=CGPoint(x: 238, y: 85)
        let nextStopTimeButtonPosition=CGPoint(x: 282, y: 85)
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
        let nodesH=nodes(at: previousStopTimeButtonPosition)
        for node in nodesH{
            if node.name=="Previous_Stop_Time_Button"{
                node.removeFromParent()
            }
        }
        let nodesI=nodes(at: nextStopTimeButtonPosition)
        for node in nodesI{
            if node.name=="Next_Stop_Time_Button"{
                node.removeFromParent()
            }
        }
    }
    override func update(_ currentTime: TimeInterval) {
        
        let currentTime=Date().timeIntervalSinceReferenceDate
        gameTime=(currentTime-startTime)*20
        let interval=gameTime
        //print(interval)
        let formattedTime = String(format: "Time: %.1f", gameTime)
        timeLabel.text = formattedTime
        
        if(interval>=timeDouble){
            if(gameTime>7200){
                //passengerFlow=passengerFlow*pow((1201/1200), gameTime/86400)
                passengerFlow=passengerFlow*pow((1201/1200),20)
                totalPassenger+=passengerFlow/4320
            }
            else{
                totalPassenger+=passengerFlow/4320
            }
            
            let moneyChange=(passengerFlow/4320)*5*Double(scheduleTicketPricePage)-(15*(1+Double(scheduleStopTimePage))*30+1800*6)/(300*120+(15/20)*(1+Double(scheduleStopTimePage)))-10185.0/18
            
            //print(passengerFlow)
            //print(moneyChange)
            
            money+=moneyChange
            
            timeDouble+=20.0
        }
        
        let formattedPassenger = String(format: "%.0f", totalPassenger)
        passengerLabel.text = formattedPassenger
        
        let formattedMoney = String(format: "%.1f", money)
        moneyLabel.text = formattedMoney
        
        let easing: CGFloat = 0.05
                
        // --- This is the smoothing logic for drag (position) ---
        sceneCamera.position.x += (targetPosition.x - sceneCamera.position.x) * easing
        sceneCamera.position.y += (targetPosition.y - sceneCamera.position.y) * easing
                
        // --- This is the smoothing logic for zoom (scale) ---
        sceneCamera.xScale += (targetScale - sceneCamera.xScale) * easing
        sceneCamera.yScale += (targetScale - sceneCamera.yScale) * easing
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.count == 2 {
            let touchArray = Array(touches)
            let touch1 = touchArray[0].location(in: self)
            let touch2 = touchArray[1].location(in: self)
            lastPinchDistance = distance(from: touch1, to: touch2)
                    
        } else if touches.count == 1 {
                    // If there is one touch, we're starting a drag gesture.
            lastTouchLocation = touches.first?.location(in: self)
        }
        
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
                    if (node.name=="Next_Stop_Time_Button")&&(scheduleStopTimePage<3){
                        scheduleStopTimePage+=1
                        updateStopTime(stopTimePage: scheduleStopTimePage)
                    }
                    if (node.name=="Previous_Stop_Time_Button")&&(scheduleStopTimePage>1){
                        scheduleStopTimePage-=1
                        updateStopTime(stopTimePage: scheduleStopTimePage)
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
            if node.name=="Exit_Game_Scene_Button"{
                let newScene=SKScene(fileNamed: "NewGameSceneA")
                self.view?.presentScene(newScene)
            }
        }
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.count == 1, let touch = touches.first, let lastTouch = lastTouchLocation {
            if sceneCamera.xScale < 1.0 {
                let locationInScene = touch.location(in: self)
                let dx = locationInScene.x - lastTouch.x
                let dy = locationInScene.y - lastTouch.y
                
                // --- We update the targetPosition, not the camera directly ---
                self.targetPosition.x -= dx
                self.targetPosition.y -= dy
                
                lastTouchLocation = locationInScene
            }
            // --- Handle Zooming (Pinch) ---
        } else if touches.count == 2 {
            let touchArray = Array(touches)
            let touch1 = touchArray[0].location(in: self)
            let touch2 = touchArray[1].location(in: self)
            let currentDistance = distance(from: touch1, to: touch2)
            
            guard let lastDistance = lastPinchDistance else { return }
            
            let scaleFactor = currentDistance / lastDistance
            self.targetScale /= scaleFactor
            lastPinchDistance = currentDistance
        }
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
            // Reset the touch variables when the user lifts their fingers
        lastTouchLocation = nil
        lastPinchDistance = nil
    }
        
        // A helper function to calculate the distance between two points
    func distance(from point1: CGPoint, to point2: CGPoint) -> CGFloat {
        let dx = point2.x - point1.x
        let dy = point2.y - point1.y
        return sqrt(dx*dx + dy*dy)
    }
}
