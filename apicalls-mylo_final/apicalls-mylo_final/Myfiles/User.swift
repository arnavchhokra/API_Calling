//
//  User.swift
//  apicalls-mylo_final
//
//  Created by Arnav on 03/02/22.
//

import Foundation
struct UserResult : Decodable{
    let results: [User]
    
    
}

struct User: Decodable{
    let name: Name
    let email: String
    let dob: Dob
    let phone: String
    
}

struct Name: Decodable
{
    var first: String
    var last: String
}

struct Dob: Decodable
{
    var age: Int
    var date: String
}
