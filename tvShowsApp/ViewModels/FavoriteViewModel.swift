//
//  FavoriteViewModel.swift
//  tvShowsApp
//
//  Created by Josafat Martínez  on 14/01/21.
//

import Foundation

protocol FavoriteViewModelDelegate: AnyObject {
	func getFavoriteShowsDataFromBackend()
	func saveDataLocaly(whitModel model: ShowDetailModel)
}

class FavoriteViewModel: FavoriteViewModelDelegate {
	var delegate: FavoritesDelegate?
	private var api = ShowsServices()
	private var showsForLocalSave: ShowModelForLocalSave = []
	func getFavoriteShowsDataFromBackend() {
		api.getFavoriteShows { (favorites) in
			self.delegate?.getFavoriteShowData(handelDataFrom: favorites)
		}
	}
	func saveDataLocaly(whitModel model: ShowDetailModel) {
		api.saveDataLocaly(whitModel: model)
	}
}
