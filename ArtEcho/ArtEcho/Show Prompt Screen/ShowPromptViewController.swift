//
//  ShowPromptViewController.swift
//  ArtEcho
//
//  Created by Pratik Ashok Patil on 17/04/24.
//

import UIKit
import SDWebImage

class ShowPromptViewController: UIViewController {
    
    let showPromptScreen = ShowPromptView()
    
    override func loadView() {
        view = showPromptScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "View Prompt"
    }
    
    func config(answer: String, prompt: String, imageURL: String){
        showPromptScreen.AnswerLabel.text = answer
        showPromptScreen.promptLabel.text = prompt
        DispatchQueue.main.async {
            self.showPromptScreen.selectedPhoto.sd_setImage(with: URL(string: imageURL))
        }
    }

}
