//
//  MainResultsViewModel.swift
//  Brastlewark
//
//  Created by Carlos Vázquez Gómez on 25/04/20.
//  Copyright © 2020 droidfx. All rights reserved.
//

import Foundation

struct MainResultsViewModel {
    fileprivate weak var datasource : GenericDatasource<GnomeModel>?
    fileprivate let service: HabitantsServiceConcrete
    
    init(datasource: GenericDatasource<GnomeModel>?,
         service: HabitantsServiceConcrete = HabitantsServiceConcrete()) {
        self.datasource = datasource
        self.service = service
    }
    
    func fetchHabitants() {
        service.fetchHabitants { response in
            DispatchQueue.main.async {
                switch response {
                case .success(let response):
                    self.datasource?.data.value = response.habitants
                case .failure(let error):
                    //TODO: handle error
                    print("something happened: \(error)")
                }
            }
        }
    }
}
