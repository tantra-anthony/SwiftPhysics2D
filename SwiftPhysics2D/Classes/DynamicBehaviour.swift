//
//  DynamicBehaviour.swift
//  BubbleManiaClone
//
//  Created by Johandy Tantra on 19/2/19.
//  Copyright © 2019 nus.cs3217.a0144676. All rights reserved.
//

import UIKit

/**
 blueprint for a standard dynamic behaviour
 of a physics object. The physics object
 should be able to update itself and handle
 its own collisions.
 */
public protocol DynamicBehaviour {
    func update()
    func onCollideEnter2D(collision: Collision2D)
}

public extension DynamicBehaviour {
    func update() {}
    func onCollideEnter2D(collision: Collision2D) { }
}
