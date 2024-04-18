//
//  HashingFunction.swift
//  ArtEcho
//
//  Created by Pratik Ashok Patil on 13/04/24.
//

import Foundation
import CryptoKit

class HashingFunction{
    static func getHash(firstEmail: String, secondEmail: String) -> String{
        var finalEmail: String
        if firstEmail < secondEmail {
            finalEmail =  firstEmail + secondEmail
          } else {
            finalEmail = secondEmail + firstEmail
          }
        let hashed = SHA256.hash(data: finalEmail.data(using: .utf8)!)
        return hashed.compactMap { String(format: "%02x", $0) }.joined()
    }
}
