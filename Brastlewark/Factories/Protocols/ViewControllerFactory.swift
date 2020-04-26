//
//  ViewControllerFactory.swift
//  Brastlewark
//
//  Created by Carlos Vázquez Gómez on 25/04/20.
//  Copyright © 2020 droidfx. All rights reserved.
//

import UIKit

protocol ViewControllerFactory: AnyObject {
    func makeMainResultsView(viewModel: MainResultsViewModel,
                             datasource: MainResultsDataSource) -> UIViewController
}
