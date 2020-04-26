//
//  MainResultsViewController.swift
//  Brastlewark
//
//  Created by Carlos Vázquez Gómez on 24/04/20.
//  Copyright © 2020 droidfx. All rights reserved.
//

import UIKit

final class MainResultsViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    var searchController: UISearchController!
    var viewModel: MainResultsViewModel!
    var datasource: MainResultsDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Inhabitants"
        setupCollectionView()
        datasource.observe(self) { [weak self] in
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
        viewModel.fetchHabitants()
    }
    
    fileprivate func setupCollectionView() {
        collectionView.dataSource = datasource
        collectionView.delegate = datasource
    }
}

extension MainResultsViewController: UISearchBarDelegate, UISearchControllerDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    }
}
