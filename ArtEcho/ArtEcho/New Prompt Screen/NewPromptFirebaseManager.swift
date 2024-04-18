//
//  NewPromptFirebaseManager.swift
//  ArtEcho
//
//  Created by Pratik Ashok Patil on 17/04/24.
//

import Foundation

import UIKit
import GoogleGenerativeAI
import PhotosUI
import FirebaseAuth
import Firebase
import FirebaseCore
import FirebaseStorage

extension NewPromptViewController {
    func saveDataToFirebase() async {
        var profilePhotoURL:URL?
        
        //MARK: Upload the profile photo if there is any...
        if let image = pickedImage{
            if let jpegData = image.jpegData(compressionQuality: 80){
                let storageRef = storage.reference()
                let imagesRepo = storageRef.child("imagesChats")
                let imageRef = imagesRepo.child("\(NSUUID().uuidString).jpg")
                
                _ = imageRef.putData(jpegData, completion: {(metadata, error) in
                    if error == nil{
                        imageRef.downloadURL(completion: {(url, error) in
                            if error == nil{
                                profilePhotoURL = url
                                self.registerChat(photoURL: profilePhotoURL)
                            }
                        })
                    }
                })
            }
        }else{
            registerChat(photoURL: profilePhotoURL)
        }
    }
    
    func registerChat(photoURL: URL?){
        guard let imageUrl = photoURL else {
            self.hideActivityIndicator()
            return
        }
        guard let prompt = newPromptView.promptTextField.text else {
            self.hideActivityIndicator()
            return
        }
        guard let answer = newPromptView.AnswerLabel.text else {
            self.hideActivityIndicator()
            return
        }
        
        if prompt == ""{
            self.present(showEmptyAlert(field: "prompt"), animated: true)
            self.hideActivityIndicator()
            return
        }
        if answer == ""{
            self.present(showEmptyAlert(field: "answer"), animated: true)
            self.hideActivityIndicator()
            return
        }
        
        saveChatToFireStore(imageURL: imageUrl, prompt: prompt, answer: answer)
    }
    
    //MARK: logic to add a contact to Firestore...
    func saveChatToFireStore(imageURL: URL, prompt: String, answer: String){
        if let userEmail = currentUser!.email {
            let collectionChats = database
                .collection("users")
                .document(userEmail)
                .collection("chats")
            
//            self.showActivityIndicator()
            
            do {
                try collectionChats.addDocument(data: [
                    "imageURL": imageURL.absoluteString,
                    "prompt": prompt,
                    "answer": answer,
                    "savedtime": FieldValue.serverTimestamp()
                  ])  { error in
                      if error == nil {
                          self.hideActivityIndicator()
                          self.navigationController?.popViewController(animated: true)
                      }
                  }
            } catch {
                self.hideActivityIndicator()
                self.present(showCustomAlert(message: "Error while saving data, please check the internet connection."), animated: true)
            }
            
            
        }
        
    }
}

