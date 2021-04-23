//
//  GameScene.swift
//  RacingSimulator
//
//  Created by Viktor Lampert on 2021-04-22.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var track:SKSpriteNode?
    var coupe:SKSpriteNode?
    let ball = SKSpriteNode(imageNamed: "Stick")
    let base = SKSpriteNode(imageNamed: "Base")
    let car = SKSpriteNode(imageNamed: "Car1")
    var stickActive:Bool = false

    func createTrack(){
        track = self.childNode(withName: "NormalTrack") as? SKSpriteNode
    }
    
    override func didMove(to view: SKView) {
        
        self.addChild(base)
        base.position = CGPoint(x: 680, y: 50)
        
        self.addChild(ball)
        ball.position = base.position
        
        self.addChild(car)
        car.position = CGPoint(x: 300, y: 200)
    }
 
 
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in (touches){
            let location = touch.location(in: self)
            
            if (ball.frame.contains(location)){
                stickActive = true
            }else{
                stickActive = false
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in (touches){
            let location = touch.location(in: self)
            
            if (stickActive == true){
            
                moveForward()
    
            }
            
        }
    }
    
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
     
        if (stickActive == true){
            let move:SKAction = SKAction.move(to: base.position, duration: 0.2)
            move.timingMode = .easeOut
            ball.run(move)
            car.removeAllActions()
        }
    }
    
    func moveForward(){
        car.position = CGPoint(x:car.position.x + cos(car.zRotation) * 0.1,y:car.position.y + sin(car.zRotation) * 0.1)
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
