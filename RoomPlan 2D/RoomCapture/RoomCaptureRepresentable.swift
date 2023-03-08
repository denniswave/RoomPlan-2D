//
//  RoomCaptureRepresentable.swift
//  RoomPlan 2D
//
//  Created by Dennis van Oosten on 24/02/2023.
//

import RoomPlan
import SwiftUI

struct RoomCaptureRepresentable: UIViewRepresentable {
        
    func makeUIView(context: Context) -> RoomCaptureView {
        return RoomCaptureModel.shared.roomCaptureView
    }
    
    func updateUIView(_ uiView: RoomCaptureView, context: Context) {
    }
    
}
