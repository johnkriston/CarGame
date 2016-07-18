//
//  NextScene.swift
//  CarGame
//
//  Created by John Kriston on 7/13/16.
//  Copyright © 2016 John Kriston. All rights reserved.
//

import SpriteKit

class NextScene: SKScene {
    
    var counter: Int = 0
    var bubble: SKSpriteNode = SKSpriteNode(imageNamed: "SpeechBubble")
    var bubbletwo: SKSpriteNode = SKSpriteNode(imageNamed: "bubble")
    var text: SKLabelNode!
    var text1: SKLabelNode!
    var text2: SKLabelNode!
    var text3: SKLabelNode!
    var text4: SKLabelNode!
    var text5: SKLabelNode!
    var hero : SKSpriteNode!
    var heroRunningFrames : [SKTexture]!
    var multiplierForDirection: CGFloat!

    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(size: CGSize) {
        super.init(size: size)
        backgroundColor = SKColor.blackColor()
        
       // var bubbletwo: SKSpriteNode!
        
        let background = SKSpriteNode(imageNamed: "road")
        background.size = CGSizeMake(size.width, size.height)
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        background.zPosition = 0
        addChild(background)
        
        let drivingcar = SKSpriteNode(imageNamed: "car123")
        drivingcar.size = CGSizeMake(175, 125)
        drivingcar.position = CGPoint(x: 550, y: 75)
        drivingcar.zPosition = 1
        addChild(drivingcar)
        
        bubble = SKSpriteNode(imageNamed: "SpeechBubble")
        bubble.size = CGSizeMake(200, 200)
        bubble.position = CGPoint(x: 575, y: 250)
        bubble.zPosition = 1
        bubble.hidden = false
        addChild(bubble)
        
        text = SKLabelNode(fontNamed: "ChalkboardSE-Bold")
        text.fontSize = 13
        text.zPosition = 2
        text.fontColor = SKColor.blackColor()
        text.position = CGPoint(x: 0, y: 15)
        text.text = "Looks like we are going"
        bubble.addChild(text)
        
        text1 = SKLabelNode(fontNamed: "ChalkboardSE-Bold")
        text1.fontSize = 13
        text1.zPosition = 2
        text1.fontColor = SKColor.blackColor()
        text1.position = CGPoint(x: 0, y: 0)
        text1.text = "to have to drive our way"
        bubble.addChild(text1)
        
        text2 = SKLabelNode(fontNamed: "ChalkboardSE-Bold")
        text2.fontSize = 13
        text2.zPosition = 2
        text2.fontColor = SKColor.blackColor()
        text2.position = CGPoint(x: 5, y: -15)
        text2.text = "out of this one!"
        bubble.addChild(text2)
        
       bubbletwo = SKSpriteNode(imageNamed: "bubble")
        bubbletwo.size = CGSizeMake(260, 260)
        bubbletwo.position = CGPoint(x: 125,y: 100 )
        bubbletwo.zPosition = 1
        bubbletwo.hidden = true
        addChild(bubbletwo)
 
        
        text3 = SKLabelNode(fontNamed: "ChalkboardSE-Bold")
        text3.fontSize = 12
        text3.zPosition = 2
        text3.fontColor = SKColor.blackColor()
        text3.position = CGPoint(x: 0, y: 30)
        text3.text = "Dijkastra's algorithm finds the shortest"
        bubbletwo.addChild(text3)
        
        text4 = SKLabelNode(fontNamed: "ChalkboardSE-Bold")
        text4.fontSize = 12
        text4.zPosition = 2
        text4.fontColor = SKColor.blackColor()
        text4.position = CGPoint(x: 0, y: 15)
        text4.text = " path between nodes in a graph, which"
        bubbletwo.addChild(text4)
        
        text5 = SKLabelNode(fontNamed: "ChalkboardSE-Bold")
        text5.fontSize = 12
        text5.zPosition = 2
        text5.fontColor = SKColor.blackColor()
        text5.position = CGPoint(x: 5, y: 0)
        text5.text = "may represent, for example, roads"
        bubbletwo.addChild(text5)
        
        let heroAnimatedAtlas = SKTextureAtlas(named: "playerImages")
        var runFrames = [SKTexture]()
        
        let numImages = heroAnimatedAtlas.textureNames.count
        for var i=1; i<=numImages; i++ {
            let heroTextureName = "run\(i)"
            runFrames.append(heroAnimatedAtlas.textureNamed(heroTextureName))
        }
        
        heroRunningFrames = runFrames
        
        let firstFrame = heroRunningFrames[0]
        hero = SKSpriteNode(texture: firstFrame)
        hero.position = CGPoint(x: -10, y: 100)
        hero.zPosition = 2
        hero.size = CGSizeMake(120, 120)
        hero.hidden = true
        addChild(hero)
        
        //Create Villain 
        
        
        

    
    }
    
