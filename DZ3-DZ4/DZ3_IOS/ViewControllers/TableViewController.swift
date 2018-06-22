//
//  TableViewController.swift
//  DZ3_IOS
//
//  Created by Marko Burčul on 10/06/2018.
//  Copyright © 2018 Marko Burčul. All rights reserved.
//

import UIKit


class TableViewController: UITableViewController {
    
    let cellReuseIdentifier = "movieCell"
    var viewModel: MovieTableViewModel!
    var movieSearched:String!
    
    convenience init(viewModel: MovieTableViewModel) {
        self.init()
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupData()
        }
    

    func setupTableView(){
        self.tableView.backgroundColor = UIColor.lightGray
        self.tableView.delegate = self
        self.tableView.dataSource = self
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = UIColor.white
        tableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: cellReuseIdentifier)
        
    }
    
    func setupData() {
        viewModel.fetchMovies{ [weak self] (movies) in
            self?.refresh()
        }
    }
    
    func refresh() {
        tableView.reloadData()
        self.refreshControl?.endRefreshing()
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfMovies()
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! MovieTableViewCell

        if let movie = viewModel.movie(atIndex: indexPath.row) {
            cell.setup(withMovie: movie)
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 130.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if let movie = viewModel.movie(atIndex: indexPath.row) {
            let model = SingleMovieViewModel(movie:movie)
            let moviecontroller = MovieController(viewModel:model)
            navigationController?.pushViewController(moviecontroller, animated: true)
        }
    }


    
}
