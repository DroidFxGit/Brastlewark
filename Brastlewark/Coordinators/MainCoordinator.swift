//
//  MainCoordinator.swift
//  Brastlewark
//
//  Created by Carlos Vázquez Gómez on 25/04/20.
//  Copyright © 2020 droidfx. All rights reserved.
//

import UIKit
import Foundation

final class MainCoordinator: Startable {
    fileprivate weak var window: UIWindow?
    fileprivate let factory: ViewControllerFactory!
    lazy var rootController: UINavigationController = UINavigationController()
    
    init(window: UIWindow,
         factory: ViewControllerFactory = ViewControllerFactoryConcrete()) {
        self.window = window
        self.factory = factory
    }
    
    func start() {
        configureMainView()
        window?.makeKeyAndVisible()
    }
    
    private func configureMainView() {
        let datasource = MainResultsDataSourceConcrete { [weak self] gnome in
            self?.showGnomeDetails(gnome)
        }
        let viewModel = MainResultsViewModel(datasource: datasource)
        let mainView = factory.makeMainResultsView(viewModel: viewModel, datasource: datasource)
        rootController.viewControllers = [mainView]
        rootController.navigationBar.prefersLargeTitles = true
        window?.rootViewController = rootController
    }
    
    func showGnomeDetails(_ gnome: GnomeModel) {
        //TODO: implements details
    }
}
