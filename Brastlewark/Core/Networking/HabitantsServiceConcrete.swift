//
//  HabitantsServiceConcrete.swift
//  Brastlewark
//
//  Created by Carlos Vázquez Gómez on 24/04/20.
//  Copyright © 2020 droidfx. All rights reserved.
//

import Foundation

final class HabitantsServiceConcrete: BaseService<HabitantsModelResponse>, HabitantsService {
    private let mainPath = "https://raw.githubusercontent.com/rrafols/mobile_test/master/data.json"
    
    func fetchHabitants(_ completion: @escaping completionHandler<HabitantsModelResponse>) {
        guard let components = URLComponents(string: mainPath) else {
            completion(.failure(error: ServiceError.badrequest))
            return
        }
        
        var request = URLRequest(url: components.url!)
        request.httpMethod = HttpMethod.get.rawValue
        perform(request: request, completion: completion)
    }
}
