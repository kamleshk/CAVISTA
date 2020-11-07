//
//  ListViewModel.swift
//  CASTA
//
//  Created by Kamalesh Kumar Yadav on 05/11/20.
//  Copyright © 2020 Kamalesh Kumar Yadav. All rights reserved.
//

import Foundation

class ListViewModel {
    
    private var itemList : [ItemModel] = []
    private var service:ListApiProtocol?
    
    var refreshUi:(()-> Void)?
    var handaleError :((_ error:ErrorResult) -> Void )?
    
    init(apiProtocol:ListApiProtocol) {
        service = apiProtocol
        
    }
    
    
    /// Method to fetch the item list from api
	func fetchList() {
            self.service?.fetchItemList(result: { [weak self ](response) in
                    switch response {
                        case .success(let list):
                            self?.itemList = list
                            guard let refresh = self?.refreshUi else {return}
                             DispatchQueue.main.async {
                            refresh()
                        }
                        case .failure(let error):
                            guard let errorrefresh = self?.handaleError else {return}
                             DispatchQueue.main.async {
                            errorrefresh(error)
                             }
                        }// switch closed
								})
    }
    
    /// provides number of rows
  internal  var numberOfRows:Int {
         get {
            return itemList.count
        }
    }
    
    
    /// Function to get item from list  based on index
    /// - Parameter indexPath: pass indexpath to fetch the item associated to that index
    func itemForIndex(indexPath:IndexPath) -> ItemModel {
        return itemList[indexPath.row]
    }
    
    
}
