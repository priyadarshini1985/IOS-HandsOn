//
//  GameViewController.swift
//  FolliagePack
//
//  Created by priyadarshininagaraj on 11/12/16.
//  Copyright © 2016 VGenius. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        print("View did Load")
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }

    override var shouldAutorotate: Bool {
        
        print("Should Auto Rotate")
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        
        print("Supported Interface Orientation view controll")
//        if UIDevice.current.userInterfaceIdiom == .phone {
//            return .allButUpsideDown
//        } else {
//            return .all
//        }
        
        return .landscape

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        print("Did Receive Memory Warning")
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        print("Prefers Status Bar Hidden")
        return true
    }
}
