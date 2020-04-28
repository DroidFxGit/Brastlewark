//
//  GnomeDetailDatasource.swift
//  Brastlewark
//
//  Created by Carlos Vázquez Gómez on 27/04/20.
//  Copyright © 2020 droidfx. All rights reserved.
//

import UIKit

protocol GnomeDetailDatasource: UITableViewDelegate, UITableViewDataSource {
    var thumbnail: String { get }
}
