//
//  Gameplay.swift
//  PeevedPenguins
//
//  Created by Boris Yue on 6/25/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import UIKit

class Gameplay: CCNode {
    weak var gamePhysicsNode: CCPhysicsNode!
    weak var catapultArm: CCNode!
    
    // called when CCB file has completed loading
    func didLoadFromCCB() {
        userInteractionEnabled = true
    }
    
    // called on every touch in this scene
    override func touchBegan(touch: CCTouch!, withEvent event: CCTouchEvent!) {
        launchPenguin()
    }
    
    func launchPenguin() {
        // loads the Penguin.ccb we have set up in SpriteBuilder
        let penguin = CCBReader.load("Penguin") as! Penguin
        // position the penguin at the bowl of the catapult
        penguin.position = ccpAdd(catapultArm.position, CGPoint(x: 16, y: 50))//ccpAdd: adds sum of two points
        //ccp: cgpointmake, CGPoint(x,y): makes point with floats
        
        // add the penguin to the gamePhysicsNode (because the penguin has physics enabled)
        gamePhysicsNode.addChild(penguin)
        
        // manually create & apply a force to launch the penguin
        let launchDirection = CGPoint(x: 1, y: 0)
        let force = ccpMult(launchDirection, 8000)//(8000, 0)
        penguin.physicsBody.applyForce(force)
    }
}
