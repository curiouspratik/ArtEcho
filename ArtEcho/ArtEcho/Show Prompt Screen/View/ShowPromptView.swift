//
//  ShowPromptView.swift
//  ArtEcho
//
//  Created by Pratik Ashok Patil on 05/04/24.
//

import UIKit

class ShowPromptView: UIView {
    // Fields in the Create Profile View
    var contentWrapper:UIScrollView!
    var selectedPhoto: UIImageView!
    var promptLabel: UILabel!
    var AnswerLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //MARK: set the background color...
        self.backgroundColor = .white
        
        //MARK: initializing the UI elements and constraints...
        setupContentWrapper()
        setupSelectedPhoto()
        setupPromptLabel()
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
    
    func setupSelectedPhoto() {
        selectedPhoto = UIImageView()
        selectedPhoto.image = UIImage(systemName: "camera.fill")?.withRenderingMode(.alwaysOriginal)
        selectedPhoto.contentMode = .scaleAspectFit
        selectedPhoto.clipsToBounds = true
        selectedPhoto.layer.masksToBounds = true
        selectedPhoto.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(selectedPhoto)
    }
    
    func setupPromptLabel(){
        promptLabel = UILabel()
        promptLabel.textAlignment = .center
        promptLabel.text = "Prompt"
        promptLabel.numberOfLines = 0
        promptLabel.tintColor = .systemGray
        promptLabel.font = UIFont.boldSystemFont(ofSize: 14)
        promptLabel.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(promptLabel)
    }
    
    func setupAnswerLabel(){
        AnswerLabel = UILabel()
        AnswerLabel.textAlignment = .center
        AnswerLabel.text = "Answer"
        AnswerLabel.numberOfLines = 0
        AnswerLabel.font = UIFont.boldSystemFont(ofSize: 18)
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

            selectedPhoto.topAnchor.constraint(equalTo: contentWrapper.topAnchor, constant: 15),
            selectedPhoto.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            selectedPhoto.widthAnchor.constraint(equalToConstant: 100),
            selectedPhoto.heightAnchor.constraint(equalToConstant: 100),

            promptLabel.topAnchor.constraint(equalTo: selectedPhoto.bottomAnchor, constant: 20),
            promptLabel.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor, constant: 50),
            promptLabel.trailingAnchor.constraint(equalTo: contentWrapper.trailingAnchor, constant: -20),
            promptLabel.widthAnchor.constraint(equalToConstant: 300),
            
            AnswerLabel.topAnchor.constraint(equalTo: promptLabel.bottomAnchor, constant: 20),
            AnswerLabel.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor, constant: 50),
            AnswerLabel.trailingAnchor.constraint(equalTo: contentWrapper.trailingAnchor, constant: -20),
            AnswerLabel.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
    
}
