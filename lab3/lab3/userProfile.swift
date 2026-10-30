import Foundation

class UserProfile {
    var nickname: String
    var favoriteGame: String
    var isDarkMode: Bool

    init(nickname: String, favoriteGame: String, isDarkMode: Bool) {
        self.nickname = nickname
        self.favoriteGame = favoriteGame
        self.isDarkMode = isDarkMode
    }
}
