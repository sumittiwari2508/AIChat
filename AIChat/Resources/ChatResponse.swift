//
//  ChatResponse.swift
//  AIChat
//
//  Created by $umit on 11/07/26.
//

import Foundation

// CHAT:-
struct ChatResponse: Codable {
    let choices: [Choice]
}

// GEMINI:-
struct GeminiResponse: Codable {
    let candidates: [Candidate]
}

struct Candidate: Codable {
    let content: GeminiContent
}

struct GeminiContent: Codable {
    let parts: [GeminiPart]
}

struct GeminiPart: Codable {
    let text: String
}
