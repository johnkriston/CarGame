//
//  AnimationScene.swift
//  CarGame
//
//  Created by John Kriston on 7/11/16.
//  Copyright © 2016 John Kriston. All rights reserved.
//

import SpriteKit

class AnimationScene: SKScene {
    
    // Layered Nodes
    var backgroundNode: SKNode!
    var hudNode: SKNode!
    var hero : SKSpriteNode!
    var bubble: SKSpriteNode!
    var player : SKNode!
    var heroWalkingFrames : [SKTexture]!
    var door : SKSpriteNode!
    var doorOpeningFrames : [SKTexture]!
    var text: SKLabelNode!
    var text1: SKLabelNode!
    
    
    
    // To Accommodate iPhone 6
    var scaleFactor: CGFloat!
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(size: CGSize) {
        super.init(size: size)
        backgroundColor = SKColor.blackColor()
        
       let background = SKSpriteNode(imageNamed: "WindowHallway.jpg")
        background.size = CGSizeMake(size.width, size.height)
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        background.zPosition = 0
        addChild(background)
        
        let doorAnimatedAtlas = SKTextureAtlas(named: "dungeon")
        var doorFrames = [SKTexture]()
        
       let Images = doorAnimatedAtlas.textureNames.count
        for var i=1; i<=Images; i++ {
            let doorTextureName = "door\(i)"
            doorFrames.append(doorAnimatedAtlas.textureNamed(doorTextureName))
        }
        
        self.doorOpeningFrames = doorFrames
        
        let first = self.doorOpeningFrames[0]
        self.door = SKSpriteNode(texture: first)
        self.door.zPosition = 1
        self.door.size = CGSizeMake(80, 80)
        self.door.position = CGPoint(x: 175, y: 150)
        addChild(self.door)
        

        player = createHero()
        addChild(player)
        
        
        
        var multiplierForDirection: CGFloat
        
        
        // 2
        let heroVelocity = self.frame.size.width / 4.0
        let location = CGPoint(x: 250, y: 150)
        let locationtwo = CGPoint(x: 175, y: 150)
        
        // 3
        let moveDifference = CGPointMake(location.x - hero.position.x, location.y - hero.position.y)
        let distanceToMove = sqrt(moveDifference.x * moveDifference.x + moveDifference.y * moveDifference.y)
        
        let moveDifference2 = CGPointMake(locationtwo.x - hero.position.x, locationtwo.y - hero.position.y)
        let distanceToMove2 = sqrt(moveDifference2.x * moveDifference2.x + moveDifference.y * moveDifference.y)
        
        // 4
        let moveDuration = distanceToMove / heroVelocity
        let moveDurationTwo = distanceToMove2 / heroVelocity
        
        
        multiplierForDirection = 1.0
        
        hero.xScale = fabs(hero.xScale) * multiplierForDirection
            
            / 1
        if (hero.actionForKey("heroMoving") != nil) {
            //stop just the moving to a new location, but leave the walking legs movement running
            hero.removeActionForKey("heroMoving")
        }
        
        // 2
        if (hero.actionForKey("walkingInPlaceHero") == nil) {
            //if legs are not moving go ahead and start them
            walkingHero()
            
        }
        
        // 3
        let moveAction = (SKAction.moveTo(location, duration:(Double(moveDuration))))
        
        // 4
        let doneAction = (SKAction.runBlock({
            print("Animation Completed")
            self.heroMoveEnded()
            
        }))
        
        let doorAction = (SKAction.runBlock({
            self.openingDoor()
        }))
        
        let waitAction = (SKAction.waitForDuration(0.5))
        
        let moveMoreAction = (SKAction.moveTo(locationtwo, duration:(Double(0.5))))
        
        let fadeAction = (SKAction.fadeOutWithDuration(1))
        
        
        let transitionAction = (SKAction.runBlock({
            self.newScene()
        }))
        
        //
        let moveActionWithDone = (SKAction.sequence([moveAction, doneAction, doorAction, waitAction, moveMoreAction, fadeAction, waitAction, transitionAction]))
        player.runAction(moveActionWithDone, withKey: "walkingInPlaceHero")
        
        
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        
    }
    
    func createHero() -> SKNode{
        let heroNode = SKNode()
        heroNode.position = CGPoint(x: size.width - 50, y: size.height - 300)
        let heroAnimatedAtlas = SKTextureAtlas(named: "playerImages")
        var walkFrames = [SKTexture]()
        
        let numImages = heroAnimatedAtlas.textureNames.count
        for var i=1; i<=numImages; i++ {
            let heroTextureName = "run\(i)"
            walkFrames.append(heroAnimatedAtlas.textureNamed(heroTextureName))
        }
        
        heroWalkingFrames = walkFrames
        
        let firstFrame = heroWalkingFrames[0]
        
        hero = SKSpriteNode(texture: firstFrame)
        hero.zPosition = 2
        hero.size = CGSizeMake(100, 100)
        heroNode.addChild(hero)
        
        bubble = SKSpriteNode(imageNamed: "SpeechBubble")
        bubble.zPosition = 1
        bubble.size = CGSizeMake(120,120)
        bubble.position = CGPoint(x: -75, y: 75)
        hero.addChild(bubble)
        
        text = SKLabelNode(fontNamed: "ChalkboardSE-Bold")
        text.fontSize = 13
        text.zPosition = 2
        text.fontColor = SKColor.blackColor()
        text.position = CGPoint(x: 0, y: 15)
        text.text = "Let's get out"
        bubble.addChild(text)
        
        text1 = SKLabelNode(fontNamed: "ChalkboardSE-Bold")
        text1.fontSize = 13
        text1.zPosition = 2
        text1.fontColor = SKColor.blackColor()
        text1.position = CGPoint(x: 5, y: 0)
        text1.text = "of here!"
        bubble.addChild(text1)
        
        return heroNode
    }
    
    func walkingHero() {
        //This is our general runAction method to make our bear walk.
        hero.runAction(SKAction.repeatActionForever(
            SKAction.animateWithTextures(heroWalkingFrames,
                timePerFrame: 0.1,
                resize: false,
                restore: true)),
                       withKey:"walkingInPlaceHero")
    }
    
    
    func heroMoveEnded() {
        hero.removeAllActions()
    }
    
    func doorMoveEnded(){
        door.removeAllActions()
    }
    
    
    func openingDoor(){
            //This is our general runAction method to make the door open
            door.runAction(SKAction.repeatAction(SKAction.animateWithTextures(doorOpeningFrames, timePerFrame: 0.05), count: 1))
    }
    
    func newScene() {
        let reveal = SKTransition.fadeWithDuration(0.5)
        let nextScene = NextScene(size: self.size)
        self.view!.presentScene(nextScene, transition: reveal)

    }
    
    
    


}
