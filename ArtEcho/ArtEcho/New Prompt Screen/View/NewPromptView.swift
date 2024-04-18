//
//  NewPromptView.swift
//  ArtEcho
//
//  Created by Pratik Ashok Patil on 05/04/24.
//

import UIKit

class NewPromptView: UIView {
    // Fields in the Create Profile View
    var contentWrapper:UIScrollView!
    var buttonTakePhoto: UIButton!
    var photoLabel: UILabel!
    var promptTextField: UITextView!
    var userGetAnswerButton: UIButton!
    var AnswerLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //MARK: set the background color...
        self.backgroundColor = .white
        
        //MARK: initializing the UI elements and constraints...
        setupContentWrapper()
        setupButtonTakePhoto()
        setupPhotoLabel()
        setupPromptTextField()
        setupUserGetAnswerButton()
        setupAnswerLabel()
        
        initConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: initializing the UI elements...
    func setupContentWrapper(){
        contentWrapper = UIScrollView()
        contentWrapper.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(contentWrapper)
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
        contentWrapper.addSubview(buttonTakePhoto)
    }
    func setupPhotoLabel() {
        photoLabel = UILabel()
        photoLabel.text = "Photo"
        photoLabel.translatesAutoresizingMaskIntoConstraints = false
        photoLabel.font = UIFont.systemFont(ofSize: 20)
        photoLabel.textColor = UIColor.lightGray
        contentWrapper.addSubview(photoLabel)
    }
    func setupPromptTextField(){
        promptTextField = UITextView()
        promptTextField.layer.borderWidth = 1.5 // Set border width
        promptTextField.layer.cornerRadius = 5.0 // Set corner radius for rounded corners
        promptTextField.isEditable = true
        promptTextField.isSelectable = true
        promptTextField.textContainerInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        promptTextField.font = UIFont.systemFont(ofSize: 17.0)
        promptTextField.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(promptTextField)
    }
    func setupUserGetAnswerButton() {
        userGetAnswerButton = UIButton(type: .system)
        userGetAnswerButton.setTitle("Confirm", for: .normal)
        userGetAnswerButton.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(userGetAnswerButton)
    }
    func setupAnswerLabel(){
        AnswerLabel = UILabel()
        AnswerLabel.textAlignment = .center
        AnswerLabel.text = "Press Confirm Button to get the Answer"
        AnswerLabel.numberOfLines = 0
        AnswerLabel.font = UIFont.boldSystemFont(ofSize: 14)
        AnswerLabel.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(AnswerLabel)
    }
    
    //MARK: initializing constraints...
    func initConstraints(){
        NSLayoutConstraint.activate([
            /// Add content wrapper for scrolling
            contentWrapper.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            contentWrapper.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            contentWrapper.widthAnchor.constraint(equalTo:self.safeAreaLayoutGuide.widthAnchor),
            contentWrapper.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor),

            buttonTakePhoto.topAnchor.constraint(equalTo: contentWrapper.topAnchor, constant: 15),
            buttonTakePhoto.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            buttonTakePhoto.widthAnchor.constraint(equalToConstant: 100),
            buttonTakePhoto.heightAnchor.constraint(equalToConstant: 100),

            photoLabel.topAnchor.constraint(equalTo: buttonTakePhoto.bottomAnchor, constant: 0),
            photoLabel.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),

            promptTextField.centerXAnchor.constraint(equalTo: contentWrapper.safeAreaLayoutGuide.centerXAnchor),
            promptTextField.topAnchor.constraint(equalTo: photoLabel.bottomAnchor, constant: 16),
            promptTextField.leadingAnchor.constraint(equalTo: contentWrapper.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            promptTextField.trailingAnchor.constraint(equalTo: contentWrapper.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            promptTextField.heightAnchor.constraint(equalToConstant: 200),

            userGetAnswerButton.topAnchor.constraint(equalTo: promptTextField.bottomAnchor, constant: 20),
            userGetAnswerButton.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            AnswerLabel.topAnchor.constraint(equalTo: userGetAnswerButton.bottomAnchor, constant: 20),
            AnswerLabel.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor, constant: 50),
            AnswerLabel.trailingAnchor.constraint(equalTo: contentWrapper.trailingAnchor, constant: -20),
            AnswerLabel.widthAnchor.constraint(equalToConstant: 300)

        ])
    }
    
}


///
/// Things to do -
/// Change NewPromptView
/// Add few lines
/// Use Delegate pattern to pass values to next screen - after you get the reply from Google
/// Well I can Hide the keyboard and show the results as a text of label in new prompt view itself
/// no need get more hopping between views and all
/// Make that decision
/// add the gemini code
/// then add saving code to firebase firestore and storage
/// Populate the main screen using code from TacoMedia
/// test the app
/// Add all the error messages and alerts
///
/// Give me information about boston in 20 words
