//
//  TVShowsViewModel.swift
//  tvShowsApp
//
//  Created by Josafat Martínez  on 13/01/21.
//

import Foundation

protocol TVShowViewModelDelegate: AnyObject {
    func getShowsDataFromBackend()
}

class TVShowViewModel: TVShowViewModelDelegate {
    var delegate: TVShowDelegate?
    private var api = ShowsServices()
    func getShowsDataFromBackend() {
        api.getShow { result in
            switch result {
            case let .success(shows):
                self.delegate?.getShowData(handelDataFrom: shows)
            case let .failure(error):
                self.delegate?.showMessageErrorAlert(alertTitle: errorAlertTitle, alertErrorMessage: error.rawValue)
            }
        }
    }
}
