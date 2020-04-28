//
//  MainResultsViewModelTests.swift
//  BrastlewarkTests
//
//  Created by Carlos Vázquez Gómez on 28/04/20.
//  Copyright © 2020 droidfx. All rights reserved.
//

import XCTest
@testable import Brastlewark

class MainResultsViewModelTests: XCTestCase {
    let service = HabitantsServiceMock()
    let datasource = MainResultsDataSourceMock()
    var viewModel: MainResultsViewModel!

    override func setUp() {
    }

    override func tearDown() {
    }

    func testThatServiceObtainedDataWhenServiceHasValidResponse() {
        assertDataWasObtainedSuccesfully()
        XCTAssert(viewModel.habitants.count == 5)
        XCTAssert(datasource.data.value.count == 5)
    }
    
    func assertDataWasObtainedSuccesfully() {
        let expectation = self.expectation(description: "Data was obtained successfully")
        let response = HabitantsModelResponse.validResponse(bundle: Bundle(for: type(of: self)))
        service.response = response
        viewModel = MainResultsViewModel(datasource: datasource, service: service)
        XCTAssert(viewModel.habitants.count == 0)
        XCTAssert(datasource.data.value.count == 0)
        
        service.onAction = { expectation.fulfill() }
        viewModel.fetchHabitants()
        
        waitForExpectations(timeout: 0.5, handler: nil)
    }
    
    func testThatResponseThrowsErrorWhenServiceFailed() {
        let expectation = self.expectation(description: "Error was thrown by the service")
        let response = HabitantsModelResponse.validResponse(bundle: Bundle(for: type(of: self)))
        service.response = response
        service.shouldShowError = true
        
        viewModel = MainResultsViewModel(datasource: datasource, service: service)
        service.onThrowError = { expectation.fulfill() }
        viewModel.fetchHabitants()
        
        waitForExpectations(timeout: 0.5, handler: nil)
    }
    
    func testThatViewModelFilterUsersWhenDataIsObtained() {
        assertDataWasObtainedSuccesfully()
        
        viewModel.filterHabitants(with: "Malbin")
        XCTAssert(datasource.data.value.count == 2)
    }
    
    func testThatViewModelResetsDataAfterFilterApplied() {
        assertDataWasObtainedSuccesfully()
        
        viewModel.filterHabitants(with: "Malbin")
        XCTAssert(datasource.data.value.count == 2)
        
        viewModel.resetData()
        XCTAssert(datasource.data.value.count == 5)
    }
}
