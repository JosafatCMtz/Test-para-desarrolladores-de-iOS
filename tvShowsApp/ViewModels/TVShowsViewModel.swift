//
//  TVShowsViewModel.swift
//  tvShowsApp
//
//  Created by Josafat Martínez  on 13/01/21.
//

import Foundation

protocol TVShowViewModelDelegate: AnyObject {
    func getShowsDataFromBackend()
	func saveDataLocaly(whitModel model: ShowDetailModel)
}

class TVShowViewModel: TVShowViewModelDelegate {
    var delegate: TVShowDelegate?
    private var api = ShowsServices()
    private var showsForLocalSave: ShowModelForLocalSave = []
    func getShowsDataFromBackend() {
        api.getShow { result in
            switch result {
            case let .success(showsResult):
                self.delegate?.getShowData(handelDataFrom: showsResult)
            case let .failure(error):
                self.delegate?.showMessageErrorAlert(alertTitle: errorAlertTitle, alertErrorMessage: error.rawValue)
            }
        }
    }
	func saveDataLocaly(whitModel model: ShowDetailModel) {
		api.saveDataLocaly(whitModel: model)
	}
}
