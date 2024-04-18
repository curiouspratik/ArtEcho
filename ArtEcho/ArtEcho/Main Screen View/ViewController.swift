//
//  ViewController.swift
//  ArtEcho
//
//  Created by Pratik Ashok Patil on 05/04/24.
//

import Foundation
import UIKit
import FirebaseAuth
import FirebaseFirestore
import SDWebImage

class ViewController: UIViewController {

    let mainScreen = MainScreenView()
    
    var chats = [Chat]()
    
    //authentication code
    var handleAuth: AuthStateDidChangeListenerHandle?
    var currentUser: FirebaseAuth.User?
    
    let database = Firestore.firestore()
    
    override func loadView() {
        view = mainScreen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        handleAuth = Auth.auth().addStateDidChangeListener({ auth, user in
            if user == nil {
                //MARK: not signed in
                self.currentUser = nil
                self.mainScreen.labelText.text = "Please sign in to see the Chats!"
                self.mainScreen.floatingButtonAddChat.isEnabled = false
                self.mainScreen.floatingButtonAddChat.isHidden = true
                //MARK: Reset table view
                self.chats.removeAll()
                self.mainScreen.tableViewChats.reloadData()
                //MARK: Sign in bar button
                self.setupRightBarButton(isLoggedin: false)
            } else {
                //MARK: user is signed in
                self.currentUser = user
                self.mainScreen.labelText.text = "Welcome \(user?.displayName ?? "Anonymous")!"
                self.mainScreen.floatingButtonAddChat.isEnabled = true
                self.mainScreen.floatingButtonAddChat.isHidden = false
                //MARK: logout bar button
                self.setupRightBarButton(isLoggedin: true)

                //MARK: Observe Firestore databse to display the contacts list
                self.database.collection("users")
                    .document((self.currentUser?.email)!)
                    .collection("chats")
                    .addSnapshotListener(includeMetadataChanges: false) { querySnapshot, error in
                        if let documents = querySnapshot?.documents {
                            self.chats.removeAll()
                            for document in documents{
                                do {
                                    let imageUrl = document.data()["imageURL"]
                                    let prompt = document.data()["prompt"]
                                    let answer = document.data()["answer"]
                                    var savedtime = Date.now
                                    if let timestamp = document.data()["savedtime"] as? Timestamp {
                                        savedtime = timestamp.dateValue()
                                        // ... use your savedtime here
                                    } else {
                                        // Handle the case where "savedtime" is not a Timestamp
                                        savedtime = Date.now
                                    }
                                    let chat = Chat(imageUrl: imageUrl as! String, prompt: prompt as! String, answer: answer as! String, savedtime: savedtime)
                                    self.chats.append(chat)
                                } catch {
                                    print(error)
                                }
                            }
                            print(self.chats.count)
                            self.chats.sort(by: {$0.savedtime > $1.savedtime})
                            self.mainScreen.tableViewChats.reloadData()
                        }
                    }
                
            }
            
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Art Echo"
        
        //MARK: Make the titles look large...
        navigationController?.navigationBar.prefersLargeTitles = true
        
        //MARK: Put the floating button above all the views...
        view.bringSubviewToFront(mainScreen.floatingButtonAddChat)
        
        mainScreen.tableViewChats.delegate = self
        mainScreen.tableViewChats.dataSource = self
        
        // this following line removes the line in between the cells of the table
        mainScreen.tableViewChats.separatorStyle = .none
        
        mainScreen.floatingButtonAddChat.addTarget(self, action: #selector(addChatButtonTapped), for: .touchUpInside)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        Auth.auth().removeStateDidChangeListener(handleAuth!)
    }
    
    @objc func addChatButtonTapped() {
        let newPromptVC = NewPromptViewController()
        newPromptVC.currentUser = self.currentUser
        navigationController?.pushViewController(newPromptVC, animated: true)
    }
    
}



extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chats.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Configs.favouritesTableViewCellID, for: indexPath) as! FavouritesTableViewCell
        DispatchQueue.main.async {
            cell.imagePhoto.sd_setImage(with: URL(string: self.chats[indexPath.row].imageUrl), completed: nil)
        }
        cell.labelAnswer.text = self.chats[indexPath.row].answer
        cell.labelPrompt.text = self.chats[indexPath.row].prompt
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let showPromptVC = ShowPromptViewController()
        showPromptVC.config(answer: self.chats[indexPath.row].answer, prompt: self.chats[indexPath.row].prompt, imageURL: self.chats[indexPath.row].imageUrl)
        navigationController?.pushViewController(showPromptVC, animated: true)
    }
}
