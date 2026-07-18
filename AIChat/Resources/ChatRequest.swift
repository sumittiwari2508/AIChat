//
//  ChatRequest.swift
//  AIChat
//
//  Created by $umit on 08/07/26.
//

import Foundation

// CHAT:-
struct ChatRequest: Codable {
    let model: String
    let messages: [Message]
}

// GEMINI:-
struct GeminiRequest: Codable {
    let contents: [Content]
}

struct Content: Codable {
    let parts: [Part]
}

struct Part: Codable {
    let text: String
}
