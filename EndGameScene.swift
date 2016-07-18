//
//  EndGameScene.swift
//  CarGame
//
//  Created by John Kriston on 7/10/16.
//  Copyright © 2016 John Kriston. All rights reserved.
//

import SpriteKit

class EndGameScene: SKScene {
    
    var lblTryAgain: SKLabelNode = SKLabelNode(fontNamed: "ChalkboardSE-Bold")
    var graphPoints: Int = 0
    var finish: SKLabelNode = SKLabelNode(fontNamed: "ChalkboardSE-Bold")
    var score = GameState.sharedInstance.score
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(size: CGSize) {
        super.init(size: size)
        
        // Score
        let lblScore = SKLabelNode(fontNamed: "ChalkboardSE-Bold")
        lblScore.fontSize = 30
        lblScore.fontColor = SKColor.whiteColor()
        lblScore.position = CGPoint(x: self.size.width / 2, y: 150)
        lblScore.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Center
        lblScore.text = String(format: "Distance Traveled: %d", GameState.sharedInstance.score)
        addChild(lblScore)
        
        /* // Best Score
        let lblBestScore = SKLabelNode(fontNamed: "ChalkboardSE-Bold")
        lblBestScore.fontSize = 30
        lblBestScore.fontColor = SKColor.whiteColor()
        lblBestScore.position = CGPoint(x: self.size.width / 2, y: 150)
        lblBestScore.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Center
        lblBestScore.text = String(format: "Lowest Distance: %d", GameState.sharedInstance.bestScore)
        addChild(lblBestScore)
 */
        
        //Your Points
        let lblYourPoints = SKLabelNode(fontNamed: "ChalkboardSE-Bold")
        lblYourPoints.fontSize = 60
        lblYourPoints.fontColor = SKColor.yellowColor()
        lblYourPoints.position = CGPoint(x: self.size.width / 2, y: 300)
        lblYourPoints.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Center
        switch score{
            case 6...7:
                graphPoints = 20
            case 8:
                graphPoints = 15
            case 9...10:
                graphPoints = 10
            default:
                graphPoints = 5
        }
        lblYourPoints.text = String(format: "Points Awarded: +%d", graphPoints)
        addChild(lblYourPoints)
        
        // Try again
        lblTryAgain = SKLabelNode(fontNamed: "ChalkboardSE-Bold")
        lblTryAgain.fontSize = 30
        lblTryAgain.fontColor = SKColor.whiteColor()
        lblTryAgain.position = CGPoint(x: self.size.width / 2, y: 50)
        lblTryAgain.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Center
        lblTryAgain.text = "Tap To Try Again"
        addChild(lblTryAgain)
        
        
        //Finish
        // Try again
        finish = SKLabelNode(fontNamed: "ChalkboardSE-Bold")
        finish.fontSize = 30
        finish.fontColor = SKColor.whiteColor()
        finish.position = CGPoint(x: self.size.width / 2, y: 100)
        finish.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Center
        finish.text = "Finish"
        addChild(finish)
        }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        for touch: AnyObject in touches{
            //Get the location of the touch in this scene
            let location = touch.locationInNode(self)
            //Check if the location of the touch is withinthe button's bounds
            if lblTryAgain.containsPoint(location){
                let reveal = SKTransition.fadeWithDuration(0.5)
                let gameScene = GameScene(size: self.size)
                self.view!.presentScene(gameScene, transition: reveal)
                
            } else {
                let reveal = SKTransition.fadeWithDuration(0.5)
                let congratulationsScene = CongratulationsScene(size: self.size)
                self.view!.presentScene(congratulationsScene, transition: reveal)
                
                
            }
        }
    }
    

    }
