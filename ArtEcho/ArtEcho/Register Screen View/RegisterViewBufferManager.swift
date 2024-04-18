//
//  RegisterViewBufferManager.swift
//  ArtEcho
//
//  Created by Pratik Ashok Patil on 17/04/24.
//

import Foundation

extension RegisterViewController: BufferSpinnerProtocol {
    func showActivityIndicator(){
        addChild(childProgressView)
        view.addSubview(childProgressView.view)
        childProgressView.didMove(toParent: self)
    }
    
    func hideActivityIndicator(){
        childProgressView.willMove(toParent: nil)
        childProgressView.view.removeFromSuperview()
        childProgressView.removeFromParent()
    }
}

