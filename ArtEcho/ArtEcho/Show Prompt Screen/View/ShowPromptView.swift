//
//  ShowPromptView.swift
//  ArtEcho
//
//  Created by Pratik Ashok Patil on 05/04/24.
//

import UIKit

class ShowPromptView: UIView {
    // Fields in the Create Profile View
    var artNameTextField: UITextField!
    var buttonTakePhoto: UIButton!
    var photoLabel: UILabel!
    var placeTextField: UITextField!
    var promptTextField: UITextField!
    var resultTextLabel: UILabel!
    var userSaveButton: UIButton!
    var userDiscardButton: UIButton!
    var userRetryButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //MARK: set the background color...
        self.backgroundColor = .white
        
        //MARK: initializing the UI elements and constraints...
        setupArtNameTextField()
        setupButtonTakePhoto()
        setupPhotoLabel()
        setupPlaceTextField()
        setupPromptTextField()
        setupResultTextLabel()
        setupUserSaveButton()
        setupDiscardSaveButton()
        setupRetrySaveButton()
        
        initConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: initializing the UI elements...
    func setupArtNameTextField(){
        artNameTextField = UITextField()
        artNameTextField.placeholder = "Art Name"
        // Assuming `textField` is your UITextField instance
        artNameTextField.layer.borderWidth = 1.0 // Set the border width
        artNameTextField.layer.borderColor = UIColor.gray.cgColor // Set the border color
        artNameTextField.layer.cornerRadius = 5.0 // Optional: if you want rounded corners
        artNameTextField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(artNameTextField)
    }
    func setupButtonTakePhoto() {
        buttonTakePhoto = UIButton(type: .system)
        buttonTakePhoto.setTitle("", for: .normal)
        buttonTakePhoto.setImage(UIImage(systemName: "camera.fill"), for: .normal)
        buttonTakePhoto.tintColor = .black
        buttonTakePhoto.contentHorizontalAlignment = .fill
        buttonTakePhoto.contentVerticalAlignment = .fill
        buttonTakePhoto.imageView?.contentMode = .scaleAspectFit
        buttonTakePhoto.showsMenuAsPrimaryAction = true
        buttonTakePhoto.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonTakePhoto)
    }
    func setupPhotoLabel() {
        photoLabel = UILabel()
        photoLabel.text = "Photo"
        photoLabel.translatesAutoresizingMaskIntoConstraints = false
        photoLabel.font = UIFont.systemFont(ofSize: 20)
        photoLabel.textColor = UIColor.lightGray
        self.addSubview(photoLabel)
    }
    func setupPlaceTextField(){
        placeTextField = UITextField()
        placeTextField.placeholder = "place"
        // Assuming `textField` is your UITextField instance
        placeTextField.layer.borderWidth = 1.0 // Set the border width
        placeTextField.layer.borderColor = UIColor.gray.cgColor // Set the border color
        placeTextField.layer.cornerRadius = 5.0 // Optional: if you want rounded corners
        placeTextField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(placeTextField)
    }
    func setupPromptTextField(){
        promptTextField = UITextField()
        promptTextField.placeholder = "Question"
        // Assuming `textField` is your UITextField instance
        promptTextField.layer.borderWidth = 1.0 // Set the border width
        promptTextField.layer.borderColor = UIColor.gray.cgColor // Set the border color
        promptTextField.layer.cornerRadius = 5.0 // Optional: if you want rounded corners
        promptTextField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(promptTextField)
    }
    
    func setupResultTextLabel(){
        resultTextLabel = UILabel()
        resultTextLabel.font = UIFont.boldSystemFont(ofSize: 16)
        resultTextLabel.numberOfLines = 0
        resultTextLabel.lineBreakMode = .byWordWrapping
        resultTextLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(resultTextLabel)
    }
    
    func setupUserSaveButton() {
        userSaveButton = UIButton(type: .system)
        userSaveButton.setTitle("Save", for: .normal)
        userSaveButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(userSaveButton)
    }
    func setupDiscardSaveButton() {
        userDiscardButton = UIButton(type: .system)
        userDiscardButton.setTitle("Discard", for: .normal)
        userDiscardButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(userDiscardButton)
    }
    func setupRetrySaveButton() {
        userRetryButton = UIButton(type: .system)
        userRetryButton.setTitle("Retry", for: .normal)
        userRetryButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(userRetryButton)
    }
    
    //MARK: initializing constraints...
    func initConstraints(){
        NSLayoutConstraint.activate([
            artNameTextField.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 32),
            artNameTextField.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            artNameTextField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant:16),
            artNameTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            buttonTakePhoto.topAnchor.constraint(equalTo: artNameTextField.bottomAnchor, constant: 16),
            buttonTakePhoto.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            buttonTakePhoto.widthAnchor.constraint(equalToConstant: 100),
            buttonTakePhoto.heightAnchor.constraint(equalToConstant: 100),

            photoLabel.topAnchor.constraint(equalTo: buttonTakePhoto.bottomAnchor, constant: 0),
            photoLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            placeTextField.topAnchor.constraint(equalTo: photoLabel.bottomAnchor, constant: 16),
            placeTextField.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            placeTextField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant:16),
            placeTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            promptTextField.topAnchor.constraint(equalTo: placeTextField.bottomAnchor, constant: 16),
            promptTextField.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            promptTextField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant:16),
            promptTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -100),
            
            resultTextLabel.topAnchor.constraint(equalTo: placeTextField.bottomAnchor, constant: 16),
            resultTextLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            resultTextLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant:16),
            resultTextLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -100),
            
            userSaveButton.topAnchor.constraint(equalTo: resultTextLabel.bottomAnchor, constant: 40),
            userSaveButton.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            userDiscardButton.topAnchor.constraint(equalTo: userSaveButton.bottomAnchor, constant: 40),
            userDiscardButton.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            userRetryButton.topAnchor.constraint(equalTo: userDiscardButton.bottomAnchor, constant: 40),
            userRetryButton.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
        ])
    }
    
}
