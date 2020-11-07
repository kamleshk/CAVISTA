//
//  FetchListApi.swift
//  CASTATests
//
//  Created by Kamalesh Kumar Yadav on 06/11/20.
//  Copyright © 2020 Kamalesh Kumar Yadav. All rights reserved.
//

import XCTest
@testable import CASTA
class FetchListApi: XCTestCase {
    let service:ListApiProtocol = MokFetchApiList()
    var list:[ItemModel] = []
    var error:ErrorResult?
    
    override func setUp() {
        service.fetchItemList { (result) in
            switch result {
            case .success(let listt):
                self.list = listt
            case .failure(let error):
                self.error = error
            }
        }
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
   
    func testErrorNil()  {
        XCTAssertNil(error)
    }
    func testServiceProto()  {
        XCTAssertEqual(self.list.count, 2)
    }
    
    func testModel()  {
        let model = list.first
        XCTAssertEqual(model?.id, "2639")
    }

}

let jsonStr = """
[
{
  "id": "2639",
  "type": "image",
  "date": "9/4/2015",
  "data": "https://placeimg.com/620/320/any"
},
{
  "id": "12",
  "type": "text",
  "date": "01/10/2014",
  "data": "Your work is going to fill a large part of your life, and the only way to be truly satisfied is to do what you believe is great work. And the only way to do great work is to love what you do. If you haven't found it yet, keep looking. Don't settle. As with all matters of the heart, you'll know when you find it."
}
]
"""

struct MokFetchApiList:ListApiProtocol {
    func fetchItemList(result: @escaping (Result<[ItemModel], ErrorResult>) -> Void) {
        do{
        let users = try JSONDecoder().decode([ItemModel].self, from: jsonStr.data(using: .utf8)!)
            result(.success(users))
             
        } catch let error as NSError {
                print("Failed to load: \(error.localizedDescription)")
                result(.failure(.parser(string: "Parsing failed")))
         
        }
    }
}
