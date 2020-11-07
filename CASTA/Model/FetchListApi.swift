//
//  FetchListApi.swift
//  CASTA
//
//  Created by Kamalesh Kumar Yadav on 05/11/20.
//  Copyright © 2020 Kamalesh Kumar Yadav. All rights reserved.
//

import Foundation
import Alamofire

protocol ListApiProtocol {
    func fetchItemList(result:@escaping(Result<[ItemModel],ErrorResult>) -> Void )
}

struct FetchItemFromApi: ListApiProtocol {
    
    /// Function to fetch the item from given api
    /// - Parameter result: going to send response callback to calling method to view model or who ever subscribing  to it
    func fetchItemList(result: @escaping (Result<[ItemModel], ErrorResult>) -> Void) {
        guard let url = URL(string: "https://raw.githubusercontent.com/AxxessTech/Mobile-Projects/master/challenge.json") else {
            result(.failure(.URLError(string: "Please check url")))
          return
        }
        
         AF.request(url).responseJSON { (response) in
             switch response.result {
             case .success( _) :
                do {
                 let users = try JSONDecoder().decode([ItemModel].self, from: response.data!)
                    result(.success(users))
                } catch let error as NSError {
                    print("Failed to load: \(error.localizedDescription)")
                    result(.failure(.parser(string: "Parsing failed")))
                }
               case .failure(let error):
                    result(.failure(.network(string: error.localizedDescription)))
             }
         }
    }
}
    






