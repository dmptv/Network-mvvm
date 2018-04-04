//
//  ViewController.swift
//  Networking-MVVM
//
//  Created by 123 on 02.04.2018.
//  Copyright © 2018 123. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet var viewModel: ViewModel!
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.fetchMovies {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberItemsIn(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        configureCell(cell: cell, indexPath: indexPath)
        return cell
    }
    
  
    func configureCell(cell: UITableViewCell, indexPath: IndexPath) {
        cell.textLabel?.text = viewModel.titleForItemAt(indexPath)
    }


}















