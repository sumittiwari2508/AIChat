//
//  Message.swift
//  AIChat
//
//  Created by $umit on 08/07/26.
//

import Foundation

struct Message: Codable {
    let role: ChatRole
    let content: String
}
