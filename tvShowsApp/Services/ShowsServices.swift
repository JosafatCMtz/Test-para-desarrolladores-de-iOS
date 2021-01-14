//
//  ShowsServices.swift
//  tvShowsApp
//
//  Created by Josafat Martínez  on 11/01/21.
//

import Foundation
import RealmSwift

enum Result<Success, Failure: Error> {
    case success(Success)
    case failure(Failure)
}

enum ErrorMessage: String, Error {
    case errorWhenMarkingOrDeletingIt = "Hubo un problema al guardar/borrar este show de TV. ¿Quieres intentar nuevamente?"
    case connectionError = "Ocurrió un error al consultar el servicio. ¿Quieres intentar nuevamente?"
}

class ShowsServices: NSObject {
    let realm = try! Realm()
    private let endpoint: EndPointUrl = .shows

    fileprivate func getDataFromLocalStorage() {
        let showsLocal = realm.objects(ShowDetailModel.self)
        for show in showsLocal {
            debugPrint(show.name)
        }
    }

    func saveDataLocaly(whitModel model: ShowDetailModel) {
        try! realm.write {
            realm.add(model)
        }
        getDataFromLocalStorage()
    }

    func getShow(completion: @escaping (Result<Shows, ErrorMessage>) -> Void) {
        let url: URL? = URL(string: endpoint.rawValue)
        guard url != nil else {
            debugPrint("This url is not valid")
            return
        }
        let session: URLSession = URLSession.shared
        let dataTask: URLSessionDataTask = session.dataTask(with: url!) { data, _, error in
            if error == nil && data != nil {
                let decoder = JSONDecoder()
                do {
                    guard let dataFromApi = data else { return }
                    let shows = try decoder.decode(Shows.self, from: dataFromApi)
                    completion(.success(shows))
                } catch {
                    completion(.failure(.connectionError))
                }
            }
        }
        dataTask.resume()
    }

    func getFavoriteShows(completition: @escaping (Results<ShowDetailModel>) -> Void) {
		let showsLocal = realm.objects(ShowDetailModel.self).filter("isFavorite = %@", true)
		completition(showsLocal)
    }
}
