//
//  RealmHelper.swift
//  tvShowsApp
//
//  Created by Josafat Martínez  on 14/01/21.
//

import Foundation
import RealmSwift

public func dropRealmDB() {
	debugPrint("trying to remove REALM database and helper files....")
	debugPrint("at: \(Realm.Configuration.defaultConfiguration.fileURL!)")
	let realmURL = Realm.Configuration.defaultConfiguration.fileURL!
	let realmURLs = [
		realmURL,
		realmURL.appendingPathExtension("lock"),
		realmURL.appendingPathExtension("note"),
		realmURL.appendingPathExtension("management")
	]
	for URL in realmURLs {
		do {
			try FileManager.default.removeItem(at: URL)
		} catch {
			// handle error
		}
	}
}

public func deleteAllRealmObjects() {
	let realm = try! Realm()
	try! realm.write {
		realm.deleteAll()
	}
}
