//
//  ShowDetailModel.swift
//  tvShowsApp
//
//  Created by Josafat Martínez  on 12/01/21.
//

import Foundation

class ShowDetailModel: NSObject {
    @objc dynamic var imageUrlStirng: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var officialSite: String = ""
    @objc dynamic var network: String = ""
    @objc dynamic var lenguage: String = ""
    @objc dynamic var summary: String = ""
    @objc dynamic var isFavorite: Bool = false

    init(imageUrlStirng: String, name: String, officialSite: String, network: String, lenguage: String, summary: String, isFavorite: Bool = false) {
        self.imageUrlStirng = imageUrlStirng
        self.name = name
        self.officialSite = officialSite
        self.network = network
        self.lenguage = lenguage
        self.summary = summary
        self.isFavorite = isFavorite
    }
}

typealias ShowModelForLocalSave = [ShowDetailModel]
