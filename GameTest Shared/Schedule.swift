//
//  Schedule.swift
//  GameTest
//
//  Created by H2026160 on 17/11/2025.
//

import Foundation
import SpriteKit

class Schedule{
    var canChange: Bool=true
    var startTime: Double
    var startStationName: String
    var endStationName: String
    
    init(startTime: Double, startStationName: String, endStationName: String) {
        self.startTime = startTime
        self.startStationName = startStationName
        self.endStationName = endStationName
    }
}
