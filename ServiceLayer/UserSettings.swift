import Foundation

struct UserSettings {
    private static let userDefault = UserDefaults.standard
    
    static func setSession(_ session: String) {
        userDefault.set(session, forKey: Constants.userDefaultKey)
    }
    
    static func getSession() -> String? {
        let session = userDefault.string(forKey: Constants.userDefaultKey)
        return session
    }
    
}
