//
//  ChatInputView.swift
//  AIChat
//
//  Created by $umit on 05/07/26.
//

import SwiftUI

struct ChatInputView: View {
    @Binding var text: String
    let onSend: () -> Void
    
    var body: some View {
        HStack {
            TextField("Type a message...", text: $text)
                .padding(.horizontal, 16)
                .padding(.vertical, 10)
                .background(Color.gray.opacity(0.5))
                .clipShape(Capsule())
                .frame(maxWidth: .infinity)
            Button {
                onSend()
            } label: {
                Image(systemName: "paperplane.fill")
                    .font(.title3)
                    .foregroundColor(.white)
                    .padding(10)
                    .background(Color.blue)
                    .clipShape(Circle())
            }
        }
        .padding()
    }
}

struct ChatInputView_Previews: PreviewProvider {
    @State static var previewText = ""
    
    static var previews: some View {
        ChatInputView(
            text: $previewText,
            onSend: { }
        )
    }
}
