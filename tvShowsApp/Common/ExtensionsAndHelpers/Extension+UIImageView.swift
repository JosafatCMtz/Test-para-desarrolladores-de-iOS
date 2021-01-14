//
//  Extension+UIImageView.swift
//  tvShowsApp
//
//  Created by Josafat Martínez  on 13/01/21.
//

import UIKit
extension UIImageView {
	func load(urlString: String) {
		guard let url = URL(string: urlString)else {
			return
		}
		DispatchQueue.global().async { [weak self] in
			if let data = try? Data(contentsOf: url) {
				if let image = UIImage(data: data) {
					DispatchQueue.main.async {
						self?.image = image
					}
				}
			}
		}
	}
}
