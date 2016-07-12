//
//  EndGameScene.swift
//  CarGame
//
//  Created by John Kriston on 7/10/16.
//  Copyright © 2016 John Kriston. All rights reserved.
//

import SpriteKit

class EndGameScene: SKScene {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        // Transition back to the Game
        let reveal = SKTransition.fadeWithDuration(0.5)
        let gameScene = GameScene(size: self.size)
        self.view!.presentScene(gameScene, transition: reveal)
    }

    
    override init(size: CGSize) {
        super.init(size: size)
        
        // Score
        let lblScore = SKLabelNode(fontNamed: "ChalkboardSE-Bold")
        lblScore.fontSize = 60
        lblScore.fontColor = SKColor.whiteColor()
        lblScore.position = CGPoint(x: self.size.width / 2, y: 300)
        lblScore.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Center
        lblScore.text = String(format: "%d", GameState.sharedInstance.score)
        addChild(lblScore)
        
        // Best Score
        let lblBestScore = SKLabelNode(fontNamed: "ChalkboardSE-Bold")
        lblBestScore.fontSize = 30
        lblBestScore.fontColor = SKColor.cyanColor()
        lblBestScore.position = CGPoint(x: self.size.width / 2, y: 150)
        lblBestScore.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Center
        lblBestScore.text = String(format: "Lowest Distance: %d", GameState.sharedInstance.bestScore)
        addChild(lblBestScore)
        
        // Try again
        let lblTryAgain = SKLabelNode(fontNamed: "ChalkboardSE-Bold")
        lblTryAgain.fontSize = 30
        lblTryAgain.fontColor = SKColor.whiteColor()
        lblTryAgain.position = CGPoint(x: self.size.width / 2, y: 50)
        lblTryAgain.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Center
        lblTryAgain.text = "Tap To Try Again"
        addChild(lblTryAgain)        
    }
}
