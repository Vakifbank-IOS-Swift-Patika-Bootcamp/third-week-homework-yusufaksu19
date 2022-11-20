//
//  QuoteResponseModel.swift
//  ThirdWeek-ThirdHomework
//
//  Created by Yusuf Aksu on 20.11.2022.
//

import Foundation

struct QuoteResponseModel: Codable {
    let success: Bool
    let message: String
    let result: QuoteModel
}


