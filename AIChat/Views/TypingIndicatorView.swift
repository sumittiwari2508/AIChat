//
//  TypingIndicatorView.swift
//  AIChat
//
//  Created by $umit on 06/07/26.
//

import SwiftUI

struct TypingIndicatorView: View {
    @State private var currentDot = 0

    var body: some View {
        HStack(spacing: 4) {

            ForEach(0..<3) { index in

                Circle()
                    .fill(index == currentDot ? Color.gray : Color.gray.opacity(0.3))
                    .frame(width: 8, height: 8)
            }

            Spacer()
        }
        .padding(.horizontal)
        
        .onAppear {

            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { _ in

                withAnimation {
                    currentDot = (currentDot + 1) % 3
                }

            }
        }
    }
}

struct TypingIndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        TypingIndicatorView()
    }
}
