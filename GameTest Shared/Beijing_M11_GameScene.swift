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
    private var time: Int=0{
        didSet{
            if time>648000{
                winGame()
            }
        }
    }
    private var money: Double=0.0{
        didSet{
            if money>360{
                winGame()
            }
            if money<=0{
                loseGame()
            }
        }
    }
    private var totalPassenger: Double=0.0{
        didSet{
            if totalPassenger>450{
                winGame()
            }
        }
    }


    
    override func didMove(to view: SKView) {
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

        //scheduleButtonBackground.addChild(GameSceneButtons(buttonNum: 23))
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let location=touches.first?.location(in: self)
        //let backgroundLoaction=CGPoint(x: 0, y: 0)
        //let timeIndicatorLoaction=CGPoint(x: -300, y: 140)
        //let departureStationIndicatorLoaction=CGPoint(x: -160, y: 140)
        //let excludedArea=CGRect(x: 0, y: 0, width: 479, height: 269)
        
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
    }
    
//    override func update(_ currentTime: TimeInterval) {
//        <#code#>
//    }
}
