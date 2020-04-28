//
//  MainResultsDataSourceMock.swift
//  BrastlewarkTests
//
//  Created by Carlos Vázquez Gómez on 28/04/20.
//  Copyright © 2020 droidfx. All rights reserved.
//

import UIKit
import Foundation
@testable import Brastlewark

final class MainResultsDataSourceMock: GenericDatasource<GnomeModel>, MainResultsDataSource {
    func observe(_ observer: NSObject, completionHandler: @escaping CompletionHandler) {
        data.addAndNotify(observer: self, completionHandler: completionHandler)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}
