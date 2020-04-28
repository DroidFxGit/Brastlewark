//
//  MainResultsViewModel.swift
//  Brastlewark
//
//  Created by Carlos Vázquez Gómez on 25/04/20.
//  Copyright © 2020 droidfx. All rights reserved.
//

import Foundation

final class MainResultsViewModel {
    fileprivate weak var datasource : GenericDatasource<GnomeModel>?
    fileprivate let service: HabitantsService
    fileprivate(set) var habitants: [GnomeModel] = []
    fileprivate var onAction: ((Error) -> Void)?
    
    init(datasource: GenericDatasource<GnomeModel>?,
         service: HabitantsService = HabitantsServiceConcrete(),
         onAction: ((Error) -> Void)? = nil) {
        self.datasource = datasource
        self.service = service
        self.onAction = onAction
    }
    
    func fetchHabitants() {
        DispatchQueue.main.async {
            self.service.fetchHabitants { [weak self] response in
                switch response {
                case .success(let response):
                    self?.habitants = response.habitants
                    self?.datasource?.data.value = response.habitants
                case .failure(let error):
                    self?.onAction?(error)
                }
            }
        }
    }
    
    func filterHabitants(with text: String) {
        let filteredHabitants = habitants.filter { (habitant) -> Bool in
            return habitant.name.range(of: text, options: .caseInsensitive) != nil
        }
        datasource?.data.value = filteredHabitants
    }
    
    func resetData() {
        datasource?.data.value = habitants
    }
}
