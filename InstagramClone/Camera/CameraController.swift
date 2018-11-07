//
//  CameraController.swift
//  InstagramClone
//
//  Created by Mohamed Yousry on 11/6/18.
//  Copyright © 2018 Mohamed Yousry. All rights reserved.
//

import UIKit
import AVFoundation

class CameraController: UIViewController {
    
    let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "forward_arrow_shadow").withRenderingMode(.alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(handleBack), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCaptureSession()
        
        view.addSubview(backButton)
        backButton.anchor(top: view.topAnchor, bottom: nil, left: nil, right: view.rightAnchor, paddingTop: 8, paddingBottom: 0, paddingLeft: 0, paddingRight: 16, width: 50, height: 50)
    }
    
    fileprivate func setupCaptureSession() {
        let captureSession = AVCaptureSession()
        
        // setup inputs
        let captureDevice = AVCaptureDevice.def
        do {
            let input = try AVCaptureDeviceInput(device: captureDevice)
            if captureSession.canAddInput(input) {
                captureSession.addInput(input)
            }
        } catch let err {
            print("Could not setup camera input:", err)
        }
        
        // setup outputs
        let output = AVCapturePhotoOutput()
        if captureSession.canAddOutput(output) {
            captureSession.addOutput(output)
        }
        
        // setup output preview
        let layerPreview = AVCaptureVideoPreviewLayer(session: captureSession)
        layerPreview.frame = view.frame
        view.layer.addSublayer(layerPreview)
        
        captureSession.startRunning()
    }
    
    @objc fileprivate func handleBack() {
       dismiss(animated: true, completion: nil)
    }
    
}
