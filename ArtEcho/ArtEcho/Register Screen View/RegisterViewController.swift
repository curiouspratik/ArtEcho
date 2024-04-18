////
////  RegisterViewController.swift
////  ArtEcho
////
////  Created by Pratik Ashok Patil on 13/04/24.
////

import UIKit
import FirebaseAuth
import FirebaseFirestore
import PhotosUI
import FirebaseStorage

class RegisterViewController: UIViewController {

    let registerView = RegisterView()
    var pickedImage: UIImage?
    let storage = Storage.storage()
    let database = Firestore.firestore()
    let childProgressView = BufferSpinnerViewController()
    
    override func loadView() {
        view = registerView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        registerView.buttonRegister.addTarget(self, action: #selector(onRegisterTapped), for: .touchUpInside)
        title = "Register"
    }
    
    @objc func onRegisterTapped(){
        //MARK: creating a new user on Firebase...
        showActivityIndicator()
        registerNewAccount()
    }
    
    
}
