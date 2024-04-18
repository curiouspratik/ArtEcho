//
//  InputVerification.swift
//  ArtEcho
//
//  Created by Pratik Ashok Patil on 13/04/24.
//

import UIKit
import Foundation
// verification code for email, password and name
public func showEmptyAlert(field: String) -> UIAlertController{
    let alert = UIAlertController(
        title: "Error!", message: "Text field - \(field) can not be empty!",
        preferredStyle: .alert
    )
    
    alert.addAction(UIAlertAction(title: "OK", style: .default))
    return alert
}

public func showEmailError() -> UIAlertController{
    let alert = UIAlertController(
        title: "Error!", message: "Email is invalid!",
        preferredStyle: .alert
    )
    
    alert.addAction(UIAlertAction(title: "OK", style: .default))
    return alert
}

public func isValidEmail(_ email: String) -> Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

    let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailPred.evaluate(with: email)
}

public func isValidPassword(_ password: String, _ confirmPassword: String) -> Bool {
    return password == confirmPassword
}

public func showPasswordError() -> UIAlertController{
    let alert = UIAlertController(
        title: "Error!", message: "Passwords should match!",
        preferredStyle: .alert
    )
    
    alert.addAction(UIAlertAction(title: "OK", style: .default))
    return alert
}

public func showPasswordLengthError() -> UIAlertController{
    let alert = UIAlertController(
        title: "Error!", message: "Passwords should be at least 6 characters long!",
        preferredStyle: .alert
    )
    
    alert.addAction(UIAlertAction(title: "OK", style: .default))
    return alert
}


public func showRecheckAlert() -> UIAlertController{
    let alert = UIAlertController(
        title: "Error!", message: "Please recheck the information",
        preferredStyle: .alert
    )
    
    alert.addAction(UIAlertAction(title: "OK", style: .default))
    return alert
}


public func showCustomAlert(message: String) -> UIAlertController{
    let alert = UIAlertController(
        title: "Error!", message: "\(message)",
        preferredStyle: .alert
    )
    
    alert.addAction(UIAlertAction(title: "OK", style: .default))
    return alert
}
