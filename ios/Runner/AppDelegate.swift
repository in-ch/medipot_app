import UIKit
import Flutter
import GoogleMaps

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    if #available(iOS 10.0, *) {
      UNUserNotificationCenter.current().delegate = self as? UNUserNotificationCenterDelegate
    }
    GeneratedPluginRegistrant.register(with: self)
    GMSServices.provideAPIKey("AIzaSyB0EmUeUH38p_PUfV-jIZZlbuAexa6RoxA")

    NotificationCenter.default.addObserver(self, selector: #selector(handleScreenCapture), name: UIScreen.capturedDidChangeNotification, object: nil)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  @objc func handleScreenCapture() {
    if UIScreen.main.isCaptured {
        print("스크린샷이 캡처되었습니다!")

        hideSensitiveInformation()
    } else {
        restoreSensitiveInformation()
    }
  }

  func hideSensitiveInformation() {
    if let rootViewController = window?.rootViewController {
        let overlayView = UIView(frame: rootViewController.view.bounds)
        overlayView.backgroundColor = UIColor.black
        overlayView.tag = 999
        rootViewController.view.addSubview(overlayView)
    }
  }

  func restoreSensitiveInformation() {
    if let rootViewController = window?.rootViewController {
        if let overlayView = rootViewController.view.viewWithTag(999) {
            overlayView.removeFromSuperview()  
        }
    }
  }
}
