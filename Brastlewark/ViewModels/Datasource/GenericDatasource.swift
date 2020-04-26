//
//  GenericDatasource.swift
//  Brastlewark
//
//  Created by Carlos Vázquez Gómez on 25/04/20.
//  Copyright © 2020 droidfx. All rights reserved.
//

import Foundation

class GenericDatasource<T> : NSObject {
    var data: DynamicValue<[T]> = DynamicValue([])
}
