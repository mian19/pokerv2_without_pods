
import Foundation

enum CheckingTypes: String {
case onboardingo, firstEntrances
}

class UserDefaultsManagisi {
    
    private init() {}
    static let shared = UserDefaultsManagisi()


    func checkingResultis(_ checkType: CheckingTypes) -> Bool {
        guard let onb = UserDefaults.standard.value(forKey: checkType.rawValue) as? Bool else { return false }
        return onb
    }
    
    
    func savingURLa(strURL: String, key: String) {
        let defaults = UserDefaults.standard

        if URL(string: strURL) != nil {
            defaults.set(strURL, forKey: key)
        } else {
            defaults.set("https://google.com", forKey: key)
        }
 
    }
    
    func getURLaFromString(key: String) -> String {


        return  UserDefaults.standard.string(forKey: key) ?? "https://google.com"
    }

}
