import UIKit
import Network

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            internetConnectivity()
        return true
    }
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    
    }
}

// MARK: InternetActivity
extension AppDelegate {
    private func internetConnectivity() {
           let monitor = NWPathMonitor()
           
           monitor.pathUpdateHandler = { path in
               if path.status == .satisfied {
                   DispatchQueue.main.async {
                       NotificationCenter.default.post(name: .internetStatus, object: true)
                   }
               } else {
                   DispatchQueue.main.async {
                       NotificationCenter.default.post(name: .internetStatus, object: false)
                   }
               }
           }
           let queue = DispatchQueue(label: "Monitor")
           monitor.start(queue: queue)
       }
}
