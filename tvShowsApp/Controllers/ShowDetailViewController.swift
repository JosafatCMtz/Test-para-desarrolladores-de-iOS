//
//  ShowDetailViewController.swift
//  tvShowsApp
//
//  Created by Josafat Martínez  on 11/01/21.
//

import UIKit

class ShowDetailViewController: UIViewController {
    // MARK: - Properties

    public var show: ShowDetailModel?

    // MARK: - IBOulets

    @IBOutlet var episodeImageView: UIImageView!
    @IBOutlet var nameShowLabel: UILabel!
    @IBOutlet var officialSiteLabel: UILabel!
    @IBOutlet var networkLabel: UILabel!
    @IBOutlet var langaglabel: UILabel!
    @IBOutlet var episodeSummaryTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let show = show else { return }
        configureScreenViews(whitModel: show)
    }

    // MARK: - Configuration Methods

    fileprivate func configureScreenViews(whitModel model: ShowDetailModel) {
        title = model.name
        episodeImageView.load(urlString: model.imageUrlStirng)
        nameShowLabel.text = model.name
        officialSiteLabel.text = model.officialSite
        networkLabel.text = model.network
        langaglabel.text = model.lenguage
        episodeSummaryTextView.text = model.summary
        debugPrint(model.uuid)
    }
}
