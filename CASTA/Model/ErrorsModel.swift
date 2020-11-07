//
//  ErrorsModel.swift
//  CASTA
//
//  Created by kamlesh kumar on 07/11/20.
//  Copyright © 2020 Kamalesh Kumar Yadav. All rights reserved.
//

import Foundation

/// Custom Enum for error handaling
enum ErrorResult: Error {
    case network(string: String)
    case parser(string: String)
    case custom(string: String)
    case URLError(string:String)
}
