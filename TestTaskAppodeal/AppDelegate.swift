import UIKit
import Appodeal

@main
class AppDelegate: UIResponder, UIApplicationDelegate, AppodealInitializationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        Appodeal.setAutocache(true, types: .interstitial)
        Appodeal.setLogLevel(.verbose)
        Appodeal.setTestingEnabled(true)

        Appodeal.setInitializationDelegate(self)

        Appodeal.initialize(
            withApiKey: "0ef0cc5cb3530375b4931315f508608d594455cb8a51a88a",
            types: [.interstitial, .banner, .nativeAd, .rewardedVideo]
        )
        
        return true
    }
    
    func appodealSDKDidInitialize() {
        
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

