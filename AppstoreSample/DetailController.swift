//
//  DetailController.swift
//  AppstoreSample
//
//  Created by Nomad on 2019/10/25.
//  Copyright © 2019 Nomad. All rights reserved.
//

import Foundation
import UIKit

class DetailController: UIViewController {
	
	var imageView: UIImageView = {
		let imageView = UIImageView()
		
		return imageView
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.view.addSubview(imageView)
		
		imageView.frame = view.frame
		imageView.image = UIImage(named: "contentImage")
		
		view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(actionClose(_:))))
	}
	
	@objc func actionClose(_ tap: UITapGestureRecognizer) {
		presentingViewController?.dismiss(animated: true, completion: nil)
	}
	
	
}
