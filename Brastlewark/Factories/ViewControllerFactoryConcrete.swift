//
//  ViewControllerFactoryConcrete.swift
//  Brastlewark
//
//  Created by Carlos Vázquez Gómez on 25/04/20.
//  Copyright © 2020 droidfx. All rights reserved.
//

import UIKit

final class ViewControllerFactoryConcrete: ViewControllerFactory  {
    func makeMainResultsView(viewModel: MainResultsViewModel,
                             datasource: MainResultsDataSource) -> UIViewController {
        let controller = MainResultsViewController()
        controller.viewModel = viewModel
        controller.datasource = datasource
        
        let searchVC = UISearchController(searchResultsController: nil)
        searchVC.searchBar.delegate = controller
        searchVC.delegate = controller
        searchVC.hidesNavigationBarDuringPresentation = true
        searchVC.obscuresBackgroundDuringPresentation = false
        controller.navigationItem.searchController = searchVC
        controller.definesPresentationContext = true
        controller.searchController = searchVC
        
        return controller
    }
}
