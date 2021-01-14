//
//  ShowDetailModel.swift
//  tvShowsApp
//
//  Created by Josafat Martínez  on 12/01/21.
//

import Foundation
import RealmSwift

class ShowDetailModel: Object {
    @objc dynamic var uuid: String = ""
    @objc dynamic var imageUrlStirng: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var officialSite: String = ""
    @objc dynamic var network: String = ""
    @objc dynamic var lenguage: String = ""
    @objc dynamic var summary: String = ""
    @objc dynamic var isFavorite: Bool = false
}

typealias ShowModelForLocalSave = [ShowDetailModel]
