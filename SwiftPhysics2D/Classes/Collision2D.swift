//
//  Collision2D.swift
//  BubbleManiaClone
//
//  Created by Johandy Tantra on 19/2/19.
//  Copyright © 2019 nus.cs3217.a0144676. All rights reserved.
//

import UIKit

/**
 a class that represents a collision event
 between two objects. It is able to process the
 type of collision and returns the resulting
 velocities of the objects.
 */
public class Collision2D {
    var rigidBody: RigidBody2D
    var otherRigidBody: RigidBody2D
    
    /// initializes the collision event
    /// - Parameters:
    ///     - rigidBody: the first RigidBody2D object that
    ///     is involved in the collision
    ///     - otherRigidBody: the other RigidBody2D object
    ///     that is involved in the collision
    public init(rigidBody: RigidBody2D, otherRigidBody: RigidBody2D) {
        self.rigidBody = rigidBody
        self.otherRigidBody = otherRigidBody
    }
    
    /// gets the resulting CGRect rectangle object due
    /// to the intersection of the two rigid bodies
    /// - Returns: CGRect representing the intersection
    /// between the two rigid bodies
    private func getIntersectingRect() -> CGRect {
        return rigidBody.frame.intersection(otherRigidBody.frame)
    }
    
    /// gets the collision type of the two colliding
    /// objects
    /// - Returns: CollisionType enum case
    public func getCollisionType() -> CollisionTypes {
        if rigidBody.isImmovable && otherRigidBody.isImmovable {
            return .NONE
        } else if !rigidBody.isImmovable && !otherRigidBody.isImmovable {
            return .KINEMATIC
        } else {
            return .REFLECTION
        }
    }
    
    public func getRigidBodyVelocityAfterCollision() -> Vector2D? {
        if getCollisionType() == .REFLECTION {
            if getIntersectingRect().maxX == otherRigidBody.frame.maxX || getIntersectingRect().minX == otherRigidBody.frame.minX {
                // right or left reflection
                rigidBody.velocity.flipX()
                
                return rigidBody.velocity
            } else if getIntersectingRect().maxY == otherRigidBody.frame.maxY || getIntersectingRect().minY == otherRigidBody.frame.minY {
                // top or bottom reflection
                rigidBody.velocity.flipY()
                
                return rigidBody.velocity
            }
        }
        
        return nil
    }
}
