//
//  Train.swift
//  GameTest
//
//  Created by H2026160 on 19/9/2025.
//

import Foundation
import SpriteKit

class Train: SKNode{
    private var code: String
    private var departureTime: Int=0
    var startStation: String=""
    var endStation: String=""
    private var passengerNumber: Int=0
    
    private var trainNode: SKSpriteNode!
    
    private var locationIndex: Int=1
    var locationName: String="Shougang_Park_Depot"
    
    var capacity: Int=1800
    var passengersInTrain: [Passenger]=[]
    
    init(code: String) {
        self.code = code
        super.init()
        
        self.zPosition = -3.0
        
        setTrain()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension Train{
    
    func startMovementN(scheduleStopTimePage: Int){   // starts the northbound movement
        
        let updateLocation=SKAction.run { [weak self] in
            self?.locationIndex+=1
            if(self?.locationIndex==1){
                self?.locationName="Shougang_Park"
            }
            else if(self?.locationIndex==2){
                self?.locationName="Beixin'an"
            }
            else if(self?.locationIndex==3){
                self?.locationName="Jin'anqiao"
            }
            else{
                self?.locationName="Moshikou"
            }
        }
//        if stopTimeChanged{
//            //print("yes")
//            //stopTime=100
//            stopTimeChanged=false
//        }
        
        //trainNode.removeAllActions()
        
        let ST=SKAction.wait(forDuration: 0.5+0.5*Double(scheduleStopTimePage))
        //let ST=SKAction.wait(forDuration: 1+1*Double(scheduleStopTimePage))
        //let ST=SKAction.wait(forDuration: stopTime)
        let ML1=SKAction.moveBy(x: -275, y: 0, duration: 9)
        let ML2=SKAction.moveBy(x: -275, y: 0, duration: 9)
        let ML31=SKAction.moveBy(x: -100, y: 0, duration: 9*100/285)
        let ML32=SKAction.moveBy(x: -120, y: -15, duration: 9*120/285)
        let ML33=SKAction.moveBy(x: -5, y: -25, duration: 9*5/285)
        let ML34=SKAction.moveBy(x: -60, y: 0, duration: 9*60/285)
//        let MR11=SKAction.moveBy(x: 65, y: 0, duration: 9*65/285)
//        let MR12=SKAction.moveBy(x: 120, y: -15, duration: 9*120/285)
//        let MR13=SKAction.moveBy(x: 100, y: 0, duration: 9*100/285)
//        let MR2=SKAction.moveBy(x: 275, y: 0, duration: 9)
//        let MR31=SKAction.moveBy(x: 175, y: 0, duration: 9*175/275)
//        let MR32=SKAction.moveBy(x: 20, y: 55, duration: 9*20/275)
//        let MR33=SKAction.moveBy(x: 80, y: 0, duration: 9*80/275)
//        let TAL1=SKAction.moveBy(x: -100, y: 0, duration: 1)
//        let TAL2=SKAction.moveBy(x: -80, y: -25, duration: 1)
//        let TAL3=SKAction.moveBy(x: 180, y: 0, duration: 1)
        
        let loop=SKAction.sequence([ML1,ST,updateLocation,ML2,ST,updateLocation,ML31,ML32,ML33,ML34,ST,updateLocation])
        trainNode.run(loop)
//            self.startMovementN(scheduleStopTimePage: scheduleStopTimePage)
//        }
    }
    
    func startMovementS(scheduleStopTimePage: Int){   // starts the southbound movement
        
        let updateLocation=SKAction.run { [weak self] in
            self?.locationIndex-=1
            if(self?.locationIndex==1){
                self?.locationName="Shougang_Park"
            }
            else if(self?.locationIndex==2){
                self?.locationName="Beixin'an"
            }
            else if(self?.locationIndex==3){
                self?.locationName="Jin'anqiao"
            }
            else{
                self?.locationName="Moshikou"
            }
        }
        
        let ST=SKAction.wait(forDuration: 0.5+0.5*Double(scheduleStopTimePage))
        let MR11=SKAction.moveBy(x: 65, y: 0, duration: 9*65/285)
        let MR12=SKAction.moveBy(x: 120, y: -15, duration: 9*120/285)
        let MR13=SKAction.moveBy(x: 100, y: 0, duration: 9*100/285)
        let MR2=SKAction.moveBy(x: 275, y: 0, duration: 9)
        let MR31=SKAction.moveBy(x: 175, y: 0, duration: 9*175/275)
        let MR32=SKAction.moveBy(x: 20, y: 55, duration: 9*20/275)
        let MR33=SKAction.moveBy(x: 80, y: 0, duration: 9*80/275)
        
        let loop=SKAction.sequence([ST,MR11,MR12,MR13,ST,updateLocation,MR2,ST,updateLocation,MR31,MR32,MR33,ST,updateLocation])
        trainNode.run(loop)
    }
    
    func setTrain(){   // sets up train into the scene
        trainNode=SKSpriteNode(imageNamed: "Train")
        trainNode.name="\(code)_Train"
        trainNode.position=CGPoint(x: 410, y: 27)
        trainNode.size=CGSize(width: 100, height: 10)
        
        addChild(trainNode)
    }
    
    func changeStartStation(stationName: String){   // changes the train's start station
        startStation=stationName
    }
    
    func changeTerminusStation(stationName: String){   // changes the train's end station
        endStation=stationName
    }
    
    func changeDepartureTime(timePoint: Int){   // changes the train's departure time
        departureTime=timePoint
    }
//    func call(){
//        print(self.endStation)
//    }
    
    func enterService(){   // shows the train on the scene
        if(locationName=="Shougang_Park_Depot"){
            locationName="Shougang_Park"
            zPosition=8.0
        }
    }
}
