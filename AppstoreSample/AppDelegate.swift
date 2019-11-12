//
//  AppDelegate.swift
//  AppstoreSample
//
//  Created by Nomad on 2019/10/23.
//  Copyright © 2019 Nomad. All rights reserved.
//

import UIKit

class Category3: UIImage {
	var categoryName: String = ""
	var categoryId: String = ""
	
	func getCategoryName() {
		
	}
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
	
	var window: UIWindow?
	
	//
//	var array: [Category] = [ .Books, .Finance, .Education, .Game]
	
//	enum Category: String {
//		case Finance = "Finanace"
//		case Books = "Books"
//		case Education = "Education"
//		case Game = "Game"
//
////		func getTitle() -> String {
////			switch self {
////			case .Finance:
////				return "Finanace"
////			case .Books:
////				return "Books"
////			case .Education:
////				return "Education"
////			}
////		}
//
//		func getCategoryID() -> String {
//			switch self {
//			case .Finance:
//				return "6015"
//			default :
//				return "1000"
//			}
//		}
//	}
	
	struct Category2 {
		var categoryName: String
		var categoryID: String
		
	}
	
	//
	
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		// Override point for customization after application launch.
		
		self.window = UIWindow(frame: UIScreen.main.bounds)
		let storyboard = UIStoryboard(name: "Main", bundle: nil)
		let vc = storyboard.instantiateViewController(withIdentifier: "TabBarController")
		self.window?.rootViewController = vc
		self.window?.makeKeyAndVisible()
		
//		array[0].rawValue
		
		let finance = Category2.init(categoryName: "Finance", categoryID: "6015")
		let array2:[Category2] = [finance]
		array2[0].categoryName
		
		
		let game = Category3.init()
		game.categoryName = "Game"
		game.categoryId = "1000"
		
		let array3:[Category3] = [game]
		array3[0].categoryName = "Game"
		
		
		
		return true
	}
	
	// MARK: UISceneSession Lifecycle
	
//	func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
//		// Called when a new scene session is being created.
//		// Use this method to select a configuration to create the new scene with.
//		return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
//	}
//	
//	func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
//		// Called when the user discards a scene session.
//		// If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//		// Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//	}
	
	
}