    func changetext(string: String, string1: String, string2: String){
      text.text = string
    text1.text = string1
        text2.text = string2
        
        if counter==1{
            text.fontSize = 9
            text1.fontSize = 9
            text2.fontSize = 8
        }
    }
    
    func changeanothertext(string: String, string1: String, string2: String){
        text3.text = string
        text4.text = string1
        text5.text = string2
        
        if counter == 4{
            text3.fontSize = 20
            text4.fontSize = 20
        }
}

    
    
    
    
    

    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        //let location = touch.locationInNode(self)
      
        if counter == 0{
            changetext("Lets use Dijkstra's", string1: "algorithm!", string2: "")
        
        }
        if counter == 1{
            bubbletwo.hidden = false
            bubble.hidden = true
        }
        if counter == 2{
            changeanothertext("When driving, think of the road", string1: "as an edge of the graph", string2: "and a node as an intersection")
            
        }
        if counter == 3{
            changeanothertext("Before traveling each distance on the", string1: "road, try to find the shortest distance", string2: "of each intersection you travel by")
        }
        
        if counter == 4{
            changeanothertext("Ready?", string1: "Let's go!", string2: "")
        }
        
        if counter == 5{
            bubbletwo.hidden = true
            hero.hidden = false
            multiplierForDirection = -1.0
            let location = CGPoint(x: 500, y: 75)
            
            let heroVelocity = self.frame.size.width/2.5
            let moveDifference = CGPointMake(location.x - hero.position.x, location.y - hero.position.y)
           let  distanceToMove = sqrt(moveDifference.x * moveDifference.x + moveDifference.y * moveDifference.y)
            let moveDuration = distanceToMove / heroVelocity
            hero.xScale = fabs(hero.xScale) * multiplierForDirection
            
            if(hero.actionForKey("heroMoving") != nil){
                //stop just the moving to a new location, but leave the walking legs movemenet running
                hero.removeActionForKey("heroMoving")
            }
            
            if(hero.actionForKey("runningInPlaceHero") == nil){
                //if legs are not moving go ahead and start them
                runningHero()
            }
            
            let moveAction = (SKAction.moveTo(location, duration: (Double(moveDuration))))
            
            let doneAction = (SKAction.runBlock({
                    print("Animation Completed")
                    self.heroMoveEnded()
                  }))
            let transitionAction = (SKAction.runBlock({
                    let reveal = SKTransition.fadeWithDuration(0.5)
                    let gameScene = GameScene(size: self.size)
                    self.view!.presentScene(gameScene, transition: reveal)
          
                }))
            let moveActionWithDone = (SKAction.sequence([moveAction, doneAction, transitionAction]))
            hero.runAction(moveActionWithDone, withKey: "heroMoving")
            
            
            
        }
    
        
        counter = counter + 1
      
    }
    
    func runningHero(){
        //This is our general runAction to make our hero run
        hero.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures(heroRunningFrames, timePerFrame: 0.1, resize: false, restore: true)),
                       withKey: "runningInPlaceHero")
        
    }
    
    func heroMoveEnded(){
        hero.removeAllActions()
    }
    
    
    func transitionToNewScreen(){
        let reveal = SKTransition.fadeWithDuration(0.5)
        let gameScene = GameScene(size: self.size)
        self.view!.presentScene(gameScene, transition: reveal)

    }


}
