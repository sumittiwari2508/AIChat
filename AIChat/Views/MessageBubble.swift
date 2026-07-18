//
//  MessageBubble.swift
//  AIChat
//
//  Created by $umit on 05/07/26.
//

import SwiftUI

struct MessageBubble: View {
    
    let message: ChatMessage
    
    private var displayText: AttributedString {
        (try? AttributedString(markdown: message.text))
        ?? AttributedString(message.text)
    }
    
    var body: some View {
        HStack {
            if message.sender == .user {
                Spacer()
            }
            
            Text(displayText)
                .padding()
                .background(
                    message.sender == .user ? Color.blue : Color.gray
                )
                .cornerRadius(16)
                .contextMenu {
                    Button {
                        UIPasteboard.general.string = message.text
                    } label: {
                        Label("Copy", systemImage: "doc.on.doc")
                    }
                }
            
            if message.sender == .assistant {
                Spacer()
            }
        }
        .padding(.horizontal)
    }
}

struct MessageBubble_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MessageBubble(
                message: ChatMessage(
                    text: "Hello!",
                    sender: .user
                )
            )
            .previewDisplayName("User")
            MessageBubble(
                message: ChatMessage(
                    text: "Hi Sumit! How can I help you today?",
                    sender: .assistant
                )
            )
            .previewDisplayName("Assistant")
        }
    }
}
