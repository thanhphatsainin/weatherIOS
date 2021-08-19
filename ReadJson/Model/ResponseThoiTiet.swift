//
//  ResponseThoiTiet.swift
//  ReadJson
//
//  Created by trần nam on 8/18/21.
//  Copyright © 2021 trần nam. All rights reserved.
//

import Foundation

struct ResponseThoiTiet<T: Codable>: Codable {
    let status: String
    let data: T?
}
