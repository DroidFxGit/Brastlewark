//
//  MainHeaderView.swift
//  Brastlewark
//
//  Created by Carlos Vázquez Gómez on 27/04/20.
//  Copyright © 2020 droidfx. All rights reserved.
//

import UIKit

class MainHeaderView: UIView {
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var mainImageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed("MainHeaderView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    func configure(thumbnail: String) {
        mainImageView.pin_updateWithProgress = true
        mainImageView.pin_setImage(from: URL(string: thumbnail))
    }
}
