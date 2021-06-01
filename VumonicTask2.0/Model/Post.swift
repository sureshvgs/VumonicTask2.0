//
//  Post.swift
//  VumonicTask2.0
//
//  Created by Suresh Swaminathan on 01/06/21.
//

import Foundation

struct Post {
 let user: User
    let imageUrl: String
    let caption: String
    let creationDate: Date
    var likes: Int = 0
    var likedByCurrentUser = false
    
    init(user: User, imageUrl: String,caption: String,creationDate: Date) {
        self.user = user
        self.imageUrl = imageUrl
        self.caption = caption
        self.creationDate = creationDate
    }
}
