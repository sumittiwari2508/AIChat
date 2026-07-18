//
//  ResponseMessage.swift
//  AIChat
//
//  Created by $umit on 11/07/26.
//

import Foundation

struct ResponseMessage: Codable {
    let role: ChatRole
    let content: String
}
