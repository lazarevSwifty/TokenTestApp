import UIKit
import Network

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

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
           
           //            print(path.isExpensive)
           
           let queue = DispatchQueue(label: "Monitor")
           monitor.start(queue: queue)
       }


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            internetConnectivity()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

