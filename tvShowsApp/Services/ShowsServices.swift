//
//  ShowsServices.swift
//  tvShowsApp
//
//  Created by Josafat Martínez  on 11/01/21.
//

import Foundation
enum Result<Success, Failure: Error> {
	case success(Success)
	case failure(Failure)
}

enum ErrorMessage: String, Error {
	case errorWhenMarkingOrDeletingIt = "Hubo un problema al guardar/borrar este show de TV. ¿Quieres intentar nuevamente?"
	case connectionError = "Ocurrió un error al consultar el servicio. ¿Quieres intentar nuevamente?"
}


