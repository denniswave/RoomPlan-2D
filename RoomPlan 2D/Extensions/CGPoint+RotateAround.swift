//
//  CGPoint+RotateAround.swift
//  RoomPlan 2D
//
//  Created by Dennis van Oosten on 10/03/2023.
//

import CoreGraphics

extension CGPoint {
    
    func rotateAround(point: CGPoint, by angle: CGFloat) -> CGPoint {
        // Translate to origin
        let x1 = self.x - point.x
        let y1 = self.y - point.y
        
        // Apply rotation
        let x2 = x1 * cos(angle) - y1 * sin(angle)
        let y2 = x1 * sin(angle) + y1 * cos(angle)
        
        // Translate back
        let newX = x2 + point.x
        let newY = y2 + point.y
        
        return CGPoint(x: newX, y: newY)
    }
    
}
