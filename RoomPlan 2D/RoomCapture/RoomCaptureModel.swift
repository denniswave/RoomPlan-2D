//
//  RoomCaptureModel.swift
//  RoomPlan 2D
//
//  Created by Dennis van Oosten on 24/02/2023.
//

import Foundation
import RoomPlan

class RoomCaptureModel: RoomCaptureViewDelegate {
    
    // Singleton
    static let shared = RoomCaptureModel()
    
    // RoomCapture properties
    let roomCaptureView: RoomCaptureView
    private let captureSessionConfig: RoomCaptureSession.Configuration
    
    // This will store our final scan results
    var finalResults: CapturedRoom?
    
    // Required functions to conform to NSCoding protocol
    func encode(with coder: NSCoder) {
    }
    
    required init?(coder: NSCoder) {
        fatalError("Error when initializing RoomCaptureModel")
    }
    
    // Private initializer. Accessed by shared.
    private init() {
        roomCaptureView = RoomCaptureView(frame: .zero)
        captureSessionConfig = RoomCaptureSession.Configuration()
    }
        
    // Start and stop the capture session. Available from our RoomCaptureScanView.
    func startSession() {
        roomCaptureView.captureSession.run(configuration: captureSessionConfig)
    }
    
    func stopSession() {
        roomCaptureView.captureSession.stop()
    }

    // Decide to post-process and show the final results.
    func captureView(shouldPresent roomDataForProcessing: CapturedRoomData, error: Error?) -> Bool {
        return true
    }
    
    // Access the final post-processed results.
    func captureView(didPresent processedResult: CapturedRoom, error: Error?) {
        finalResults = processedResult
    }
    
}
