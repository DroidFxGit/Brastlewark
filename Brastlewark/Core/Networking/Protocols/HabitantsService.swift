//
//  HabitantsService.swift
//  Brastlewark
//
//  Created by Carlos Vázquez Gómez on 24/04/20.
//  Copyright © 2020 droidfx. All rights reserved.
//

import Foundation

protocol HabitantsService: AnyObject {
    func fetchHabitants(_ completion: @escaping completionHandler<HabitantsModelResponse>)
}
