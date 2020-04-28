//
//  HabitantsModelResponse+Extensions.swift
//  BrastlewarkTests
//
//  Created by Carlos Vázquez Gómez on 28/04/20.
//  Copyright © 2020 droidfx. All rights reserved.
//

import Foundation
@testable import Brastlewark

extension HabitantsModelResponse {
    static func validResponse(bundle: Bundle = .main) -> HabitantsModelResponse {
        let manager = MockManager(bundleName: "valid_data", mainBundle: bundle)
        let data = manager.requestValidUsersJSON
        return parsed(data)
    }
    
    private static func parsed(_ data: Data) -> HabitantsModelResponse {
        let decoder = JSONDecoder()
        let response = try? decoder.decode(HabitantsModelResponse.self, from: data)
        return response!
    }
}
