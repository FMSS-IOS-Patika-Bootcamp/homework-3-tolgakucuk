//
//  PhotoListEntity.swift
//  Homework3
//
//  Created by Tolga on 24.09.2022.
//

import Foundation

struct PhotoCellViewModel {
    var url: String?
}

struct Photo: Decodable {
    var albumId: Int
    var id: Int
    var title: String
    var url: String
    var thumbnailUrl: String
}

