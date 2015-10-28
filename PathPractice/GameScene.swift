//
//  GameScene.swift
//  PathPractice
//
//  Created by Michael DeJesus on 10/23/15.
//  Copyright (c) 2015 Michael DeJesus. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
   
    override func didMoveToView(view: SKView) {
        
        runAction(SKAction.repeatActionForever(
            SKAction.sequence([
                SKAction.runBlock(addArrow),
                SKAction.waitForDuration(0.5)
                ])
            ))

        
        
        runAction(SKAction.repeatActionForever(
            SKAction.sequence([
                SKAction.runBlock(addEnemy),
                SKAction.waitForDuration(1.0)
                ])
            ))
    }
    
    func random() -> CGFloat {
        return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }
    
    func random(min: CGFloat, max: CGFloat) -> CGFloat {
        return random() * (max - min) + min
    }
    
    func addEnemy() {
        
        let enemy = SKSpriteNode(imageNamed: "Knight Enemy (7)")
        
        let actualY = random(self.size.height/2 + 50, max: self.size.height/2 + 60)
        
        enemy.position = CGPoint(x:  -enemy.size.width/2, y: actualY)
        
        addChild(enemy)
        
        let path = CGPathCreateMutable()
        CGPathMoveToPoint(path, nil, 0, 0)
        CGPathAddLineToPoint(path, nil, 180, 0)
        CGPathAddLineToPoint(path, nil, 180, -240)
        CGPathAddLineToPoint(path, nil, 450, -240)
        CGPathAddLineToPoint(path, nil, 450, 175)
        CGPathAddLineToPoint(path, nil, 740, 175)
        CGPathAddLineToPoint(path, nil, 740, 0)
        CGPathAddLineToPoint(path, nil, 1300, 0)
        

        let followLine = SKAction.followPath(path, asOffset: true, orientToPath: false, duration: 13.0)
        enemy.runAction(SKAction.sequence([followLine]))
        
    }
    
    func addArrow() {
        
        let arrow = SKSpriteNode(imageNamed: "Arrow")
        
        let ArrowY = random(-arrow.size.height/2, max: self.size.height + arrow.size.height/2)
        
        arrow.position = CGPoint(x: 300, y: ArrowY)
        
        addChild(arrow)
        
        let path = CGPathCreateMutable()
        CGPathMoveToPoint(path, nil, 0, 0 )
        CGPathAddLineToPoint(path, nil,-self.size.width - arrow.size.width , 0 )
        
        let follow = SKAction.followPath(path, asOffset: true, orientToPath: false, duration: 2.0)
        arrow.runAction(SKAction.sequence([follow]))
        
    }
    
        override func update(currentTime: CFTimeInterval) {
       
    }
}
