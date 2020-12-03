//
//  ViewModelMovi.swift
//  MVVMTVShow
//
//  Created by Jordi Milla on 03/12/2020.
//  Copyright © 2020 Jordi Milla Catalan. All rights reserved.
//

import Foundation
import UIKit
import Moya

let provider = MoyaProvider<TVShowAPI>()

// Crear un mecanismo para enlazar lo que seria la vista con el modelo de la vista
var refreshData = { () -> () in }

// Fuente de datos(Array)
var dataArray: [Movie] = [] {
    didSet {
        refreshData()
    }
}

// ¡¡¡ NO DEBERIA IR AQUI !!! Habria que crear una capa de conexion para hacer este tipo cosas. E instancias desde aquí el objeto de capa de conexión

// Obtener los datos de la API

func retriveDataMovies() {
       provider.request(.getMovies) { result in
           switch result {
           case .success(let response):
               print("success")
               let array = try! response.map([Movie].self)
               self.data = array
               self.tableView.reloadData()
           case .failure:
               print("Error")
           }
       }
   }
