//
//  chat.swift
//  ArtEcho
//
//  Created by Pratik Ashok Patil on 13/04/24.
//

import Foundation
import FirebaseFirestoreSwift
import FirebaseFirestore

struct Chat: Codable {
    @DocumentID var id: String?
    var imageUrl: String
    var prompt: String
    var answer: String
    var savedtime: Date
}
