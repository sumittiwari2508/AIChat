import Foundation

enum Sender {
    case user
    case assistant
}


struct ChatMessage: Identifiable {
    let id: UUID = UUID()
    var text: String
    let sender: Sender
    let createdAt: Date = Date()
}
