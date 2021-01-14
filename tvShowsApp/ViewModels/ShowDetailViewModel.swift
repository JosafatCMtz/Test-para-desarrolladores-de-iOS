//
//  ShowDetailViewModel.swift
//  tvShowsApp
//
//  Created by Josafat Martínez  on 12/01/21.
//

import Foundation

protocol ShowDetailViewModelDelegate: AnyObject {
    func getShowDetal()
}

class ShowDetailViewModel: ShowDetailViewModelDelegate {
    var delegate: ShowDetailDelegate?
    private var api: ShowsServices = ShowsServices()
    func getShowDetal() {
    }
}
