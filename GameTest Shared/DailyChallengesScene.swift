//
//  DailyChallengesScene.swift
//  GameTest
//
//  Created by H2026160 on 6/1/2025.
//

import SpriteKit

class DailyChallengesScene: SKScene{
    private var MainNode=SKNode()
    
    override func didMove(to view: SKView) {
        setUpButton()
    }
}

extension DailyChallengesScene{
    func setUpButton(){
        MainNode.addChild(Map(mapNum: 101))
        MainNode.addChild(Button(buttonNum: 19))
        MainNode.addChild(Button(buttonNum: 20))
        addChild(MainNode)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
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
