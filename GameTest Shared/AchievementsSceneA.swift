//
//  AchievementsSceneA.swift
//  GameTest
//
//  Created by H2026160 on 6/1/2025.
//

import SpriteKit

class AchievementsSceneA: SKScene{
    private var MainNode=SKNode()
    
    override func didMove(to view: SKView) {
        setUpButton()
    }
}

extension AchievementsSceneA{
    func setUpButton(){   // sets up the scene
        MainNode.addChild(Button(buttonNum: 18))
        addChild(MainNode)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {   // button interactions
        let location=touches.first?.location(in: self)
        
        let nodes=nodes(at: location!)
        for node in nodes {
            if node.name=="BackButton"{
                let newScene=SKScene(fileNamed: "MenuScene")
                self.view?.presentScene(newScene)
            }
        }
    }
}
