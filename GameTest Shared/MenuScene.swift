//
//  TestScene.swift
//  GameTest
//
//  Created by H2026160 on 11/12/2024.
//

import SpriteKit

class MenuScene: SKScene {
    
    private let MainNode=SKNode()
    
    override func didMove(to view: SKView) {
        //print("moved")
        setUpButton()
    }
    
}

extension MenuScene{
    
    func setUpButton(){
        for i in 0...9{
            //let ButtonNode=Button(buttonNum:i)
            //MainNode.addChild(ButtonNode)
            //addChild(MainNode)
            MainNode.addChild(Button(buttonNum:i))
        }
        addChild(MainNode)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let location=touches.first?.location(in: self)
        
        let nodes=nodes(at: location!)
        for node in nodes {
            if node.name=="NewGameButton"{
                let newScene=SKScene(fileNamed: "NewGameSceneA")
                self.view?.presentScene(newScene)
            }
            if node.name=="LoadGameButton"{
                let newScene=SKScene(fileNamed: "LoadGameSceneA")
                self.view?.presentScene(newScene)
            }
            if node.name=="SettingsButton"{
                let newScene=SKScene(fileNamed: "SettingsSceneA")
                self.view?.presentScene(newScene)
            }
            if node.name=="ExitGameButton"{
                exit(0)
            }
            if node.name=="AchievementsButton"{
                let newScene=SKScene(fileNamed: "AchievementsSceneA")
                self.view?.presentScene(newScene)
            }
            if node.name=="DailyChallengesButton"{
                let newScene=SKScene(fileNamed: "DailyChallengesScene")
                self.view?.presentScene(newScene)
            }
        }
    }
    
}
