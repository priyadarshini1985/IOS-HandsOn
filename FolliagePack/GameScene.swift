//
//  GameScene.swift
//  FolliagePack
//
//  Created by priyadarshininagaraj on 11/12/16.
//  Copyright © 2016 VGenius. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    //This is LAbel
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    var hnode : SKSpriteNode?
    var wnode : SKSpriteNode?
    var onode : SKSpriteNode?
    
    override func didMove(to view: SKView) {
        print("did move")
        
        // Get label node from scene and store it for use later
self.label = self.childNode(withName: "//helloLabel") as? SKLabelNode
        
  self.hnode = self.childNode(withName: "//hnode") as? SKSpriteNode
  self.wnode = self.childNode(withName: "//wnode") as? SKSpriteNode
  self.onode = self.childNode(withName: "//onode") as? SKSpriteNode
        
        
        if let label = self.label {
            label.alpha = 0.0
            label.run(SKAction.fadeIn(withDuration: 2.0))
        }
        
        // Create shape node to use during mouse interaction
        let w = (self.size.width + self.size.height) * 0.05
        self.spinnyNode = SKShapeNode.init(rectOf: CGSize.init(width: w, height: w), cornerRadius: w * 0.3)
        
        if let spinnyNode = self.spinnyNode {
            spinnyNode.lineWidth = 2.5
            
            spinnyNode.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(M_PI), duration: 1)))
            spinnyNode.run(SKAction.sequence([SKAction.wait(forDuration: 0.5),
                                              SKAction.fadeOut(withDuration: 0.5),
                                              SKAction.removeFromParent()]))
        }
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        
       // print("Touch down")
        
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.green
            self.addChild(n)
        }
    }
    

    
    func touchMoved(toPoint pos : CGPoint) {
        
       // print("Touch Moved")
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.blue
            self.addChild(n)
        }
    }
    
    func touchUp(atPoint pos : CGPoint) {
      //  print("Touch Up")
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.red
            self.addChild(n)
        }
    }
    
    
    func isHTouched(touch: UITouch) -> Bool {
    
        let location = touch.location(in: self)
        
        
        
        if (hnode?.contains(location))! {
            
            return true;
            /// playagain was pressed, do something
        }
        
        print("isHTouched")
        return false;
        
    }
    
    
    func isWTouched(touch: UITouch) -> Bool {
        
        let location = touch.location(in: self)
        
        
        
        if (wnode?.contains(location))! {
            
            return true;
            /// playagain was pressed, do something
        }
        
        print("isWTouched")
        return false;
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        print("touches Began")
        if let label = self.label {
            label.run(SKAction.init(named: "Pulse")!, withKey: "fadeInOut")
        }
        
        for t in touches {
    self.touchDown(atPoint: t.location(in: self))
            
        print("\(t.location(in: self)) isHTouched \(isHTouched(touch: t))  isWTouched \(isWTouched(touch: t))")
            
            let loc : CGPoint = t.location(in: self)
            
            if (onode?.contains(loc))!{
            print("O CLick")
            }
            else{
            
            print("O not Clicked")
            
            }
        }
    
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        print("Touch Moved")
        for t in touches { self.touchMoved(toPoint: t.location(in: self))
            
            print("\(t.location(in: self))")
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        print("Touch Ended")
        for t in touches { self.touchUp(atPoint: t.location(in: self))
        print("\(t.location(in: self))")
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        print("Touch Cancelled")
        for t in touches { self.touchUp(atPoint: t.location(in: self))
        print("\(t.location(in: self))")
        }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        
       // print("Update")
        // Called before each frame is rendered
    }
}
