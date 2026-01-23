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
        
        if(code.prefix(2)=="11"){
            setTrainM11()
        }
        if(code.prefix(1)=="6"){
            setTrainM6()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension Train{
    
    func startMovementN_M11(scheduleStopTimePage: Int){   // starts the northbound movement
        
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
    
    func startMovementS_M11(scheduleStopTimePage: Int){   // starts the southbound movement
        
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
    
    func startMovementW_M6(scheduleStopTimePage: Int){
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
        
        let loop=SKAction.sequence([ML011,ML012,ML013,ST,ML021,ML022,ML023,ST,ML03,ST,ML04,ST,ML05,ST,ML06,ST,ML07,ST,ML08,ST,ML09,ST,ML10,ST,ML11,ST,ML12,ST,ML13,ST,ML14,ST,ML15,ST,ML16,ST,ML17,ST,ML18,ST,ML19,ST,ML201,ML202,ML203,ST])
        trainNode.run(loop)
    }
    
    func startMovementE_M6(scheduleStopTimePage: Int){
        let ST=SKAction.wait(forDuration: 0.5)
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
        
        let loop=SKAction.sequence([MR01,ST,MR02,ST,MR03,ST,MR04,ST,MR05,ST,MR06,ST,MR07,ST,MR08,ST,MR09,ST,MR10,ST,MR11,ST,MR12,ST,MR13,ST,MR14,ST,MR15,ST,MR16,ST,MR17,ST,MR18,ST,MR191,MR192,MR193,ST,MR201,MR202,MR203,ST])
        trainNode.run(loop)
    }
    
    func setTrainM11(){   // sets up train into the scene
        trainNode=SKSpriteNode(imageNamed: "Train")
        trainNode.name="\(code)_Train"
        trainNode.position=CGPoint(x: 410, y: 27)
        trainNode.size=CGSize(width: 100, height: 10)
        
        addChild(trainNode)
    }
    
    func setTrainM6(){   // sets up train into the scene
        trainNode=SKSpriteNode(color: .brown, size: CGSize(width: 17, height: 1.7))
        trainNode.name="\(code)_Train"
        trainNode.position=CGPoint(x: 566, y: 1.1)
        
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
