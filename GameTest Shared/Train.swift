//
//  Train.swift
//  GameTest
//
//  Created by H2026160 on 19/9/2025.
//

import Foundation
import SpriteKit

class Train{
    private var code: String
    private var departureTime: Int=0
    private var startStation: String=""
    private var endStation: String=""
    private var passengerNumber: Int=0
    
    init(code: String) {
        self.code = code
    }
}

extension Train{
    func changeStartStation(stationName: String){
        startStation=stationName
    }
    
    func changeTerminusStation(stationName: String){
        endStation=stationName
    }
    
    func changeDepartureTime(timePoint: Int){
        departureTime=timePoint
    }
    func call(){
        print(self.endStation)
    }
}
