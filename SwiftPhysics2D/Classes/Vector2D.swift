//
//  Vector2D.swift
//  BubbleManiaClone
//
//  Created by Johandy Tantra on 19/2/19.
//  Copyright © 2019 nus.cs3217.a0144676. All rights reserved.
//

import UIKit

/**
 a simple 2d vector representation
 */
public struct Vector2D {
    var x: CGFloat
    var y: CGFloat
    
    /// initializes the Vector2D
    /// - Parameters:
    ///     - x: the x component of the vector
    ///     - y: the y component of the vector
    init(_ x: CGFloat, _ y: CGFloat) {
        self.x = x
        self.y = y
    }
    
    /// flips the sign of the x component
    /// of the vector (multiplies the x vector
    /// by -1)
    mutating func flipX() {
        x *= -1
    }
    
    /// flips the sign of the y component
    /// of the vector (multiplies the y vector
    /// by -1)
    mutating func flipY() {
        y *= -1
    }
}
