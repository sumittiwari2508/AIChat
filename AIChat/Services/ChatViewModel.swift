//
//  ChatViewModel.swift
//  AIChat
//
//  Created by $umit on 07/07/26.
//

import SwiftUI

@MainActor
final class ChatViewModel: ObservableObject {
    
    @Published var messages: [ChatMessage] = []
    @Published var isThinking = false
    
    private let aiService = AIService()
    
    func sendMessage(text: String) {
        
        let message = text.trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard !message.isEmpty else {
            return
        }
        
        messages.append(
            ChatMessage(
                text: message,
                sender: .user
            )
        )
        
        isThinking = true
        
        Task {
            
            defer {
                self.isThinking = false
            }
            
            do {
                
                let response = try await aiService.ask(message)
                // GEMINI:-
                guard let content = response.candidates.first?.content.parts.first?.text else {
                    return
                }
                
                // CHAT:-
                //                guard let content = response.choices.first?.message.content else {
                //                    // Handle empty response
                //                    return
                //                }
                
                messages.append(
                    ChatMessage(
                        text: "",
                        sender: .assistant
                    )
                )

                let assistantIndex = messages.count - 1

                await animateResponse(
                    content,
                    assistantIndex: assistantIndex
                )
                
                
            } catch {
                self.messages.append(
                    ChatMessage(
                        text: "Sorry, something went wrong.",
                        sender: .assistant
                    )
                )
                
            }
            
        }
    }
    
    private func animateResponse(
        _ text: String,
        assistantIndex: Int
    ) async {
        
        let words = text.split(separator: " ")
        for word in words {
            if messages[assistantIndex].text.isEmpty {
                messages[assistantIndex].text = String(word)
            } else {
                messages[assistantIndex].text += " " + String(word)
            }
            try? await Task.sleep(for: .milliseconds(100))
        }
    }
    
    func clearChat() {
        messages.removeAll()
    }
}
