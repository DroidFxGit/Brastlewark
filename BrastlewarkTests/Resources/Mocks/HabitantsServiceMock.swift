//
//  HabitantsServiceMock.swift
//  BrastlewarkTests
//
//  Created by Carlos Vázquez Gómez on 28/04/20.
//  Copyright © 2020 droidfx. All rights reserved.
//

import Foundation
@testable import Brastlewark

final class HabitantsServiceMock: HabitantsService {
    var response: HabitantsModelResponse?
    var shouldShowError = false
    var onAction: (() -> Void)? = nil
    var onThrowError: (() -> Void)? = nil
    
    func fetchHabitants(_ completion: @escaping completionHandler<HabitantsModelResponse>) {
        if shouldShowError {
            completion(.failure(error: ServiceError.unknown))
            onThrowError?()
        }
        guard let response = response else {
            completion(.failure(error: ServiceError.errorParse))
            onThrowError?()
            return
        }
        completion(.success(response: response))
        onAction?()
    }
}
