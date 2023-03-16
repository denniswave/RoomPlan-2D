//
//  RoomCaptureView.swift
//  RoomPlan 2D
//
//  Created by Dennis van Oosten on 24/02/2023.
//

import SwiftUI
import _SpriteKit_SwiftUI

struct RoomCaptureScanView: View {
    // MARK: - Properties & State
    private let model = RoomCaptureModel.shared
    
    @State private var isScanning = false
    @State private var isShowingFloorPlan = false
    
    // MARK: - View Body
    var body: some View {
        ZStack {
            // The RoomCaptureView
            RoomCaptureRepresentable()
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                // The button changes accoring to the state of isScanning
                Button(isScanning ? "Done" : "View 2D floor plan") {
                    if isScanning {
                        stopSession()
                    } else {
                        isShowingFloorPlan = true
                    }
                }
                .padding()
                .background(Color("AccentColor"))
                .foregroundColor(.white)
                .clipShape(Capsule())
                .fontWeight(.bold)
                .padding(.bottom)
            }
        }
        
        // Start the scan session when the view appears
        .onAppear {
            startSession()
        }
        
        // Show the floor plan in full screen
        .fullScreenCover(isPresented: $isShowingFloorPlan) {
            SpriteView(scene: FloorPlanScene(capturedRoom: model.finalRoom!))
                .ignoresSafeArea()
        }
    }
    
    private func startSession() {
        isScanning = true
        model.startSession()
        
        // Prevent the screen from sleeping
        UIApplication.shared.isIdleTimerDisabled = true
    }
    
    private func stopSession() {
        isScanning = false
        model.stopSession()
        
        // Enable the screen to sleep again
        UIApplication.shared.isIdleTimerDisabled = false
    }
}

struct RoomCaptureScanView_Previews: PreviewProvider {
    static var previews: some View {
        RoomCaptureScanView()
    }
}
