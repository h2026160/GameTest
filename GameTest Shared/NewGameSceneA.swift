//
//  NewGameSceneA.swift
//  GameTest
//
//  Created by H2026160 on 16/12/2024.
//

import SpriteKit

class NewGameSceneA: SKScene {
    
    private let MainNode=SKNode()
    
    override func didMove(to view: SKView) {
        print("moved")
        setUpButton()
    }

}

extension NewGameSceneA {
    
    func setUpButton(){
        for i in 10...11{
            MainNode.addChild(Button(buttonNum:i))
        }
        addChild(MainNode)
    }
}
