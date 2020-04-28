//
//  GnomeCollectionViewCell.swift
//  Brastlewark
//
//  Created by Carlos Vázquez Gómez on 25/04/20.
//  Copyright © 2020 droidfx. All rights reserved.
//

import UIKit

class GnomeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    static let reuseIdentifier: String = "gnomeCollectionViewCellIdentifier"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(_ model: GnomeModel) {
        profileImageView.image(from: model.thumbnail)
        nameLabel.text = model.name
        ageLabel.text = "Age: \(String(model.age))"
    }
}
