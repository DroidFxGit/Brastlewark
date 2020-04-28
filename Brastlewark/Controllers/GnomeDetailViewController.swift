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
    lazy var headerView: MainHeaderView = MainHeaderView(frame: CGRect(x: 0, y: 0,
                                                                       width: tableView.frame.width,
                                                                       height: 200))
    var datasource: GnomeDetailDatasource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Details"
        headerView.configure(thumbnail: datasource.thumbnail)
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
