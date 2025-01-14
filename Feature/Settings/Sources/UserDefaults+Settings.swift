import Foundation

extension UserDefaults {
    func string(for key: String) -> String? {
        return string(forKey: key)
    }
    
    func set(_ value: String, for key: String) {
        set(value, forKey: key)
    }
    
    func bool(for key: String) -> Bool {
        return bool(forKey: key)
    }
    
    func set(_ value: Bool, for key: String) {
        set(value, forKey: key)
    }
}