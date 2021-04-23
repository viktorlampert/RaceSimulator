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
    
    
    func createTrack(){
        track = self.childNode(withName: "NormalTrack") as? SKSpriteNode
    }
    
    func createCar(){
        coupe = SKSpriteNode(imageNamed: "Car1")
        guard let carPosition = track?.position.x else {return}
        coupe?.position = CGPoint(x: carPosition, y: self.size.height / 2)
        self.addChild(coupe!)
    }
    
    override func didMove(to view: SKView) {
        createTrack()
        createCar()
    }
    
    func moveForward (up: Bool){
        if up{
            //let rotate = SKAction.moveBy(, y: <#T##CGFloat#>, duration: <#T##TimeInterval#>)
            //let repeatAction = SKAction.repeatForever(rotate)
            //coupe?.run(repeatAction)
        }
        
    }
    
    func moveBackwards (down: Bool){
        if down{
            //let rotate = SKAction.move(by: <#T##CGVector#>, duration: <#T##TimeInterval#>)
            //let repeatAction = SKAction.repeatForever(rotate)
            //coupe?.run(repeatAction)
        }
        
    }
    func turnLeft(left: Bool){
        if left{
            let rotate = SKAction.rotate(byAngle: CGFloat(Double.pi/60), duration: 0.01)
            let repeatAction = SKAction.repeatForever(rotate)
            coupe?.run(repeatAction)
        }
    }
    func turnRight (right: Bool){
        if right{
            let rotate = SKAction.rotate(byAngle: CGFloat(-Double.pi/60), duration: 0.01)
            let repeatAction = SKAction.repeatForever(rotate)
            coupe?.run(repeatAction)
        }
        
    }
    //sasas
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in (touches as! Set<UITouch>){
            let location = touch.location(in: self)
            
    }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in (touches as! Set<UITouch>){
            let location = touch.location(in: self)
            
            let v = CGVector(dx: location.x - base.position.x, dy: location.y - base.position.y)
            let angle = atan2(v.dy, v.dx)
            
            let deg = angle * CGFloat(180 / Double.pi)
            //print(deg + 180)
            
            let length:CGFloat = base.frame.size.height / 2
            
            let xDist:CGFloat = sin(angle - 1.57079633) * length
            let yDist:CGFloat = cos(angle - 1.57079633) * length
            
            ball.position = CGPoint(x:base.position.x - xDist,y:base.position.y + yDist)
            
            
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        coupe?.removeAllActions()
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        coupe?.removeAllActions()
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
