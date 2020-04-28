//
//  MainResultsDataSource.swift
//  Brastlewark
//
//  Created by Carlos Vázquez Gómez on 25/04/20.
//  Copyright © 2020 droidfx. All rights reserved.
//

import UIKit

protocol MainResultsDataSource: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func observe(_ observer: NSObject, completionHandler: @escaping CompletionHandler)
}
