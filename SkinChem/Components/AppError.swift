//
//  appError.swift
//  TestApp
//
//  Created by India Poetzscher on 9/25/22.
//

import Foundation

enum AppError: LocalizedError {
    case error(Error)
    case unknown
}
