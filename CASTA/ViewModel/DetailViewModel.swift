//
//  DetailViewModel.swift
//  CASTA
//
//  Created by kamlesh kumar on 07/11/20.
//  Copyright © 2020 Kamalesh Kumar Yadav. All rights reserved.
//

import Foundation

struct DetailViewModel {
	
	private var item:ItemModel
	
	init(item:ItemModel) {
		self.item = item
	}
	
	func detailOfItem() -> String {
		return " ID:\(item.id ?? "") \n Type: \(item.type ?? "") \n Data: \(item.data ?? "") \n Date: \(item.date ?? "")"
	}
	
}

struct ItemModel:Decodable {
    let id:String?
    let type:String?
    let date:String?
    let data:String?
}
