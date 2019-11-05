//
//  TodayVCViewController.swift
//  AppstoreSample
//
//  Created by Nomad on 2019/10/23.
//  Copyright © 2019 Nomad. All rights reserved.
//

import UIKit

class TodayVC: UIViewController {
	
	let transition = PopAnimator()
	
	@IBOutlet weak var tableView: UITableView!
	
	lazy var tableViewCellOriginFrame = CGRect.zero //for animation purposes
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		self.transitioningDelegate = self
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		//
		transition.dismissCompletion = {
			self.tableViewCellOriginFrame = CGRect.zero  //???
		}

		self.tableView.register(HeaderTableViewCell.nib, forCellReuseIdentifier: "HeaderTableViewCell")
		self.tableView.register(ListCell.nib, forCellReuseIdentifier: "ListCell")
		self.tableView.register(RecommendCell.nib, forCellReuseIdentifier: "RecommendCell")
		
	}
	
	override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
		super.viewWillTransition(to: size, with: coordinator)
		coordinator.animate(alongsideTransition: { (context) in
			
		}, completion: nil)
	}
	
	
}

extension TodayVC {
	
}


//MARK: - TableViewDataSource & Delegate
extension TodayVC: UITableViewDataSource, UITableViewDelegate {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 7
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		//		if indexPath.row == 0 {
		//			let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderTableViewCell", for: indexPath) as! HeaderTableViewCell
		//			return cell
		//		}
		//		else if indexPath.row == 1 {
		//			guard let cell = tableView.dequeueReusableCell(withIdentifier: "TodayItemCell", for: indexPath) as? TodayItemCell else { return UITableViewCell()}
		//
		//			return cell
		//		}
		//		else if indexPath.row == 2 {
		//			guard let cell = tableView.dequeueReusableCell(withIdentifier: "appListTableViewCell", for: indexPath) as? appListTableViewCell else { return UITableViewCell() }
		//			return cell
		//		}
		//		else  {
		//			let cell = tableView.dequeueReusableCell(withIdentifier: "TransferCodeCell", for: indexPath)
		//			return cell
		//		}
		
		switch indexPath.row {
		case 0:
			let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderTableViewCell", for: indexPath) as! HeaderTableViewCell
			return cell
		case 1:
			let cell = tableView.dequeueReusableCell(withIdentifier: "TodayItemCell", for: indexPath) as! TodayItemCell
			return cell
		case 2:
			let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath) as! ListCell
			return cell
		case 3:
			let cell = tableView.dequeueReusableCell(withIdentifier: "RecommendCell", for: indexPath) as! RecommendCell
			return cell
		default:
			let cell = tableView.dequeueReusableCell(withIdentifier: "TodayItemCell", for: indexPath)
			return cell
		}
		
		
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		//		if indexPath.row == 0 {
		//			return 100
		//		}
		//		else if indexPath.row == 1 {
		//			return 450
		//		}
		//		else if indexPath.row == 2 {
		//			return 450
		//		}
		//		else {
		//			return 400
		//		}
		switch indexPath.row {
		case 0:
			return 100
		default :
			return 450
		}
		
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
		tableView.deselectRow(at: indexPath, animated: true)
		
		
		self.tableViewCellOriginFrame = self.tableView.rectForRow(at: indexPath)
		
		let detailController = DetailController()
//		detailController.transitioningDelegate = self
		
		self.present(detailController, animated: true, completion: nil)
		
//		self.show(detailController, sender: nil)
		
	}
	
}


//MARK: - UIViewControllerTransitioningDelegate
extension TodayVC: UIViewControllerTransitioningDelegate {
	func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
		
		transition.originFrame = tableViewCellOriginFrame
		
		transition.presenting = true
		
		return transition
	}
	
	func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
		transition.presenting = false
		return transition
	}
}
