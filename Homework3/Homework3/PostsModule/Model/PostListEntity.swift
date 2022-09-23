//
//  PostListEntity.swift
//  Homework3
//
//  Created by Tolga on 23.09.2022.
//

import Foundation

struct PostCellViewModel {
    var title: String?
    var desc: String?
}

struct Post: Decodable {
    var userId: Int
    var id: Int
    var title: String
    var body: String
}
