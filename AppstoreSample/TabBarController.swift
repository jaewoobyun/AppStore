//
//  TabBarVC.swift
//  AppstoreSample
//
//  Created by Nomad on 2019/10/23.
//  Copyright © 2019 Nomad. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Do any additional setup after loading the view.
		self.tabBar.alpha = 0.5
		self.tabBar.backgroundColor = UIColor.clear
		let frost = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffect.Style.light))
		frost.frame = self.tabBar.bounds
		self.tabBar.insertSubview(frost, at: 0)
	}
	
	//    init() {
	//        super.init(nibName: nil, bundle: nil)
	//
	//        let firstTab: UIViewController = TodayVC()
	//
	//        let tabs = NSArray(object: firstTab)
	//
	//        self.setViewControllers(tabs as? [UIViewController], animated: false)
	//    }
	//
	//    required init?(coder: NSCoder) {
	////        fatalError("init(coder:) has not been implemented")
	//        super.init(coder: coder)
	//    }
	
	
	/*
	// MARK: - Navigation
	
	// In a storyboard-based application, you will often want to do a little preparation before navigation
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
	// Get the new view controller using segue.destination.
	// Pass the selected object to the new view controller.
	}
	*/
	
}
