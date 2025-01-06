//
//  NewGameSceneA.swift
//  GameTest
//
//  Created by H2026160 on 16/12/2024.
//

import SpriteKit

class NewGameSceneA: SKScene {
    
    private let MainNode=SKNode()
    
    private var pageNum:Int=1
    private var totalPages:Int=2
    private var mapNum:Int=4
    private var atTop:Bool=true
    private var atBottom:Bool=false
    
    override func didMove(to view: SKView) {
        print("moved")
        setUpButton(pageNumber:pageNum)
    }

}

extension NewGameSceneA {
    
    func setUpButton(pageNumber:Int){
        print("called")
        for i in 10...11{
            MainNode.addChild(Button(buttonNum:i))
        }
        if(atTop){
            MainNode.addChild(Button(buttonNum:12))
        }
        else if(atBottom){
            MainNode.addChild(Button(buttonNum:13))
        }
        else{
            MainNode.addChild(Button(buttonNum:12))
            MainNode.addChild(Button(buttonNum:13))
        }
        if(pageNum != totalPages){
            for i in (14+(pageNumber-1)*3)...(14+(pageNumber)*3-1){
                MainNode.addChild(Button(buttonNum:i))
            }
        }
        else{
            for i in (14+(pageNumber-1)*3)...(14+(pageNumber-1)*3+mapNum%3-1){
                MainNode.addChild(Button(buttonNum:i))
            }
        }
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
            if node.name=="NextPageButton"{
                MainNode.removeAllChildren()
                pageNum+=1
                setUpButton(pageNumber:pageNum)
            }
        }
    }
    
}
