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
    
    private var scheduleButtonPages: [SKNode]=[SKNode(),SKNode(),SKNode(),SKNode(),SKNode()]
    private var schedulePage: Int=1
    private var serviceNum: [Int]=[1,1,1,1,1]
    private var schedules: [[Schedule]]=[[Schedule(startTime: 0.0, startStationName: "", endStationName: "")],[Schedule(startTime: 0.0, startStationName: "", endStationName: "")],[Schedule(startTime: 0.0, startStationName: "", endStationName: "")],[Schedule(startTime: 0.0, startStationName: "", endStationName: "")],[Schedule(startTime: 0.0, startStationName: "", endStationName: "")]]
    private var trainAdded: [Bool]=[false,false,false,false]
    
    private var scheduleTimePage: [[Int]]=[[0],[0],[0],[0],[0]]
    private var scheduleDepartureStationPage: [[Int]]=[[0],[0],[0],[0],[0]]
    private var scheduleTicketPricePage: Int=0
    private var scheduleStopTimePage: Int=0{
        didSet{
            stopTimeChanged=true
        }
    }
    
    private var runGame: Bool=false
    private var startTime: TimeInterval=0
    private var pauseStartTime: TimeInterval=0
    private var gamePauseTime: TimeInterval=0
    private var totalGamePauseTime: TimeInterval=0
    private var passengerFlow: Double=11300.0
    private var timeDouble: Double=20.0
    private var pauseTime: TimeInterval=1.0
    private var stopTimeChanged: Bool=false
    
    private var stopTime: TimeInterval=1
    private var stations: [Station]=[]
    private var trains: [Train]=[]
    
    let timeLabel=SKLabelNode(text: "Time:0")
    let passengerLabel=SKLabelNode(text: "0")
    let moneyLabel=SKLabelNode(text: "0")
    
    private var gameTime: TimeInterval=0{
        didSet{
            checkSchedule()
            if gameTime>1296000.0{
                //winGame()
            }
        }
    }
    private var money: Double=2150000.0{
        didSet{
            if money>6450000{
                //winGame()
            }
            if money<=0{
                //loseGame()
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
    
    let trainNode=SKSpriteNode(color: .brown, size: CGSize(width: 17, height: 1.7))
    
    override func didMove(to view: SKView) {
        self.speed=0.0
        
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
        setUpTrains()
        setUpButton()
        setUpScheduleButton()
        
        trainNode.position=CGPoint(x: 566, y: 1.1)
        trainNode.zPosition=9
        MainNode.addChild(trainNode)
        
        addChild(MainNode)
        
        //startMovement()
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
    
    func startMovement(){   // starts the train's movement in scene
        print("called")
        let ST=SKAction.wait(forDuration: 0.5)
        let ML011=SKAction.moveBy(x: -38, y: 0, duration: 9*38/57.94)
        let ML012=SKAction.moveBy(x: -7, y: 8, duration: 9*7/57.94)
        let ML013=SKAction.moveBy(x: -12.94, y: 0, duration: 9*12.94/57.94)
        let ML021=SKAction.moveBy(x: -12.94, y: 0, duration: 9*12.94/57.94)
        let ML022=SKAction.moveBy(x: -7, y: -8, duration: 9*7/57.94)
        let ML023=SKAction.moveBy(x: -38, y: 0, duration: 9*38/57.94)
        let ML03=SKAction.moveBy(x: -57.94, y: 0, duration: 9)
        let ML04=SKAction.moveBy(x: -57.94, y: 0, duration: 9)
        let ML05=SKAction.moveBy(x: -57.94, y: 0, duration: 9)
        let ML06=SKAction.moveBy(x: -57.94, y: 0, duration: 9)
        let ML07=SKAction.moveBy(x: -57.94, y: 0, duration: 9)
        let ML08=SKAction.moveBy(x: -57.94, y: 0, duration: 9)
        let ML09=SKAction.moveBy(x: -57.94, y: 0, duration: 9)
        let ML10=SKAction.moveBy(x: -57.94, y: 0, duration: 9)
        let ML11=SKAction.moveBy(x: -57.94, y: 0, duration: 9)
        let ML12=SKAction.moveBy(x: -57.94, y: 0, duration: 9)
        let ML13=SKAction.moveBy(x: -57.94, y: 0, duration: 9)
        let ML14=SKAction.moveBy(x: -57.94, y: 0, duration: 9)
        let ML15=SKAction.moveBy(x: -57.94, y: 0, duration: 9)
        let ML16=SKAction.moveBy(x: -57.94, y: 0, duration: 9)
        let ML17=SKAction.moveBy(x: -57.94, y: 0, duration: 9)
        let ML18=SKAction.moveBy(x: -57.94, y: 0, duration: 9)
        let ML19=SKAction.moveBy(x: -57.94, y: 0, duration: 9)
        let ML201=SKAction.moveBy(x: -38, y: 0, duration: 9*38/57.94)
        let ML202=SKAction.moveBy(x: -7, y: -8, duration: 9*7/57.94)
        let ML203=SKAction.moveBy(x: -12.94, y: 0, duration: 9*12.94/57.94)
        let MR01=SKAction.moveBy(x: 57.94, y: 0, duration: 9)
        let MR02=SKAction.moveBy(x: 57.94, y: 0, duration: 9)
        let MR03=SKAction.moveBy(x: 57.94, y: 0, duration: 9)
        let MR04=SKAction.moveBy(x: 57.94, y: 0, duration: 9)
        let MR05=SKAction.moveBy(x: 57.94, y: 0, duration: 9)
        let MR06=SKAction.moveBy(x: 57.94, y: 0, duration: 9)
        let MR07=SKAction.moveBy(x: 57.94, y: 0, duration: 9)
        let MR08=SKAction.moveBy(x: 57.94, y: 0, duration: 9)
        let MR09=SKAction.moveBy(x: 57.94, y: 0, duration: 9)
        let MR10=SKAction.moveBy(x: 57.94, y: 0, duration: 9)
        let MR11=SKAction.moveBy(x: 57.94, y: 0, duration: 9)
        let MR12=SKAction.moveBy(x: 57.94, y: 0, duration: 9)
        let MR13=SKAction.moveBy(x: 57.94, y: 0, duration: 9)
        let MR14=SKAction.moveBy(x: 57.94, y: 0, duration: 9)
        let MR15=SKAction.moveBy(x: 57.94, y: 0, duration: 9)
        let MR16=SKAction.moveBy(x: 57.94, y: 0, duration: 9)
        let MR17=SKAction.moveBy(x: 57.94, y: 0, duration: 9)
        let MR18=SKAction.moveBy(x: 57.94, y: 0, duration: 9)
        let MR191=SKAction.moveBy(x: 38, y: 0, duration: 9*38/57.94)
        let MR192=SKAction.moveBy(x: 7, y: -8, duration: 9*7/57.94)
        let MR193=SKAction.moveBy(x: 12.94, y: 0, duration: 9*12.94/57.94)
        let MR201=SKAction.moveBy(x: 12.94, y: 0, duration: 9*12.94/57.94)
        let MR202=SKAction.moveBy(x: 7, y: 8, duration: 9*7/57.94)
        let MR203=SKAction.moveBy(x: 38, y: 0, duration: 9*38/57.94)
        
        let TAR11=SKAction.moveBy(x: 12.94, y: 0, duration: 9*12.94/34.34)
        let TAR12=SKAction.moveBy(x: 5.6, y: 6.4, duration: 9*5.6/34.34)
        let TAR13=SKAction.moveBy(x: 15.8, y: 0, duration: 9*15.8/34.34)
        let TAR14=SKAction.moveBy(x: -20, y: 0, duration: 9*20/34.34)
        let TAR15=SKAction.moveBy(x: -1.4, y: 1.6, duration: 9*1.4/34.34)
        let TAR16=SKAction.moveBy(x: -12.94, y: 0, duration: 9*12.94/34.34)
        
        let loop=SKAction.sequence([ST,ML011,ML012,ML013,ST,ML021,ML022,ML023,ST,ML03,ST,ML04,ST,ML05,ST,ML06,ST,ML07,ST,ML08,ST,ML09,ST,ML10,ST,ML11,ST,ML12,ST,ML13,ST,ML14,ST,ML15,ST,ML16,ST,ML17,ST,ML18,ST,ML19,ST,ML201,ML202,ML203,ST,MR01,ST,MR02,ST,MR03,ST,MR04,ST,MR05,ST,MR06,ST,MR07,ST,MR08,ST,MR09,ST,MR10,ST,MR11,ST,MR12,ST,MR13,ST,MR14,ST,MR15,ST,MR16,ST,MR17,ST,MR18,ST,MR191,MR192,MR193,ST,MR201,MR202,MR203,ST,TAR11,TAR12,TAR13,ST,TAR14,TAR15,TAR16])
        //let loop=SKAction.sequence([ST])
        trainNode.run(loop)
    }
    
    func setUpBackground(){   // sets up the background
        MainNode.addChild(Background(backgroundNum: 2))
    }
    func setUpButton(){   // sets up the scene
        for i in 1...4{
            MainNode.addChild(GameSceneButtons(buttonNum: i))
        }
        MainNode.addChild(GameSceneButtons(buttonNum: 26))
        MainNode.addChild(GameSceneButtons(buttonNum: 27))
    }
    func setUpScheduleButton(){   // sets up the buttons in the schedule page
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
        for i in 1...5{
            for j in 1...8{
                scheduleButtonPages[i-1].addChild(GameSceneButtons(buttonNum: j, buttonRowCount: serviceNum[i-1],buttonPageNum: i))
            }
        }
        scheduleButtonBackground.addChild(scheduleButtonPages[0])
        for i in 53...57{
            scheduleButtonBackground.addChild(GameSceneButtons(buttonNum: i))
        }
    }
    func setUpTrains(){   // sets up the trains
        for i in 06001...06005{
            trains.append(Train(code: "\(i)"))
        }
        
        MainNode.addChild(trains[0])
        //trains[0].startMovementN(scheduleStopTimePage: scheduleStopTimePage)
    }
    func updateTime(timePage: Int,buttonRow: Int){   // updates the player's choice for train's departure and arrival time in schedule page
        let timeIndicatorLoaction=CGPoint(x: -300, y: 250-110*buttonRow)
        let nodes=nodes(at: timeIndicatorLoaction)
        for node in nodes {
            if (node.name=="Initial_Time\(buttonRow)-\(schedulePage)")||(node.name=="Time(1)\(buttonRow)-\(schedulePage)")||(node.name=="Time(2)\(buttonRow)-\(schedulePage)")||(node.name=="Time(3)\(buttonRow)-\(schedulePage)")||(node.name=="Time(4)\(buttonRow)-\(schedulePage)")||(node.name=="Time(5)\(buttonRow)-\(schedulePage)")||(node.name=="Time(6)\(buttonRow)-\(schedulePage)")||(node.name=="Time(7)\(buttonRow)-\(schedulePage)")||(node.name=="Time(8)\(buttonRow)-\(schedulePage)")||(node.name=="Time(9)\(buttonRow)-\(schedulePage)")||(node.name=="Time(10)\(buttonRow)-\(schedulePage)")||(node.name=="Time(11)\(buttonRow)-\(schedulePage)")||(node.name=="Time(12)\(buttonRow)-\(schedulePage)")||(node.name=="Time(13)\(buttonRow)-\(schedulePage)")||(node.name=="Time(14)\(buttonRow)-\(schedulePage)")||(node.name=="Time(15)\(buttonRow)-\(schedulePage)")||(node.name=="Time(16)\(buttonRow)-\(schedulePage)")||(node.name=="Time(17)\(buttonRow)-\(schedulePage)")||(node.name=="Time(18)\(buttonRow)-\(schedulePage)")||(node.name=="Time(19)\(buttonRow)-\(schedulePage)")||(node.name=="Time(20)\(buttonRow)-\(schedulePage)")||(node.name=="Time(21)\(buttonRow)-\(schedulePage)")||(node.name=="Time(22)\(buttonRow)-\(schedulePage)")||(node.name=="Time(23)\(buttonRow)-\(schedulePage)")||(node.name=="Time(24)\(buttonRow)-\(schedulePage)")||(node.name=="Time(25)\(buttonRow)-\(schedulePage)")||(node.name=="Time(26)\(buttonRow)-\(schedulePage)")||(node.name=="Time(27)\(buttonRow)-\(schedulePage)")||(node.name=="Time(28)\(buttonRow)-\(schedulePage)")||(node.name=="Time(29)\(buttonRow)-\(schedulePage)")||(node.name=="Time(30)\(buttonRow)-\(schedulePage)")||(node.name=="Time(31)\(buttonRow)-\(schedulePage)")||(node.name=="Time(32)\(buttonRow)-\(schedulePage)")||(node.name=="Time(33)\(buttonRow)-\(schedulePage)")||(node.name=="Time(34)\(buttonRow)-\(schedulePage)")||(node.name=="Time(35)\(buttonRow)-\(schedulePage)")||(node.name=="Time(36)\(buttonRow)-\(schedulePage)")||(node.name=="Time(37)\(buttonRow)-\(schedulePage)")||(node.name=="Time(38)\(buttonRow)-\(schedulePage)")||(node.name=="Time(39)\(buttonRow)-\(schedulePage)")||(node.name=="Time(40)\(buttonRow)-\(schedulePage)")||(node.name=="Time(41)\(buttonRow)-\(schedulePage)")||(node.name=="Time(42)\(buttonRow)-\(schedulePage)")||(node.name=="Time(43)\(buttonRow)-\(schedulePage)")||(node.name=="Time(44)\(buttonRow)-\(schedulePage)")||(node.name=="Time(45)\(buttonRow)-\(schedulePage)")||(node.name=="Time(46)\(buttonRow)-\(schedulePage)")||(node.name=="Time(47)\(buttonRow)-\(schedulePage)")||(node.name=="Time(48)\(buttonRow)-\(schedulePage)")||(node.name=="Time(49)\(buttonRow)-\(schedulePage)"){
                node.removeFromParent()
            }
        }
        scheduleButtonPages[schedulePage-1].addChild(GameSceneButtons(buttonNum: 12+timePage, buttonRowCount: buttonRow, buttonPageNum: schedulePage))
    }
    func updateDepartureStation(departureStationPage: Int,buttonRow: Int){   // updates the player's choice of departure station
        let departureStationIndicatorLoaction=CGPoint(x: -160, y: 250-110*buttonRow)
        let terminusStationIndicatorLoaction=CGPoint(x: -20, y: 250-110*buttonRow)
        
        let nodesA=nodes(at: departureStationIndicatorLoaction)
        for node in nodesA {
            if (node.name=="Initial_Departure_Station\(buttonRow)-\(schedulePage)")||(node.name=="Moshikou_Station\(buttonRow)-\(schedulePage)")||(node.name=="Shougang_Park_Station\(buttonRow)-\(schedulePage)"){
                node.removeFromParent()
            }
        }
        scheduleButtonPages[schedulePage-1].addChild(GameSceneButtons(buttonNum: 8+departureStationPage,buttonRowCount: buttonRow, buttonPageNum: schedulePage))
        
        let nodesB=nodes(at: terminusStationIndicatorLoaction)
        for node in nodesB {
            if (node.name=="Initial_Terminus_Station\(buttonRow)-\(schedulePage)")||(node.name=="Moshikou_Station\(buttonRow)-\(schedulePage)")||(node.name=="Shougang_Park_Station\(buttonRow)-\(schedulePage)"){
                node.removeFromParent()
            }
        }
        scheduleButtonPages[schedulePage-1].addChild(GameSceneButtons(buttonNum: 10+departureStationPage,buttonRowCount: buttonRow, buttonPageNum: schedulePage))
    }

    func updateTicketPrice(ticketPricePage: Int){   // updates the player's choice of ticket price
        let ticketPriceIndicatorLoaction=CGPoint(x: 120, y: 140)
        
        let nodesC=nodes(at: ticketPriceIndicatorLoaction)
        for node in nodesC {
            if(node.name=="Initial_Ticket_Price")||(node.name=="10_Yuan_Ticket_Price")||(node.name=="15_Yuan_Ticket_Price"){
                node.removeFromParent()
            }
        }
        scheduleButtonBackground.addChild(GameSceneButtons(buttonNum: 29+ticketPricePage))
    }
    
    func updateStopTime(stopTimePage: Int){   // updates the player's choice of stop time of the train
        let stopTimeIndicatorLocation=CGPoint(x: 260, y: 140)
        
        let nodesD=nodes(at: stopTimeIndicatorLocation)
        for node in nodesD {
            if(node.name=="Initial_Stop_Time")||(node.name=="30_Seconds_Stop_Time")||(node.name=="45_Seconds_Stop_Time")||((node.name=="60_Seconds_Stop_Time")){
                node.removeFromParent()
            }
        }
        scheduleButtonBackground.addChild(GameSceneButtons(buttonNum: 38+stopTimePage))
    }
    
    func updateTrainSelection(trainSelectionPage: Int){   // updates the player's current choosen train in schedule page
        let oldTrainIndicatorLocation=CGPoint(x: 400, y: 230-50*schedulePage)
        let newTrainIndicatorLocation=CGPoint(x: 400, y: 230-50*trainSelectionPage)
        
        let nodesA=nodes(at: oldTrainIndicatorLocation)
        for node in nodesA {
            if (node.name=="M6_Train_\(schedulePage)(H)"){
                node.removeFromParent()
                scheduleButtonPages[schedulePage-1].removeFromParent()
            }
        }
        let nodesB=nodes(at: newTrainIndicatorLocation)
        for node in nodesB {
            if (node.name=="M6_Train_\(trainSelectionPage)"){
                node.removeFromParent()
            }
        }
        scheduleButtonBackground.addChild(GameSceneButtons(buttonNum: 51+schedulePage))
        schedulePage=trainSelectionPage
        scheduleButtonBackground.addChild(scheduleButtonPages[trainSelectionPage-1])
        scheduleButtonBackground.addChild(GameSceneButtons(buttonNum: 56+trainSelectionPage))
    }
    func updateAddButton(trainNumber: Int){   // updates the position of the add buttons
        let addIndicatorLocation=CGPoint(x: -380, y: 140-110*serviceNum[schedulePage-1])
        
        let nodes=nodes(at: addIndicatorLocation)
        for node in nodes {
            if (node.name=="Add_Button-\(schedulePage)") {
                node.removeFromParent()
            }
        }
    }
    func clearButtons(){   // removes all buttons
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
    override func update(_ currentTime: TimeInterval) {   // updates values related with time
        let currentTime=Date().timeIntervalSinceReferenceDate
        if runGame==true{
            gameTime=21000.0+(currentTime-startTime-totalGamePauseTime)*20
            let interval=gameTime
            let formattedTime = String(format: "Time: %.1f", gameTime)
            timeLabel.text = formattedTime
            
            if(interval>=timeDouble){
                if(gameTime>7200){
                    //passengerFlow=passengerFlow*pow((1201/1200), gameTime/86400)
                    passengerFlow=passengerFlow*pow((24948101/24948100),timeDouble)
                    totalPassenger+=passengerFlow
                }
                else{
                    totalPassenger+=passengerFlow
                }
                
                let moneyChange=20.0*((passengerFlow)*5*(2+Double(scheduleTicketPricePage))-(1000.0/3600.0*15.0*(1+Double(scheduleStopTimePage))+1900.0/3600.0*180.0)/(15.0*(1+Double(scheduleStopTimePage))+180.0)-3800.0/3600.0-1500.0*Double(trains.count)/3600.0)
                
                //print(passengerFlow)
                //print(moneyChange)
                
                money+=moneyChange
                
                timeDouble+=20.0
            }
            
            let formattedPassenger = String(format: "%.0f", totalPassenger)
            passengerLabel.text = formattedPassenger
            
            let formattedMoney = String(format: "%.1f", money)
            moneyLabel.text = formattedMoney
        }
        else{
            gamePauseTime=currentTime-pauseStartTime
        }
        
        let easing: CGFloat = 0.05
                
        sceneCamera.position.x += (targetPosition.x - sceneCamera.position.x) * easing
        sceneCamera.position.y += (targetPosition.y - sceneCamera.position.y) * easing
                
        sceneCamera.xScale += (targetScale - sceneCamera.xScale) * easing
        sceneCamera.yScale += (targetScale - sceneCamera.yScale) * easing
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {   // touch and button interactions
        if touches.count == 2 {
            let touchArray = Array(touches)
            let touch1 = touchArray[0].location(in: self)
            let touch2 = touchArray[1].location(in: self)
            lastPinchDistance = distance(from: touch1, to: touch2)
                    
        } else if touches.count == 1 {
            lastTouchLocation = touches.first?.location(in: self)
        }
        
        let location=touches.first?.location(in: self)
        if(hasScheduleButton==false){
            if(!scheduleButtonBackground.contains(location!)){
                MainNode.addChild(GameSceneButtons(buttonNum: 1))
                hasScheduleButton=true
                scheduleButtonBackground.removeFromParent()
            }
            else{
                let nodesA=nodes(at: location!)
                for node in nodesA {
                    for j in 1...5{
                        for i in 1...serviceNum[schedulePage-1]{
                            if (node.name=="Next_Time_Button\(i)-\(j)")&&(scheduleTimePage[j-1][i-1]<49){
                                scheduleTimePage[j-1][i-1]+=1
                                updateTime(timePage: scheduleTimePage[j-1][i-1],buttonRow: i)
                            }
                        }
                        for i in 1...serviceNum[schedulePage-1]{
                            if (node.name=="Previous_Time_Button\(i)-\(j)")&&(scheduleTimePage[j-1][i-1]>1){
                                scheduleTimePage[j-1][i-1]-=1
                                updateTime(timePage: scheduleTimePage[j-1][i-1],buttonRow: i)
                            }
                        }
                        for i in 1...serviceNum[schedulePage-1]{
                            if (node.name=="Next_Departure_Station_Button\(i)-\(j)")&&(scheduleDepartureStationPage[j-1][i-1]<2){
                                scheduleDepartureStationPage[j-1][i-1]+=1
                                updateDepartureStation(departureStationPage: scheduleDepartureStationPage[j-1][i-1],buttonRow: i)
                            }
                        }
                        for i in 1...serviceNum[schedulePage-1]{
                            if (node.name=="Previous_Departure_Station_Button\(i)-\(j)")&&(scheduleDepartureStationPage[j-1][i-1]>1){
                                scheduleDepartureStationPage[j-1][i-1]-=1
                                updateDepartureStation(departureStationPage: scheduleDepartureStationPage[j-1][i-1],buttonRow: i)
                            }
                        }
                        if node.name=="Add_Button-\(j)"{
                            updateAddButton(trainNumber: serviceNum[schedulePage-1])
                            if(serviceNum[schedulePage-1]<4){
                                serviceNum[schedulePage-1]+=1
                                scheduleButtonPages[j-1].addChild(GameSceneButtons(buttonNum: 1, buttonRowCount: serviceNum[schedulePage-1], buttonPageNum: j))
                                scheduleButtonPages[j-1].addChild(GameSceneButtons(buttonNum: 2, buttonRowCount: serviceNum[schedulePage-1], buttonPageNum: j))
                                scheduleButtonPages[j-1].addChild(GameSceneButtons(buttonNum: 3, buttonRowCount: serviceNum[schedulePage-1], buttonPageNum: j))
                                scheduleButtonPages[j-1].addChild(GameSceneButtons(buttonNum: 4, buttonRowCount: serviceNum[schedulePage-1], buttonPageNum: j))
                                scheduleButtonPages[j-1].addChild(GameSceneButtons(buttonNum: 5, buttonRowCount: serviceNum[schedulePage-1], buttonPageNum: j))
                                scheduleButtonPages[j-1].addChild(GameSceneButtons(buttonNum: 6, buttonRowCount: serviceNum[schedulePage-1], buttonPageNum: j))
                                scheduleButtonPages[j-1].addChild(GameSceneButtons(buttonNum: 7, buttonRowCount: serviceNum[schedulePage-1], buttonPageNum: j))
                                scheduleButtonPages[j-1].addChild(GameSceneButtons(buttonNum: 8, buttonRowCount: serviceNum[schedulePage-1], buttonPageNum: j))
                                scheduleTimePage[j-1].append(0)
                                scheduleDepartureStationPage[j-1].append(0)
                            }
                        }
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
                    if (node.name=="M6_Train_1"){
                        updateTrainSelection(trainSelectionPage: 1)
                    }
                    if (node.name=="M6_Train_2"){
                        updateTrainSelection(trainSelectionPage: 2)
                        
                        if(!trainAdded[0]){
                            MainNode.addChild(trains[1])
                            trainAdded[0]=true
                        }
                    }
                    if (node.name=="M6_Train_3"){
                        updateTrainSelection(trainSelectionPage: 3)
                        
                        if(!trainAdded[1]){
                            MainNode.addChild(trains[2])
                            trainAdded[1]=true
                        }

                    }
                    if (node.name=="M6_Train_4"){
                        updateTrainSelection(trainSelectionPage: 4)
                        
                        if(!trainAdded[2]){
                            MainNode.addChild(trains[3])
                            trainAdded[2]=true
                        }

                    }
                    if (node.name=="M6_Train_5"){
                        updateTrainSelection(trainSelectionPage: 5)
                        
                        if(!trainAdded[3]){
                            MainNode.addChild(trains[4])
                            trainAdded[3]=true
                        }

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
                pauseStartTime=Date().timeIntervalSinceReferenceDate
                runGame=false
                self.speed=0.0
                node.removeFromParent()
            }
            if node.name=="Play_Button"{
                MainNode.addChild(GameSceneButtons(buttonNum: 25))
                totalGamePauseTime+=gamePauseTime
                gamePauseTime=0
                runGame=true
                
                updateSchedule()
                
                self.speed=1.0
                node.removeFromParent()
            }
            if node.name=="Exit_Game_Scene_Button"{
                let newScene=SKScene(fileNamed: "NewGameSceneA")
                self.view?.presentScene(newScene)
            }
        }
    }
    func updateSchedule(){   // updates the changes in the button selections into the schedule
        for i in 0...4{
            if scheduleTimePage[i].count>schedules[i].count{
                for j in schedules[i].count...scheduleTimePage[i].count-1{
                    if scheduleDepartureStationPage[i][j]==1{
                        schedules[i].append(Schedule(startTime: Double(20700+scheduleTimePage[i][j]*900), startStationName: "Moshikou", endStationName: "Shougang_Park"))
                    }
                    else{
                        schedules[i].append(Schedule(startTime: Double(20700+scheduleTimePage[i][j]*900), startStationName: "Shougang_Park", endStationName: "Moshikou"))
                    }
                }
            }
            for j in 0...scheduleTimePage[i].count-1{
                schedules[i][j].startTime=Double(20700+scheduleTimePage[i][j]*900)
                if scheduleDepartureStationPage[i][j]==1{
                    schedules[i][j].startStationName="Moshikou"
                    schedules[i][j].endStationName="Shougang_Park"
                }
                else{
                    schedules[i][j].startStationName="Shougang_Park"
                    schedules[i][j].endStationName="Moshikou"
                }
            }
        }
    }
    func checkSchedule(){   // check if the time reached the departure time in the schedule
        for i in 0...trains.count-1{
            for j in 0...schedules[i].count-1{
                if((gameTime>=schedules[i][j].startTime)&&(schedules[i][j].startTime != 0.0)){
                    trains[i].enterService()
                    if(trains[i].locationName==schedules[i][j].startStationName){
                        schedules[i][j].startTime+=86400.0
//                        if(trains[i].parent==nil){
//                            trains[i]
//                        }
                        if(trains[i].locationName=="Shougang_Park"){
                            trains[i].startStation="Shougang_Park"
                            trains[i].endStation="Moshikou"
                            trains[i].startMovementW_M6(scheduleStopTimePage: scheduleStopTimePage)
                        }
                        else if(trains[i].locationName=="Moshikou"){
                            trains[i].startStation="Moshikou"
                            trains[i].endStation="Shougang_Park"
                            trains[i].startMovementE_M6(scheduleStopTimePage: scheduleStopTimePage)
                        }
                    }
                    else{
                        print("Train Location Error")
                    }
                }
            }
        }
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {   // touch movement interactions
        if touches.count == 1, let touch = touches.first, let lastTouch = lastTouchLocation {
            if sceneCamera.xScale < 1.0 {
                let locationInScene = touch.location(in: self)
                let dx = locationInScene.x - lastTouch.x
                let dy = locationInScene.y - lastTouch.y
                
                self.targetPosition.x -= dx
                self.targetPosition.y -= dy
                
                lastTouchLocation = locationInScene
            }
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
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {   // resets some variables when touch ends
        lastTouchLocation = nil
        lastPinchDistance = nil
    }
        
    func distance(from point1: CGPoint, to point2: CGPoint) -> CGFloat {   // calculates distance
        let dx = point2.x - point1.x
        let dy = point2.y - point1.y
        return sqrt(dx*dx + dy*dy)
    }
}
