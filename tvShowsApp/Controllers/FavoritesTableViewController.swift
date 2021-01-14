//
//  FavoritesTableViewController.swift
//  tvShowsApp
//
//  Created by Josafat Martínez  on 11/01/21.
//

import RealmSwift
import UIKit

protocol FavoritesDelegate: AnyObject {
    func getFavoriteShowData(handelDataFrom model: Results<ShowDetailModel>)
    func showMessageErrorAlert(alertTitle title: String, alertErrorMessage error: String)
}

class FavoritesTableViewController: UITableViewController, FavoritesDelegate {
    private var favoriteShows: Results<ShowDetailModel>?
    private var viewModel = FavoriteViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        clearsSelectionOnViewWillAppear = false
        viewModel.delegate = self
        viewModel.getFavoriteShowsDataFromBackend()
    }
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		tableView.reloadData()
	}

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return favoriteShows?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favoritosIdentifier", for: indexPath)
        if let favorite = favoriteShows?[indexPath.row] {
            cell.textLabel?.text = favorite.name
            cell.imageView?.load(urlString: favorite.imageUrlStirng)
        }
        return cell
    }

    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let showDetailsViewController = storyboard?.instantiateViewController(withIdentifier: "ShowDetailViewController") as? ShowDetailViewController {
            if let favorite = favoriteShows?[indexPath.row] {
                let showDetail: ShowDetailModel = ShowDetailModel(value: ["uuid": favorite.uuid, "imageUrlStirng": favorite.imageUrlStirng, "name": favorite.name, "officialSite": favorite.officialSite, "network": favorite.network, "lenguage": favorite.lenguage, "summary": favorite.summary])
                showDetailsViewController.show = showDetail
                navigationController?.pushViewController(showDetailsViewController, animated: true)
            }
        }
    }

    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? { let delete = UITableViewRowAction(style: .destructive, title: "Borrar") { _, indexPath in
        let realm = try! Realm()
        let deletedValue = self.favoriteShows?[indexPath.row].uuid
        let favoriteShowToDelete = realm.objects(ShowDetailModel.self).filter("uuid == %@", deletedValue!)
		if favoriteShowToDelete.count > 0 {
			for favorite in favoriteShowToDelete {
				try! realm.write {
					realm.delete(favorite)
				}
			}
		}
		tableView.deleteRows(at: [indexPath], with: .fade)
    }
    return [delete]
    }

    // MARK: - Favorites Delegate

    func getFavoriteShowData(handelDataFrom model: Results<ShowDetailModel>) {
        favoriteShows = model
        tableView.reloadData()
    }

    func showMessageErrorAlert(alertTitle title: String, alertErrorMessage error: String) {
        let alert = createAlertController(alertTitle: title, alertErrorMessage: error)
        present(alert, animated: true)
    }
}
