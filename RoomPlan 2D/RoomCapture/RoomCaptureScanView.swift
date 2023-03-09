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
                        print("Present 2D floor plan")
                    }
                }
                .buttonStyle(.borderedProminent)
                .padding(.bottom)
            }
        }
        
        // Start the scan session when the view appears
        .onAppear {
            startSession()
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
