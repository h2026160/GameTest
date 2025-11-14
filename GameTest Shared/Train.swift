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
    private var startStation: String=""
    private var endStation: String=""
    private var passengerNumber: Int=0
    
    private var trainNode: SKSpriteNode!
    
    init(code: String) {
        self.code = code
        super.init()
        
        setTrain()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension Train{
    
    func startMovement(scheduleStopTimePage: Int){
        
        
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
        let MR11=SKAction.moveBy(x: 65, y: 0, duration: 9*65/285)
        let MR12=SKAction.moveBy(x: 120, y: -15, duration: 9*120/285)
        let MR13=SKAction.moveBy(x: 100, y: 0, duration: 9*100/285)
        let MR2=SKAction.moveBy(x: 275, y: 0, duration: 9)
        let MR31=SKAction.moveBy(x: 175, y: 0, duration: 9*175/275)
        let MR32=SKAction.moveBy(x: 20, y: 55, duration: 9*20/275)
        let MR33=SKAction.moveBy(x: 80, y: 0, duration: 9*80/275)
//        let TAL1=SKAction.moveBy(x: -100, y: 0, duration: 1)
//        let TAL2=SKAction.moveBy(x: -80, y: -25, duration: 1)
//        let TAL3=SKAction.moveBy(x: 180, y: 0, duration: 1)
        
        let loop=SKAction.sequence([ML1,ST,ML2,ST,ML31,ML32,ML33,ML34,ST,MR11,MR12,MR13,ST,MR2,ST,MR31,MR32,MR33,ST])
        
        self.run(loop){
            self.startMovement(scheduleStopTimePage: scheduleStopTimePage)
        }
//        trainNode.run(loop){
//            self.startMovement()
//        }
    }
    
    func setTrain(){
        trainNode=SKSpriteNode(imageNamed: "Train")
        trainNode.name="\(code)_Train"
        trainNode.position=CGPoint(x: 410, y: 27)
        trainNode.size=CGSize(width: 100, height: 10)
        
        addChild(trainNode)
    }
    
    func changeStartStation(stationName: String){
        startStation=stationName
    }
    
    func changeTerminusStation(stationName: String){
        endStation=stationName
    }
    
    func changeDepartureTime(timePoint: Int){
        departureTime=timePoint
    }
//    func call(){
//        print(self.endStation)
//    }
}
