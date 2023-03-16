//
//  FloorPlanObject.swift
//  RoomPlan 2D
//
//  Created by Dennis van Oosten on 12/03/2023.
//

import SpriteKit
import RoomPlan

class FloorPlanObject: SKNode {
    
    private let capturedObject: CapturedRoom.Object
    
    // MARK: - Init
    
    init(capturedObject: CapturedRoom.Object) {
        self.capturedObject = capturedObject
        
        super.init()
        
        // Set the object's position using the transform matrix
        let objectPositionX = -CGFloat(capturedObject.transform.position.x) * scalingFactor
        let objectPositionY = CGFloat(capturedObject.transform.position.z) * scalingFactor
        self.position = CGPoint(x: objectPositionX, y: objectPositionY)
        
        // Set the object's zRotation using the transform matrix
        self.zRotation = -CGFloat(capturedObject.transform.eulerAngles.z - capturedObject.transform.eulerAngles.y)
        
        drawObject()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Draw
    
    private func drawObject() {
        // Calculate the object's dimensions
        let objectWidth = CGFloat(capturedObject.dimensions.x) * scalingFactor
        let objectHeight = CGFloat(capturedObject.dimensions.z) * scalingFactor
        
        // Create the object's rectangle
        let objectRect = CGRect(
            x: -objectWidth / 2,
            y: -objectHeight / 2,
            width: objectWidth,
            height: objectHeight
        )
        
        // A shape to fill the object
        let objectShape = SKShapeNode(rect: objectRect)
        objectShape.strokeColor = .clear
        objectShape.fillColor = floorPlanSurfaceColor
        objectShape.alpha = 0.3
        objectShape.zPosition = objectZPosition
        
        // And another shape for the outline
        let objectOutlineShape = SKShapeNode(rect: objectRect)
        objectOutlineShape.strokeColor = floorPlanSurfaceColor
        objectOutlineShape.lineWidth = objectOutlineWidth
        objectOutlineShape.lineJoin = .miter
        objectOutlineShape.zPosition = objectOutlineZPosition
                
        // Add both shapes to the node
        addChild(objectShape)
        addChild(objectOutlineShape)
    }
    
}
