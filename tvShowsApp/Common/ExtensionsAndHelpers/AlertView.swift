//
//  AlertView.swift
//  tvShowsApp
//
//  Created by Josafat Martínez  on 12/01/21.
//

import UIKit

func createAlertController(alertTitle title: String, alertErrorMessage error: String) -> UIAlertController {
    let alert = UIAlertController(title: title, message: error, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
	return alert
}
