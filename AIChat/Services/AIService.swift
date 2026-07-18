//
//  AIService.swift
//  AIChat
//
//  Created by $umit on 07/07/26.
//

import SwiftUI

final class AIService {
    var chatURL = "https://api.openai.com/v1/chat/completions"
    var geminiURL = "https://generativelanguage.googleapis.com/v1beta/models/gemini-3.5-flash:generateContent?key=\(APIConstants.apiKey)"
    
    
    func ask(_ prompt: String) async throws -> GeminiResponse {
        guard let url = URL(string: geminiURL) else {
            throw AIServiceError.invalidURL
        }

        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.post.rawValue

        request.setValue(
            "application/json",
            forHTTPHeaderField: "Content-Type"
        )

        // CHAT:-
//        request.setValue(
//            "Bearer \(APIConstants.apiKey)",
//            forHTTPHeaderField: "Authorization"
//        )
    
        // GEMINI:-
        let requestBody = GeminiRequest(
            contents: [
                Content(
                    parts: [
                        Part(text: prompt)
                    ]
                )
            ]
        )
    
        // CHAT:-
//        let requestBody = ChatRequest(
//            model: "gpt-5-mini",
//            messages: [
//                Message(
//                    role: .user,
//                    content: prompt
//                )
//            ]
//        )

        request.httpBody = try JSONEncoder().encode(requestBody)
        let (data, response) = try await URLSession.shared.data(for: request)

        if let json = String(data: data, encoding: .utf8) {
            print(json)
        }
        guard let httpResponse = response as? HTTPURLResponse else {
            throw AIServiceError.invalidResponse
        }
        

        guard (200...299).contains(httpResponse.statusCode) else {
            throw AIServiceError.invalidResponse
        }
        
        
        let chatResponse = try JSONDecoder().decode(
            GeminiResponse.self,
            from: data
        )
        

        return chatResponse
    }
}
