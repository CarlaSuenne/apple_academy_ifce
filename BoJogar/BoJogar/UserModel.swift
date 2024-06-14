//
//  EventCardModel.swift
//  BoJogar
//
//  Created by found on 30/04/24.
//
import Foundation
import SwiftUI

struct UserModel:  Codable, Identifiable, Hashable  {
    var id: String
    var username: String
    var email: String
    var firstName: String
    var lastName: String
    var bio: String
    var imageURL: String 
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(email)
    }
}


