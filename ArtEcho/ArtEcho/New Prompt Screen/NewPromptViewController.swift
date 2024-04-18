//
//  NewPromptViewController.swift
//  ArtEcho
//
//  Created by Pratik Ashok Patil on 17/04/24.
//

import UIKit
import GoogleGenerativeAI
import PhotosUI
import FirebaseAuth
import Firebase
import FirebaseCore
import FirebaseStorage

class NewPromptViewController: UIViewController {
    
    let newPromptView = NewPromptView()
    var pickedImage:UIImage?
    var currentUser: FirebaseAuth.User?
    let database = Firestore.firestore()
    let storage = Storage.storage()
    let childProgressView = BufferSpinnerViewController()
    
    override func loadView() {
        view = newPromptView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add New Prompt"

        //MARK: adding menu to buttonTakePhoto...
        newPromptView.buttonTakePhoto.menu = getMenuImagePicker()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(onSaveBarButtonTapped))
        
        /// Add Hide the keyboard when pressed on side
        ///
        newPromptView.userGetAnswerButton.addTarget(self, action: #selector(getAnswerButtonTapped), for: .touchUpInside)
        
    }
    
    //MARK: action for tapping buttonTakePhoto
    func getMenuImagePicker() -> UIMenu {
        let menuItems = [
            UIAction(title: "Camera", handler: {(_) in
                self.pickUsingCamera()
            }),
            UIAction(title: "Gallery", handler: {(_) in
                self.pickPhotoFromGallery()
            })
        ]
        
        return UIMenu(title: "Select source", children: menuItems)
    }
    
    //MARK: take Photo using Camera...
    func pickUsingCamera(){
        let cameraController = UIImagePickerController()
        cameraController.sourceType = .camera
        cameraController.allowsEditing = true
        cameraController.delegate = self
        present(cameraController, animated: true)
    }
    
    //MARK: pick Photo using Gallery...
    func pickPhotoFromGallery(){
        var configuration = PHPickerConfiguration()
        configuration.filter = PHPickerFilter.any(of: [.images])
        configuration.selectionLimit = 1
        
        let photoPicker = PHPickerViewController(configuration: configuration)
        
        photoPicker.delegate = self /// we are letting the picker to use this screen as delegate????
        present(photoPicker, animated: true, completion: nil)
    }
    
    @objc func getAnswerButtonTapped() {
        Task{
            await printTheOutput()
        }
        showActivityIndicator()
    }
    
    @objc func onSaveBarButtonTapped(){
        Task{
            await saveDataToFirebase()
        }
        showActivityIndicator()
    }

    func printTheOutput() async {
        do {
            let model = GenerativeModel(name: "gemini-1.0-pro-vision-latest", apiKey: APIKey.default)
            guard let prompt = newPromptView.promptTextField.text else {
                print("issues in prompt text field")
                return
            }
            
            guard let image = self.pickedImage else {
                print("issues with input image")
                return
            }
            
            let response = try await model.generateContent(prompt, image)
            if let text = response.text {
                print(text)
                self.hideActivityIndicator()
                newPromptView.AnswerLabel.text = text
            }
        } catch {
            print("error in call")
        }
    }
}


//MARK: adopting required protocols for PHPicker...
extension NewPromptViewController:PHPickerViewControllerDelegate{
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        dismiss(animated: true)
        
        print(results)
        
        let itemprovider = results.map(\.itemProvider)
        
        for item in itemprovider{
            if item.canLoadObject(ofClass: UIImage.self){
                item.loadObject(ofClass: UIImage.self, completionHandler: { (image, error) in
                    DispatchQueue.main.async{
                        if let uwImage = image as? UIImage{
                            self.newPromptView.buttonTakePhoto.setImage(
                                uwImage.withRenderingMode(.alwaysOriginal),
                                for: .normal
                            )
                            self.pickedImage = uwImage
                        }
                    }
                })
            }
        }
    }
}


    



//MARK: adopting required protocols for UIImagePicker...
extension NewPromptViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        
        if let image = info[.editedImage] as? UIImage{
            self.newPromptView.buttonTakePhoto.setImage(
                image.withRenderingMode(.alwaysOriginal),
                for: .normal
            )
            self.pickedImage = image
        }else{
            self.newPromptView.buttonTakePhoto.setImage(UIImage(systemName: "person.fill"), for: .normal)
            self.newPromptView.buttonTakePhoto.tintColor = .black
            self.pickedImage = UIImage(systemName: "person.fill")
        }
    }
}
