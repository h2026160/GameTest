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
    
    private var scheduleButtonPages: [SKNode]=[SKNode(),SKNode(),SKNode(),SKNode(),SKNode()]
    private var schedulePage: Int=1
    
    private var serviceNum: [Int]=[1,1,1,1,1]
    
    private var schedules: [[Schedule]]=[[Schedule(startTime: 0.0, startStationName: "", endStationName: "")],[Schedule(startTime: 0.0, startStationName: "", endStationName: "")],[Schedule(startTime: 0.0, startStationName: "", endStationName: "")],[Schedule(startTime: 0.0, startStationName: "", endStationName: "")],[Schedule(startTime: 0.0, startStationName: "", endStationName: "")]]
    private var trainAdded: [Bool]=[false,false,false,false]
    
//    private var scheduleTimePage: Int=0
//    private var scheduleDepartureStationPage: Int=0
    
    private var scheduleTimePage: [[Int]]=[[0],[0],[0],[0],[0]]
    private var scheduleDepartureStationPage: [[Int]]=[[0],[0],[0],[0],[0]]
    
    private var scheduleTicketPricePage: Int=0
    private var scheduleStopTimePage: Int=0{
        didSet{
            stopTimeChanged=true
        }
    }
    //private var scheduleSetupRowNumber: Int=1
    private var runGame: Bool=false
    private var startTime: TimeInterval=0
    private var pauseStartTime: TimeInterval=0
    private var gamePauseTime: TimeInterval=0
    private var totalGamePauseTime: TimeInterval=0
    
    private var passengerFlow: Double=5000.0/43200.0
    private var timeDouble: Double=20.0
    private var pauseTime: TimeInterval=1.0
    private var stopTimeChanged: Bool=false
    
    private var stopTime: TimeInterval=1
    
    //private var passengers: [Passenger]=[]
    
    private var stations: [Station]=[]
    
    private var trains: [Train]=[]
    
    
    
    let timeLabel=SKLabelNode(text: "Time:0")
    let passengerLabel=SKLabelNode(text: "0")
    let moneyLabel=SKLabelNode(text: "0")
    
    //let trainNode=SKSpriteNode(color: .black, size: CGSize(width: 100, height: 10))
   //
    
    private var gameTime: TimeInterval=0{
        didSet{
            checkSchedule()
            
            checkTrainLocation()
            
            if gameTime>1296000.0{
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
    
    private var lastWholePassengerCount: Int = 0
    
    private var totalPassenger: Double=0.0{
        didSet{
            if totalPassenger>450000{
                winGame()
            }
            let currentWholeNumber = Int(totalPassenger)
            if currentWholeNumber > lastWholePassengerCount {
                for _ in lastWholePassengerCount..<currentWholeNumber {
                    let newPassenger=Passenger(code: "\(currentWholeNumber)")
                    
                    assignStation(newPassenger: newPassenger)
                    //print("\(newPassenger.startStationNumber),\(newPassenger.endStationNumber)")
                    //passengers.append(newPassenger)
                    
                    money+=(Double(newPassenger.getTicketPrice())+5.0)*(2.0+Double(scheduleTicketPricePage))
                    //print(passengersStartStation)
                    
                }
            lastWholePassengerCount = currentWholeNumber
            }
        }
    }


    
    override func didMove(to view: SKView) {
        
        self.speed=0.0
        
        pauseStartTime=Date.timeIntervalSinceReferenceDate
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
        
//        trainNode.position=CGPoint(x: 410, y: 27)
//        addChild(trainNode)
        
        setUpTrains()
        
        setUpButton()
        setUpScheduleButton()
        
        stations.append(Station(stationName: "Moshikou", stationNumber: 1))
        stations.append(Station(stationName: "Jin'anqiao", stationNumber: 2))
        stations.append(Station(stationName: "Beixin'an", stationNumber: 3))
        stations.append(Station(stationName: "Shougang_Park", stationNumber: 4))
        
        //startMovement()
    }
    
    
//    func startMovement(){
//        
//        
//        if stopTimeChanged{
//            //print("yes")
//            //stopTime=100
//            stopTimeChanged=false
//        }
//        
//        //trainNode.removeAllActions()
//        
//        let ST=SKAction.wait(forDuration: 0.5+0.5*Double(scheduleStopTimePage))
//        //let ST=SKAction.wait(forDuration: 1+1*Double(scheduleStopTimePage))
//        //let ST=SKAction.wait(forDuration: stopTime)
//        let ML1=SKAction.moveBy(x: -275, y: 0, duration: 9)
//        let ML2=SKAction.moveBy(x: -275, y: 0, duration: 9)
//        let ML31=SKAction.moveBy(x: -100, y: 0, duration: 9*100/285)
//        let ML32=SKAction.moveBy(x: -120, y: -15, duration: 9*120/285)
//        let ML33=SKAction.moveBy(x: -5, y: -25, duration: 9*5/285)
//        let ML34=SKAction.moveBy(x: -60, y: 0, duration: 9*60/285)
//        let MR11=SKAction.moveBy(x: 65, y: 0, duration: 9*65/285)
//        let MR12=SKAction.moveBy(x: 120, y: -15, duration: 9*120/285)
//        let MR13=SKAction.moveBy(x: 100, y: 0, duration: 9*100/285)
//        let MR2=SKAction.moveBy(x: 275, y: 0, duration: 9)
//        let MR31=SKAction.moveBy(x: 175, y: 0, duration: 9*175/275)
//        let MR32=SKAction.moveBy(x: 20, y: 55, duration: 9*20/275)
//        let MR33=SKAction.moveBy(x: 80, y: 0, duration: 9*80/275)
//        
//        let loop=SKAction.sequence([ML1,ST,ML2,ST,ML31,ML32,ML33,ML34,ST,MR11,MR12,MR13,ST,MR2,ST,MR31,MR32,MR33,ST])
//        trainNode.run(loop){
//            self.startMovement()
//        }
//    }
    
    func winGame(){   // runs after game is won
        let newScene=SKScene(fileNamed: "MenuScene")
        self.view?.presentScene(newScene)
    }
    
    func loseGame(){   // runs after game is lost
        let newScene=SKScene(fileNamed: "MenuScene")
        self.view?.presentScene(newScene)
    }
}
extension Beijing_M11_GameScene{
    func setUpButton(){   // sets up the scene
        for i in 1...4{
            MainNode.addChild(GameSceneButtons(buttonNum: i))
        }
        MainNode.addChild(GameSceneButtons(buttonNum: 26))
        MainNode.addChild(GameSceneButtons(buttonNum: 27))
        addChild(MainNode)
    }
    
    func setUpScheduleButton(){   // sets up the buttons in the schedule page
//        for i in 6...8{
//            scheduleButtonBackground.addChild(GameSceneButtons(buttonNum: i))
//        }
//        for i in 12...16{
//            scheduleButtonBackground.addChild(GameSceneButtons(buttonNum: i))
//        }
        for i in 12...13{
            scheduleButtonBackground.addChild(GameSceneButtons(buttonNum: i))
        }
        scheduleButtonBackground.addChild(GameSceneButtons(buttonNum: 19))
//        for i in 19...20{
//            scheduleButtonBackground.addChild(GameSceneButtons(buttonNum: i))
//        }
        for i in 23...24{
            scheduleButtonBackground.addChild(GameSceneButtons(buttonNum: i))
        }
        for i in 28...29{
            scheduleButtonBackground.addChild(GameSceneButtons(buttonNum: i))
        }
        //scheduleButtonBackground.addChild(GameSceneButtons(buttonNum: 32))
        //scheduleButtonBackground.addChild(GameSceneButtons(buttonNum: 34))

        //scheduleButtonBackground.addChild(GameSceneButtons(buttonNum: 23))
        for i in 35...38{
            scheduleButtonBackground.addChild(GameSceneButtons(buttonNum: i))
        }
        
        for i in 1...5{
            for j in 1...8{
                scheduleButtonPages[i-1].addChild(GameSceneButtons(buttonNum: j, buttonRowCount: serviceNum[i-1],buttonPageNum: i))
            }
        }
        
//        scheduleButtonBackground.addChild(GameSceneButtons(buttonNum: 1, buttonRowCount: trainNum))
//        scheduleButtonBackground.addChild(GameSceneButtons(buttonNum: 2, buttonRowCount: trainNum))
//        scheduleButtonBackground.addChild(GameSceneButtons(buttonNum: 3, buttonRowCount: trainNum))
//        scheduleButtonBackground.addChild(GameSceneButtons(buttonNum: 4, buttonRowCount: trainNum))
//        scheduleButtonBackground.addChild(GameSceneButtons(buttonNum: 5, buttonRowCount: trainNum))
//        scheduleButtonBackground.addChild(GameSceneButtons(buttonNum: 6, buttonRowCount: trainNum))
//        scheduleButtonBackground.addChild(GameSceneButtons(buttonNum: 7, buttonRowCount: trainNum))
//        scheduleButtonBackground.addChild(GameSceneButtons(buttonNum: 8, buttonRowCount: trainNum))
        
        scheduleButtonBackground.addChild(scheduleButtonPages[0])
        
        for i in 43...47{
            scheduleButtonBackground.addChild(GameSceneButtons(buttonNum: i))
        }

    }
    
    func setUpTrains(){   // sets up the trains
        for i in 11001...11005{
            trains.append(Train(code: "\(i)"))
        }
        
        MainNode.addChild(trains[0])
        //trains[0].startMovementN(scheduleStopTimePage: scheduleStopTimePage)
    }
    
    func updateTrainSelection(trainSelectionPage: Int){   // updates the player's current choosen train in schedule page
        let oldTrainIndicatorLocation=CGPoint(x: 400, y: 230-50*schedulePage)
        let newTrainIndicatorLocation=CGPoint(x: 400, y: 230-50*trainSelectionPage)
        
        let nodesA=nodes(at: oldTrainIndicatorLocation)
        for node in nodesA {
            if (node.name=="M11_Train_\(schedulePage)(H)"){
                node.removeFromParent()
                scheduleButtonPages[schedulePage-1].removeFromParent()
            }
        }
        let nodesB=nodes(at: newTrainIndicatorLocation)
        for node in nodesB {
            if (node.name=="M11_Train_\(trainSelectionPage)"){
                node.removeFromParent()
            }
        }
        scheduleButtonBackground.addChild(GameSceneButtons(buttonNum: 41+schedulePage))
        schedulePage=trainSelectionPage
        scheduleButtonBackground.addChild(scheduleButtonPages[trainSelectionPage-1])
        scheduleButtonBackground.addChild(GameSceneButtons(buttonNum: 46+trainSelectionPage))
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
    
    func updateTime(timePage: Int,buttonRow: Int){   // updates the player's choice for train's departure and arrival time in schedule page
        
        //trains[buttonRow-1].changeDepartureTime(timePoint: 6*timePage)
        
        let timeIndicatorLoaction=CGPoint(x: -300, y: 250-110*buttonRow)
        
        let nodes=nodes(at: timeIndicatorLoaction)
        for node in nodes {
            if (node.name=="Initial_Time\(buttonRow)-\(schedulePage)")||(node.name=="Time(1)\(buttonRow)-\(schedulePage)")||(node.name=="Time(2)\(buttonRow)-\(schedulePage)")||(node.name=="Time(3)\(buttonRow)-\(schedulePage)")||(node.name=="Time(4)\(buttonRow)-\(schedulePage)")||(node.name=="Time(5)\(buttonRow)-\(schedulePage)")||(node.name=="Time(6)\(buttonRow)-\(schedulePage)")||(node.name=="Time(7)\(buttonRow)-\(schedulePage)")||(node.name=="Time(8)\(buttonRow)-\(schedulePage)")||(node.name=="Time(9)\(buttonRow)-\(schedulePage)")||(node.name=="Time(10)\(buttonRow)-\(schedulePage)")||(node.name=="Time(11)\(buttonRow)-\(schedulePage)")||(node.name=="Time(12)\(buttonRow)-\(schedulePage)")||(node.name=="Time(13)\(buttonRow)-\(schedulePage)")||(node.name=="Time(14)\(buttonRow)-\(schedulePage)")||(node.name=="Time(15)\(buttonRow)-\(schedulePage)")||(node.name=="Time(16)\(buttonRow)-\(schedulePage)")||(node.name=="Time(17)\(buttonRow)-\(schedulePage)")||(node.name=="Time(18)\(buttonRow)-\(schedulePage)")||(node.name=="Time(19)\(buttonRow)-\(schedulePage)")||(node.name=="Time(20)\(buttonRow)-\(schedulePage)")||(node.name=="Time(21)\(buttonRow)-\(schedulePage)")||(node.name=="Time(22)\(buttonRow)-\(schedulePage)")||(node.name=="Time(23)\(buttonRow)-\(schedulePage)")||(node.name=="Time(24)\(buttonRow)-\(schedulePage)")||(node.name=="Time(25)\(buttonRow)-\(schedulePage)")||(node.name=="Time(26)\(buttonRow)-\(schedulePage)")||(node.name=="Time(27)\(buttonRow)-\(schedulePage)")||(node.name=="Time(28)\(buttonRow)-\(schedulePage)")||(node.name=="Time(29)\(buttonRow)-\(schedulePage)")||(node.name=="Time(30)\(buttonRow)-\(schedulePage)")||(node.name=="Time(31)\(buttonRow)-\(schedulePage)")||(node.name=="Time(32)\(buttonRow)-\(schedulePage)")||(node.name=="Time(33)\(buttonRow)-\(schedulePage)")||(node.name=="Time(34)\(buttonRow)-\(schedulePage)")||(node.name=="Time(35)\(buttonRow)-\(schedulePage)")||(node.name=="Time(36)\(buttonRow)-\(schedulePage)")||(node.name=="Time(37)\(buttonRow)-\(schedulePage)")||(node.name=="Time(38)\(buttonRow)-\(schedulePage)")||(node.name=="Time(39)\(buttonRow)-\(schedulePage)")||(node.name=="Time(40)\(buttonRow)-\(schedulePage)")||(node.name=="Time(41)\(buttonRow)-\(schedulePage)")||(node.name=="Time(42)\(buttonRow)-\(schedulePage)")||(node.name=="Time(43)\(buttonRow)-\(schedulePage)")||(node.name=="Time(44)\(buttonRow)-\(schedulePage)")||(node.name=="Time(45)\(buttonRow)-\(schedulePage)")||(node.name=="Time(46)\(buttonRow)-\(schedulePage)")||(node.name=="Time(47)\(buttonRow)-\(schedulePage)")||(node.name=="Time(48)\(buttonRow)-\(schedulePage)")||(node.name=="Time(49)\(buttonRow)-\(schedulePage)"){
                node.removeFromParent()
            }
        }
        //scheduleButtonBackground.addChild(GameSceneButtons(buttonNum: 8+timePage))
        scheduleButtonPages[schedulePage-1].addChild(GameSceneButtons(buttonNum: 12+timePage, buttonRowCount: buttonRow, buttonPageNum: schedulePage))
    }
    
    func updateDepartureStation(departureStationPage: Int,buttonRow: Int){   // updates the player's choice of departure station
        
//        if departureStationPage==1{
//            trains[buttonRow-1].changeStartStation(stationName: "Moshikou")
//            trains[buttonRow-1].changeTerminusStation(stationName: "Shougang_Park")
//        }
//        else if departureStationPage==2{
//            trains[buttonRow-1].changeStartStation(stationName: "Shougang_Park")
//            trains[buttonRow-1].changeTerminusStation(stationName: "Moshikou")
//        }
        
        
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
    
    func clearButtons(){   // removes buttons from scene
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {   // button interactions
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
                
                for node in nodesA{
                    for j in 1...5 {
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
                    if (node.name=="M11_Train_1"){
                        updateTrainSelection(trainSelectionPage: 1)
                    }
                    if (node.name=="M11_Train_2"){
                        updateTrainSelection(trainSelectionPage: 2)
                        
                        if(!trainAdded[0]){
                            MainNode.addChild(trains[1])
                            //trains[1].startMovementN(scheduleStopTimePage: scheduleStopTimePage)
                            trainAdded[0]=true
                        }
                    }
                    if (node.name=="M11_Train_3"){
                        updateTrainSelection(trainSelectionPage: 3)
                        
                        if(!trainAdded[1]){
                            MainNode.addChild(trains[2])
                            //trains[2].startMovementN(scheduleStopTimePage: scheduleStopTimePage)
                            trainAdded[1]=true
                        }

                    }
                    if (node.name=="M11_Train_4"){
                        updateTrainSelection(trainSelectionPage: 4)
                        
                        if(!trainAdded[2]){
                            MainNode.addChild(trains[3])
                            //trains[3].startMovementN(scheduleStopTimePage: scheduleStopTimePage)
                            trainAdded[2]=true
                        }

                    }
                    if (node.name=="M11_Train_5"){
                        updateTrainSelection(trainSelectionPage: 5)
                        
                        if(!trainAdded[3]){
                            MainNode.addChild(trains[4])
                            //trains[4].startMovementN(scheduleStopTimePage: scheduleStopTimePage)
                            trainAdded[3]=true
                        }

                    }
                }
                
                //for node in nodesA {
//                    for i in 1...trainNum{
//                        if (node.name=="Next_Time_Button\(i)")&&(scheduleTimePage[i-1]<3){
//                            scheduleTimePage[i-1]+=1
//                            updateTime(timePage: scheduleTimePage[i-1],buttonRow: i)
//                        }
//                    }
//                    for i in 1...trainNum{
//                        if (node.name=="Previous_Time_Button\(i)")&&(scheduleTimePage[i-1]>1){
//                            scheduleTimePage[i-1]-=1
//                            updateTime(timePage: scheduleTimePage[i-1],buttonRow: i)
//                        }
//                    }
//                    for i in 1...trainNum{
//                        if (node.name=="Next_Departure_Station_Button\(i)")&&(scheduleDepartureStationPage[i-1]<2){
//                            scheduleDepartureStationPage[i-1]+=1
//                            updateDepartureSatation(departureStationPage: scheduleDepartureStationPage[i-1],buttonRow: i)
//                        }
//                    }
//                    for i in 1...trainNum{
//                        if (node.name=="Previous_Departure_Station_Button\(i)")&&(scheduleDepartureStationPage[i-1]>1){
//                            scheduleDepartureStationPage[i-1]-=1
//                            updateDepartureSatation(departureStationPage: scheduleDepartureStationPage[i-1],buttonRow: i)
//                        }
//                    }
//                    if (node.name=="Next_Ticket_Price_Button")&&(scheduleTicketPricePage<2){
//                        scheduleTicketPricePage+=1
//                        updateTicketPrice(ticketPricePage: scheduleTicketPricePage)
//                    }
//                    if (node.name=="Previous_Ticket_Price_Button")&&(scheduleTicketPricePage>1){
//                        scheduleTicketPricePage-=1
//                        updateTicketPrice(ticketPricePage: scheduleTicketPricePage)
//                    }
//                    if (node.name=="Next_Stop_Time_Button")&&(scheduleStopTimePage<3){
//                        scheduleStopTimePage+=1
//                        updateStopTime(stopTimePage: scheduleStopTimePage)
//                    }
//                    if (node.name=="Previous_Stop_Time_Button")&&(scheduleStopTimePage>1){
//                        scheduleStopTimePage-=1
//                        updateStopTime(stopTimePage: scheduleStopTimePage)
//                    }
//                    if node.name=="Yes_Button"{
//                        clearButtons()
//                    }
//                    if node.name=="Add_Button"{
//                        updateAddButton(trainNumber: trainNum)
//                        if(trainNum<4){
//                            trainNum+=1
//                            if(trainNum<4){
//                                scheduleButtonBackground.addChild(GameSceneButtons(buttonNum: 1, buttonRowCount: trainNum))
//                            }
//                            scheduleButtonBackground.addChild(GameSceneButtons(buttonNum: 2, buttonRowCount: trainNum))
//                            scheduleButtonBackground.addChild(GameSceneButtons(buttonNum: 3, buttonRowCount: trainNum))
//                            scheduleButtonBackground.addChild(GameSceneButtons(buttonNum: 4, buttonRowCount: trainNum))
//                            scheduleButtonBackground.addChild(GameSceneButtons(buttonNum: 5, buttonRowCount: trainNum))
//                            scheduleButtonBackground.addChild(GameSceneButtons(buttonNum: 6, buttonRowCount: trainNum))
//                            scheduleButtonBackground.addChild(GameSceneButtons(buttonNum: 7, buttonRowCount: trainNum))
//                            scheduleButtonBackground.addChild(GameSceneButtons(buttonNum: 8, buttonRowCount: trainNum))
//                            scheduleTimePage.append(0)
//                            scheduleDepartureStationPage.append(0)
//                            
//                            trains.append(Train(code: generateRandomCode()))
//                        }
//                    }
                //}
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
    
    override func update(_ currentTime: TimeInterval) {   // updates values related with time
        let currentTime=Date().timeIntervalSinceReferenceDate
        if runGame==true{
            gameTime=21000.0+(currentTime-startTime-totalGamePauseTime)*20
            let interval=gameTime
            //print(interval)
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
        
//        let currentTime=Date().timeIntervalSinceReferenceDate
//        gameTime=(currentTime-startTime)*20
//        let interval=gameTime
//        //print(interval)
//        let formattedTime = String(format: "Time: %.1f", gameTime)
//        timeLabel.text = formattedTime
//        
//        if(interval>=timeDouble){
//            if(gameTime>7200){
//                //passengerFlow=passengerFlow*pow((1201/1200), gameTime/86400)
//                passengerFlow=passengerFlow*pow((24948101/24948100),timeDouble)
//                totalPassenger+=passengerFlow
//            }
//            else{
//                totalPassenger+=passengerFlow
//            }
//            
//            let moneyChange=20.0*((passengerFlow)*5*(2+Double(scheduleTicketPricePage))-(1000.0/3600.0*15.0*(1+Double(scheduleStopTimePage))+1900.0/3600.0*180.0)/(15.0*(1+Double(scheduleStopTimePage))+180.0)-3800.0/3600.0-1500.0*Double(trains.count)/3600.0)
//            
//            //print(passengerFlow)
//            //print(moneyChange)
//            
//            money+=moneyChange
//            
//            timeDouble+=20.0
//        }
//        
//        let formattedPassenger = String(format: "%.0f", totalPassenger)
//        passengerLabel.text = formattedPassenger
//        
//        let formattedMoney = String(format: "%.1f", money)
//        moneyLabel.text = formattedMoney
        
    }
    
    func generateRandomCode() -> String {   // generates a random string
        let characters = "abcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()_+-=[]{};:'\"\\|,.<>/?`~"
        let nameLength = Int.random(in: 10...20)
        var randomString = ""
        for _ in 0..<nameLength {
            if let randomCharacter = characters.randomElement() {
                randomString.append(randomCharacter)
            }
        }
        
        return randomString
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
                            trains[i].startMovementN(scheduleStopTimePage: scheduleStopTimePage)
                        }
                        else if(trains[i].locationName=="Moshikou"){
                            trains[i].startStation="Moshikou"
                            trains[i].endStation="Shougang_Park"
                            trains[i].startMovementS(scheduleStopTimePage: scheduleStopTimePage)
                        }
                    }
                    else{
                        print("Train Location Error")
                    }
                }
            }
        }
    }
    
    func assignStation(newPassenger: Passenger){   // assigns each passenger object into station arrays
        if(newPassenger.startStationNumber==1){
            stations[0].southBoundPassengers.append(newPassenger)
        }
        else if(newPassenger.startStationNumber==2){
            if(newPassenger.endStationNumber<2){
                stations[1].northBoundPassengers.append(newPassenger)
            }
            else{
                stations[1].southBoundPassengers.append(newPassenger)
            }
        }
        else if(newPassenger.startStationNumber==3){
            if(newPassenger.endStationNumber<3){
                stations[2].northBoundPassengers.append(newPassenger)
            }
            else{
                stations[2].southBoundPassengers.append(newPassenger)
            }
        }
        else{
            stations[3].northBoundPassengers.append(newPassenger)
        }
    }
    
    func checkTrainLocation(){   // checks if the train is at the right departure station
        for i in 0...4{
            for j in 0...3{
                if(trains[i].locationName==stations[j].stationName){
                    disembarkPassengers(train: trains[i], station: stations[j])
                    boardPassengers(train: trains[i], station: stations[j])
                }
            }
        }
    }
    
    func disembarkPassengers(train: Train, station: Station){   // removes passengers that have reached their destination from the train array
        var passengersDisembarked=0
        if(train.passengersInTrain.count>0){
            for i in 0...train.passengersInTrain.count-1{
                if(train.passengersInTrain[i-passengersDisembarked].endStationNumber==station.stationNumber){
                    money+=Double(train.passengersInTrain.remove(at: i-passengersDisembarked).getTicketPrice())
                    passengersDisembarked+=1
                }
//                else{
//                    print("\(train.passengersInTrain[i-passengersDisembarked].startStationNumber),\(train.passengersInTrain[i-passengersDisembarked].endStationNumber)")
//                }
            }
        }
    }
    
    func boardPassengers(train: Train, station: Station){   // move some passengers from the station array into the train array 
        var passengersBoarded=0
        var emptySeats=train.capacity-train.passengersInTrain.count
        if(emptySeats>0){
            if(train.endStation=="Moshikou"){
                if(station.northBoundPassengers.count>0){
                    for i in 0...station.northBoundPassengers.count-1{
                        let targetPassenger=station.northBoundPassengers.remove(at: i-passengersBoarded)
                        train.passengersInTrain.append(targetPassenger)
                        //print("\(targetPassenger.startStationNumber),\(targetPassenger.endStationNumber)")
                        passengersBoarded+=1
                    }
                }
            }
            if(train.endStation=="Shougang_Park"){
                if(station.southBoundPassengers.count>0){
                    for i in 0...station.southBoundPassengers.count-1{
                        let targetPassenger=station.southBoundPassengers.remove(at: i-passengersBoarded)
                        train.passengersInTrain.append(targetPassenger)
                        //print("\(targetPassenger.startStationNumber),\(targetPassenger.endStationNumber)")
                        passengersBoarded+=1
                    }
                }
            }
        }
    }
}
