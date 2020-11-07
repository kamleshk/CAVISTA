//
//  TestViewModel.swift
//  CASTATests
//
//  Created by Kamalesh Kumar Yadav on 06/11/20.
//  Copyright © 2020 Kamalesh Kumar Yadav. All rights reserved.
//

import XCTest
@testable import CASTA
class TestViewModel: XCTestCase {

    let viewModel = ListViewModel(apiProtocol: MokFetchApiList())
    let serviceMok = FetchListApi()
    override func setUp() {
        serviceMok.setUp()
        viewModel.fetchList()
       
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    func testcompareList()  {
        XCTAssertEqual(viewModel.numberOfRows, serviceMok.list.count)
    }
    
    func testNumberOFrows()  {
        XCTAssertEqual(viewModel.numberOfRows, 2)
    }
    
    func testdataForIndex()  {
        let model = viewModel.itemForIndex(indexPath: IndexPath(item: 0, section: 0))
        XCTAssertEqual(model.id!, serviceMok.list.first?.id)
    }

}


