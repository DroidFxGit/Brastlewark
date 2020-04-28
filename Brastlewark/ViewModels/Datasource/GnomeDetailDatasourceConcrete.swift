//
//  GnomeDetailDatasourceConcrete.swift
//  Brastlewark
//
//  Created by Carlos Vázquez Gómez on 27/04/20.
//  Copyright © 2020 droidfx. All rights reserved.
//

import UIKit
import Foundation

final class GnomeDetailDatasourceConcrete: NSObject, GnomeDetailDatasource {
    var thumbnail: String
    
    enum RowSection: CaseIterable {
        case name
        case age
        case weight
        case height
        case hairColor
        case professions
        case friends
    }
    
    static let kCellIdentifier = "detailCellIdentifier"
    private let sections = RowSection.allCases
    private let model: GnomeModel
    
    init(model: GnomeModel) {
        self.model = model
        thumbnail = model.thumbnail
        super.init()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: GnomeDetailDatasourceConcrete.kCellIdentifier) else {
            preconditionFailure("cannot dequeue cell with \(GnomeDetailDatasourceConcrete.kCellIdentifier)")
        }
        let section = sections[indexPath.row]
        switch section {
        case .name:
            cell.textLabel?.text = "Name: \(model.name)"
        case .age:
            cell.textLabel?.text = "Age: \(model.age)"
        case .weight:
            cell.textLabel?.text = "Weight: \(model.weight)"
        case .height:
            cell.textLabel?.text = "Height: \(model.height)"
        case .hairColor:
            cell.textLabel?.text = "Hair Color: \(model.hairColor)"
        case .professions:
            let text = model.professions.joined(separator: ", ")
            cell.textLabel?.numberOfLines = 0
            cell.textLabel?.text = "Professions: \(text)"
        case .friends:
            let text = model.friends.joined(separator: ", ")
            cell.textLabel?.numberOfLines = 0
            cell.textLabel?.text = "Friends: \(text)"
        }
        return cell
    }
}
