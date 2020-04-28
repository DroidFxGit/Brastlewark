//
//  GnomeDetailViewController.swift
//  Brastlewark
//
//  Created by Carlos Vázquez Gómez on 27/04/20.
//  Copyright © 2020 droidfx. All rights reserved.
//

import UIKit

class GnomeDetailViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var headerView: MainHeaderView!
    var datasource: GnomeDetailDatasource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Details"
        configureTableView()
    }
    
    fileprivate func configureTableView() {
        tableView.delegate = datasource
        tableView.dataSource = datasource
        tableView.separatorInset = .zero
        tableView.register(UITableViewCell.self,
                           forCellReuseIdentifier: GnomeDetailDatasourceConcrete.kCellIdentifier)
        tableView.tableFooterView = UIView()
        tableView.tableHeaderView = headerView
    }
}
