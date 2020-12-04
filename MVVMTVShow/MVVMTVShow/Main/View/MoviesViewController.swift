//
//  ViewController.swift
//  MVVMTVShow
//
//  Created by Jordi Milla on 03/12/2020.
//  Copyright © 2020 Jordi Milla Catalan. All rights reserved.
//

import Foundation
import UIKit
import Moya

class MoviesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
   // var data: [Movie]?
    var viewModel = ViewModelMovie()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTable()
        configureView()
        bind()
    }
    
    private func configureView() {
        viewModel.retriveDataMovies()
       }

       private func bind() {
           viewModel.refreshData = { [weak self] () in
               DispatchQueue.main.async {
                   self?.tableView.reloadData()
               }
           }
       }
    
    func setTable() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomTableViewCell")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel.dataArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell") as? CustomTableViewCell
        let movie = viewModel.dataArray[indexPath.row]
        cell?.configure(movie: movie)
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let vc = storyboard.instantiateViewController(withIdentifier: "OneMovieViewController") as? OneMovieViewController else { return }
        vc.data = viewModel.dataArray[indexPath.row]
            navigationController?.pushViewController(vc,
                                               animated: true)

    }
}

