//
//  RoomCaptureView.swift
//  RoomPlan 2D
//
//  Created by Dennis van Oosten on 24/02/2023.
//

import SwiftUI

struct RoomCaptureScanView: View {
    // MARK: - Environment
    @Environment(\.dismiss) var dismiss
    
    // MARK: - Properties & State
    private var model = RoomCaptureModel.shared
    
    @State private var isScanning = false
    
    // MARK: - View Body
    var body: some View {
        NavigationStack {
            ZStack {
                // The RoomCaptureView
                RoomCaptureRepresentable()
                    .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    
                    // The button changes accoring to the state of isScanning
                    Button(isScanning ? "Done" : "View 2D Map") {
                        if isScanning {
                            stopSession()
                        } else {
                            print("Present 2D Map")
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
