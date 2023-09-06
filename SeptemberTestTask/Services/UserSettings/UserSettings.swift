import Foundation

final class UserSettings {

    private enum SettingsKeys: String {
        case isGoogleMode
    }

    static var isGoogleMode: Bool? {
        get {
            return UserDefaults.standard.bool(forKey: SettingsKeys.isGoogleMode.rawValue)
        } set {
            let defaults = UserDefaults.standard
            let key = SettingsKeys.isGoogleMode.rawValue
            if let flag = newValue {
                defaults.set(flag, forKey: key)
            } else {
                defaults.removeObject(forKey: key)
            }
        }
    }
}

