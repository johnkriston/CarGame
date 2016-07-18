//
//  NextScene1.swift
//  CarGame
//
//  Created by John Kriston on 7/13/16.
//  Copyright © 2016 John Kriston. All rights reserved.
//

import SpriteKit

class NextScene1: SKScene {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(size: CGSize) {
        super.init(size: size)
        backgroundColor = SKColor.blackColor()
        
        var bubble: SKSpriteNode!
        var text: SKLabelNode!
        var text1: SKLabelNode!
        var text2: SKLabelNode!
        var bubbletwo: SKSpriteNode!
        
        let background = SKSpriteNode(imageNamed: "road")
        background.size = CGSizeMake(size.width, size.height)
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        background.zPosition = 0
        addChild(background)
        
        let drivingcar = SKSpriteNode(imageNamed: "car123")
        drivingcar.size = CGSizeMake(125, 75)
        drivingcar.position = CGPoint(x: 550, y: 75)
        drivingcar.zPosition = 1
        addChild(drivingcar)
        
        bubbletwo = SKSpriteNode(imageNamed: "bubble")
        bubbletwo.size = CGSizeMake(200, 200)
        bubbletwo.position = CGPoint(x: 125,y: 75 )
        bubbletwo.zPosition = 1
        addChild(bubbletwo)
        
        text = SKLabelNode(fontNamed: "ChalkboardSE-Bold")
        text.fontSize = 13
        text.zPosition = 2
        text.fontColor = SKColor.blackColor()
        text.position = CGPoint(x: 0, y: 15)
        text.text = "Let's use Dijkstra's"
        bubbletwo.addChild(text)
        
        text1 = SKLabelNode(fontNamed: "ChalkboardSE-Bold")
        text1.fontSize = 13
        text1.zPosition = 2
        text1.fontColor = SKColor.blackColor()
        text1.position = CGPoint(x: 0, y: 0)
        text1.text = "algorithm!"
        bubbletwo.addChild(text1)
    }
    
    
    
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        transitionToNewScreen()
    }
    
    func transitionToNewScreen(){
        let reveal = SKTransition.fadeWithDuration(0.5)
        let nextScene = GameScene(size: self.size)
        self.view!.presentScene(nextScene, transition: reveal)
        
    }

}
