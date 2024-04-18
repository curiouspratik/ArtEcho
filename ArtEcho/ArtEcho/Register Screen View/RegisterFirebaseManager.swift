////
////  RegisterFirebaseManager.swift
////  ArtEcho
////
////  Created by Pratik Ashok Patil on 13/04/24.
////


import Foundation
import FirebaseAuth


extension RegisterViewController{
    
    func registerNewAccount(){
        //MARK: create a Firebase user with email and password...
        if let name = registerView.textFieldName.text,
           let email = registerView.textFieldEmail.text,
           let password = registerView.textFieldPassword.text,
           let confirmPassword = registerView.textFieldConfirmPassword.text{
            //Validations....
            if name == "" {
                self.present(showEmptyAlert(field: "name"), animated: true)
                return
            }
            if email == "" {
                self.present(showEmptyAlert(field: "email"), animated: true)
                return
            }
            if password == "" {
                self.present(showEmptyAlert(field: "password"), animated: true)
                return
            }
            if confirmPassword == "" {
                self.present(showEmptyAlert(field: "confirm password"), animated: true)
                return
            }
            if !isValidEmail(email){
                self.present(showEmailError(), animated: true)
                return
            }
            if !isValidPassword(password, confirmPassword){
                self.present(showPasswordError(), animated: true)
                return
            }
            if password.count < 6 {
                self.present(showPasswordLengthError(), animated: true)
                return
            }
            
            Auth.auth().createUser(withEmail: email, password: password, completion: {result, error in
                if error == nil{
                    //MARK: the user creation is successful...
                    self.setNameOfTheUserInFirebaseAuth(name: name)
                }else{
                    // here I can send some error from the API
                    print(error!)
                }
            })
        } else {
            if registerView.textFieldName.text == nil {
                self.present(showEmptyAlert(field: "name"), animated: true)
                return
            }
            if registerView.textFieldEmail.text == nil {
                self.present(showEmptyAlert(field: "email"), animated: true)
                return
            }
            if registerView.textFieldPassword.text == nil {
                self.present(showEmptyAlert(field: "password"), animated: true)
                return
            }
            if registerView.textFieldConfirmPassword.text == nil {
                self.present(showEmptyAlert(field: "confirm password"), animated: true)
                return
            }
        }
    }
    
    //MARK: We set the name of the user after we create the account...
    func setNameOfTheUserInFirebaseAuth(name: String){
        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
        changeRequest?.displayName = name
        changeRequest?.commitChanges(completion: {(error) in
            if error == nil{
                //MARK: the profile update is successful...
                self.saveUserToFireStore()
            }else{
                //MARK: there was an error updating the profile...
                print("Error occured: \(String(describing: error))")
            }
        })
    }
    
    func saveUserToFireStore(){
        if let userEmail = Auth.auth().currentUser?.email,
           let userName = Auth.auth().currentUser?.displayName {
            database.collection("users").document(userEmail).setData([
                "name": userName,
                "email": userEmail
            ])
            self.hideActivityIndicator()
            self.navigationController?.popViewController(animated: true)
        }
    }
}

