//
//  TVShowsTableViewController.swift
//  tvShowsApp
//
//  Created by Josafat Martínez  on 11/01/21.
//

import UIKit

protocol TVShowDelegate: AnyObject {
    func getShowData(handelDataFrom model: Shows?)
    func showMessageErrorAlert(alertTitle title: String, alertErrorMessage error: String)
}

class TVShowsTableViewController: UITableViewController {
    private var shows: Shows = []

    // MARK: - Properties

    private var viewModel = TVShowViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        clearsSelectionOnViewWillAppear = false
        viewModel.delegate = self
        viewModel.getShowsDataFromBackend()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return shows.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tvShowsIdentifier", for: indexPath)
        cell.textLabel?.text = shows[indexPath.row].name
        cell.imageView?.load(urlString: shows[indexPath.row].image.medium)
        return cell
    }

    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let showDetailsViewController = storyboard?.instantiateViewController(withIdentifier: "ShowDetailViewController") as? ShowDetailViewController {
            let show = shows[indexPath.row]
			let showDetail: ShowDetailModel = ShowDetailModel(uuid: UUID().uuidString, imageUrlStirng: show.image.medium, name: show.name, officialSite: show.officialSite ?? "", network: show.network?.name ?? "", lenguage: show.language.rawValue, summary: show.summary, isFavorite: false)
            showDetailsViewController.show = showDetail
			navigationController?.pushViewController(showDetailsViewController, animated: true)
        }
    }
}

extension TVShowsTableViewController: TVShowDelegate {
    func getShowData(handelDataFrom model: Shows?) {
        DispatchQueue.main.async {
            guard let showsData = model else { return }
            self.shows = showsData
            self.tableView.reloadData()
        }
    }

    func showMessageErrorAlert(alertTitle title: String, alertErrorMessage error: String) {
        let alert = createAlertController(alertTitle: title, alertErrorMessage: error)
        present(alert, animated: true)
    }
}
