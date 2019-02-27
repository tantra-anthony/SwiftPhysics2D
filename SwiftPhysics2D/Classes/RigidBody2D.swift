//
//  RigidBody2D.swift
//  BubbleManiaClone
//
//  Created by Johandy Tantra on 19/2/19.
//  Copyright © 2019 nus.cs3217.a0144676. All rights reserved.
//

import UIKit

/**
 a rigid body representation that has
 its own physical properties such as velocity
 and whether it is immovable (inertial behaviour
 is not included)
 
 the class is subclassed from UIImageView to
 get all the predefined properties to render the
 object and to get the positions and bounding boxes
 of the class. This simplifies future calculations.
 */
public class RigidBody2D: UIImageView {
    var velocity: Vector2D = Vector2D(0.0, 0.0)
    var isImmovable: Bool = false
    
    /// initializes the RigidBody2D object
    /// with zero velocity and zero frames
    init() {
        self.velocity = Vector2D(0.0, 0.0)
        super.init(frame: CGRect.zero)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    /// returns a boolean defining whether
    /// this particular rigidbody intersects with
    /// another rigidbody when their colliders are all
    /// box shaped
    /// - Parameters:
    ///     - rigidBody: the other RigidBody2D object
    /// - Returns: true if the rigidbodies intersect, false otherwise
    func isIntersectingBoxToBoxWith(_ rigidBody: RigidBody2D) -> Bool {
        return self.frame.intersects(rigidBody.frame)
    }
    
    /// returns a boolean defining whether
    /// this particular rigidbody intersects with
    /// another UIView frame when their colliders are
    /// circular shaped
    /// - Parameters:
    ///     - view: the other UIView object
    /// - Returns: true if the views intersect, false otherwise
    func isIntersectingCircleToCircleWithView(_ view: UIView) -> Bool {
        return distanceBetween(self.center, view.center) <= (self.frame.width + view.frame.width) / 2.0
    }
    
    /// returns a boolean defining whether
    /// this particular rigidbody intersects with
    /// another rigidbody frame when their colliders are
    /// circular shaped
    /// - Parameters:
    ///     - view: the other RigidBody2D object
    /// - Returns: true if the rigidbodies intersect, false otherwise
    func isIntersectingCircleToCircleWith(_ rigidBody: RigidBody2D) -> Bool {
        return distanceBetween(self.center, rigidBody.center) <= (self.frame.width + rigidBody.frame.width) / 2.0
    }
    
    /// gets the distance between two CGPoints
    /// using the squared distance method
    /// - Parameters:
    ///     - lhs: the first CGPoint
    ///     - rhs: the second CGPoint
    /// - Returns: the distance in CGFloat
    private func distanceBetween(_ lhs: CGPoint, _ rhs: CGPoint) -> CGFloat {
        let xDiff = rhs.x - lhs.x
        let yDiff = rhs.y - lhs.y
        let distanceSquared = pow(xDiff, 2.0) + pow(yDiff, 2.0)
        
        return sqrt(distanceSquared)
        
    }
}
