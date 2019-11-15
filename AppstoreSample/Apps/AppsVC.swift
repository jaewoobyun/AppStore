//
//  GameVC.swift
//  AppstoreSample
//
//  Created by Nomad on 2019/10/23.
//  Copyright © 2019 Nomad. All rights reserved.
//

import Foundation
import UIKit

class AppsVC: UIViewController {
	
	enum DisplayType {
		case Apps
		case Game
		
		func getTitle() -> String {
			switch self {
			case .Apps: return "APPS"
			case .Game: return "GAMES"
			}
		}
		
		func getAppCategory() -> AppCategory {
			switch self {
			case .Apps: return .AllApps
			case .Game: return .Game
			}
		}
		
		func getFeedType() -> FeedType {
			switch self {
			case .Apps: return .NewApps
			case .Game: return .NewGames
			}
		}
	}
	
	var displayType:DisplayType = .Apps
	
	//MARK: - Outlets
	@IBOutlet weak var popularTitle: UILabel!
	@IBOutlet weak var popularCollectionView: UICollectionView!
	
	@IBOutlet weak var newWeLoveTitle: UILabel!
	@IBOutlet weak var newWeLoveCollectionView: UICollectionView!
	
	@IBOutlet weak var bestNewUpdateTitle: UILabel!
	@IBOutlet weak var bestNewUpdatesCollectionView: UICollectionView!
	
	@IBOutlet weak var topPaidTitle: UILabel!
	@IBOutlet weak var topPaidCollectionView: UICollectionView!
	
	@IBOutlet weak var topFreeTitle: UILabel!
	@IBOutlet weak var topFreeCollectionView: UICollectionView!
	
	//MARK: - Properties
	var appData: AppData?
	
	var topPaidAppsData: AppData?
	var topFreeAppsData: AppData?
	var newWeLoveData: RssAppData?
	
	let networkService = NetworkService()
	
	var selectedAppId : String = ""
	
	
	
	@IBAction func seeAllButton(_ sender: AnyObject) {
		guard let button = sender as? UIButton else { return }
		
		switch button.tag {
		case 0:
			print("0, popular")
		case 1:
			print("1, new we love")
		case 2:
			print("2, best new updates")
		case 3:
			print("3, top paid")
			let storyboard = UIStoryboard(name: "Main", bundle: nil)
			let topCharts = storyboard.instantiateViewController(identifier: "TopCharts") as! TopChartsVC
			topCharts.segConfig = .toppaidapplications
			
			if displayType == .Apps {
				topCharts.selectedCategoryID = AppCategory.AllApps.getCategoryID()
				
			} else if displayType == .Game {
				topCharts.selectedCategoryID = AppCategory.Game.getCategoryID()
			}
			
			self.navigationController?.pushViewController(topCharts, animated: true)
		case 4:
			print("4, top free")
			let storyboard = UIStoryboard(name: "Main", bundle: nil)
			let topCharts = storyboard.instantiateViewController(withIdentifier: "TopCharts") as! TopChartsVC
			topCharts.segConfig = .topfreeapplications
			
			if displayType == .Apps {
				topCharts.selectedCategoryID = AppCategory.AllApps.getCategoryID()
			}
			else if displayType == .Game {
				topCharts.selectedCategoryID = AppCategory.Game.getCategoryID()
			}

			self.navigationController?.pushViewController(topCharts, animated: true)
		default:
			print("Unknown ????")
			return
		}
	}
	
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		if self.navigationController?.tabBarController?.selectedIndex == 2 {
			displayType = .Apps
		} else {
			displayType = .Game
		}
		
		if #available(iOS 11.0, *) {
			self.navigationController?.navigationBar.prefersLargeTitles = true
			self.title = displayType.getTitle()
		}
		
		popularTitle.text = "Popular \(displayType.getTitle())"
		newWeLoveTitle.text = "New \(displayType.getTitle()) We Love"
		bestNewUpdateTitle.text = "Best New Updates"
		topPaidTitle.text = "Top Paid \(displayType.getTitle())"
		topFreeTitle.text = "Top Free \(displayType.getTitle())"
		
		networkService.requestGetData(type: "topfreeapplications", limit: String(20), genre: displayType.getAppCategory().getCategoryID())
		networkService.requestGetData(type: "toppaidapplications", limit: String(20), genre: displayType.getAppCategory().getCategoryID())
		networkService.requestGetFeedAppData(countryCode: "kr", mediaType: "ios-apps", feedType: displayType.getFeedType().rawValue, limit: String(20), genre: "all")
		
//		let tabbarVC = self.navigationController?.tabBarController
//		print(tabbarVC)
		
		networkService.delegate = self
		

//		networkService.requestGetData(type: "topfreeapplications", limit: String(20), genre: AppCategory.Game.getCategoryID())
//		networkService.requestGetData(type: "toppaidapplications", limit: String(20), genre: AppCategory.Game.getCategoryID())
//		networkService.requestGetFeedAppData(countryCode: "kr", mediaType: "ios-apps", feedType: FeedType.NewGames.rawValue, limit: String(20), genre: "all")
		
		popularCollectionView.delegate = self
		popularCollectionView.dataSource = self
		
		newWeLoveCollectionView.delegate = self
		newWeLoveCollectionView.dataSource = self
		
		bestNewUpdatesCollectionView.delegate = self
		bestNewUpdatesCollectionView.dataSource = self
		
		topFreeCollectionView.delegate = self
		topFreeCollectionView.dataSource = self
		
		topPaidCollectionView.delegate = self
		topPaidCollectionView.dataSource = self
		
		popularCollectionView.register(UINib(nibName: "TopCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TopCollectionViewCell")
		newWeLoveCollectionView.register(UINib(nibName: "AppItemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "AppItemCollectionViewCell")
		bestNewUpdatesCollectionView.register(UINib(nibName: "DoubleItemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "DoubleItemCollectionViewCell")
		topFreeCollectionView.register(UINib(nibName: "AppItemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "AppItemCollectionViewCell")
		topPaidCollectionView.register(UINib(nibName: "AppItemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "AppItemCollectionViewCell")
		
		self.popularCollectionView.reloadData()
		self.newWeLoveCollectionView.reloadData()
		self.bestNewUpdatesCollectionView.reloadData()
		self.topFreeCollectionView.reloadData()
		self.topPaidCollectionView.reloadData()
	}
	
}

//MARK: - NetworkServiceProtocol
extension AppsVC: NetworkServiceProtocol {
	func failRequest() {
		DispatchQueue.main.async {
			self.popularCollectionView.reloadData()
			self.newWeLoveCollectionView.reloadData()
			self.bestNewUpdatesCollectionView.reloadData()
			self.topPaidCollectionView.reloadData()
			self.topFreeCollectionView.reloadData()
		}
	}
	
//	func responseGetData(appData: AppData) {
//		DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//			self.appData = nil
//			self.appData = appData
//			self.popularCollectionView.reloadData()
//			//
//		}
//	}
	
	func responseGetData(appData: AppData, genre: String, isFree:Bool) {
		if genre == AppCategory.Game.getCategoryID() {
			self.appData = nil
			self.appData = appData
			self.popularCollectionView.reloadData()
			
			if isFree {
				self.topFreeAppsData = nil
				self.topFreeAppsData = appData
				self.topFreeCollectionView.reloadData()
			} else {
				self.topPaidAppsData = nil
				self.topPaidAppsData = appData
				self.topPaidCollectionView.reloadData()
			}
			
		}
		else if genre == AppCategory.AllApps.getCategoryID() {
			self.appData = nil
			self.appData = appData
			self.popularCollectionView.reloadData()
			
			if isFree {
				self.topFreeAppsData = nil
				self.topFreeAppsData = appData
				self.topFreeCollectionView.reloadData()
			} else {
				self.topPaidAppsData = nil
				self.topPaidAppsData = appData
				self.topPaidCollectionView.reloadData()
			}
		}
	}
	
	func responseGetRSSData(rssData: RssAppData, countryCode: String, mediaType: String, feedType: String, limit: String, genre: String) {
		self.newWeLoveData = nil
		self.newWeLoveData = rssData
		self.newWeLoveCollectionView.reloadData()
		self.bestNewUpdatesCollectionView.reloadData()
		}
	}
	
//	func topFreeGames(gameData: AppData) {
//		DispatchQueue.main.async {
//
//		}
//	}
//
//	func topPaidGames(gameData: AppData) {
//		DispatchQueue.main.async {
//
//		}
//	}


//MARK: - UICollectionViewDataSource
extension AppsVC: UICollectionViewDataSource {
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		if collectionView == popularCollectionView {
			return appData?.feed.entry!.count ?? 0
		}
		else if collectionView == newWeLoveCollectionView {
			return newWeLoveData?.feed.results.count ?? 0
		}
		else if collectionView == bestNewUpdatesCollectionView {
			return newWeLoveData?.feed.results.count ?? 0
		}
		else if collectionView == topFreeCollectionView {
			return topFreeAppsData?.feed.entry!.count ?? 0
		}
		else if collectionView == topPaidCollectionView {
			return topPaidAppsData?.feed.entry!.count ?? 0
		}
		
		else {
			return 0
		}
		
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AppItemCollectionViewCell", for: indexPath) as! AppItemCollectionViewCell
//
//		cell.appIconImage.layer.cornerRadius = 10
//		cell.appIconImage.clipsToBounds = true
//		cell.getButton.layer.cornerRadius = 15
//		cell.getButton.clipsToBounds = true
		
		if collectionView == popularCollectionView {
//			cell.appIconImage.downloaded(from: (appData?.feed.entry?[indexPath.row].imImage[0].label)!)
//
//			cell.appNameLabel.text = appData?.feed.entry?[indexPath.row].imName.label
//			cell.appCategoryLabel.text = appData?.feed.entry?[indexPath.row].category.attributes.term
//
//			cell.getButton.titleLabel?.text = (appData?.feed.entry?[indexPath.row].imPrice.label)
//
//			return cell
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopCollectionViewCell", for: indexPath) as! TopCollectionViewCell
			cell.featuredLabel.text = "New Game"
			cell.appNameLabel.text = appData?.feed.entry?[indexPath.row].imName.label
			cell.categoryLabel.text = appData?.feed.entry?[indexPath.row].category.attributes.label
			cell.imageView.downloaded(from: (appData?.feed.entry?[indexPath.row].link[1].attributes.href)!)

			return cell
		}
		if collectionView == newWeLoveCollectionView {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AppItemCollectionViewCell", for: indexPath) as! AppItemCollectionViewCell
			
			cell.appIconImage.downloaded(from: (newWeLoveData?.feed.results[indexPath.row].artworkUrl100)!)
			cell.appNameLabel.text = newWeLoveData?.feed.results[indexPath.row].name
			cell.appCategoryLabel.text = "게임"
			cell.getButton.titleLabel?.text = "GET" //
			
			cell.setCellLayer()
			return cell
		}
		if collectionView == bestNewUpdatesCollectionView {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DoubleItemCollectionViewCell", for: indexPath) as! DoubleItemCollectionViewCell
			
			cell.appIconImageView.downloaded(from: (newWeLoveData?.feed.results[indexPath.row].artworkUrl100)!, contentMode: UIView.ContentMode.scaleAspectFill)
			cell.appNameLabel.text = newWeLoveData?.feed.results[indexPath.row].name
//			cell.appCategoryLabel.text = newGamesWeLoveData?.feed.results[indexPath.row].genres
//			let categories = newGamesWeLoveData?.feed.results[indexPath.row].genres[indexPath.row].name
			//FIXME: - find all the genre names and append it to the cell.appCategoryLabel.text
			cell.appCategoryLabel.text = "GAME"
			
			return cell
		}
		if collectionView == topFreeCollectionView {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AppItemCollectionViewCell", for: indexPath) as! AppItemCollectionViewCell
			
			if let data = topFreeAppsData?.feed.entry?[indexPath.row] {
				cell.setCellData(data)
			}
			
			cell.setCellLayer()
			return cell
		}
		if collectionView == topPaidCollectionView {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AppItemCollectionViewCell", for: indexPath) as! AppItemCollectionViewCell
			
			if let data = topPaidAppsData?.feed.entry?[indexPath.row] {
				cell.setCellData(data)
			}
			
			cell.setCellLayer()
			return cell
		}

//		cell.appIconImage.downloaded(from: (appData?.feed.entry?[indexPath.row].imImage[0].label)!)
//		cell.appIconImage.layer.cornerRadius = 10
//		cell.appIconImage.clipsToBounds = true
//
//		cell.appNameLabel.text = appData?.feed.entry?[indexPath.row].imName.label
//		cell.appCategoryLabel.text = appData?.feed.entry?[indexPath.row].category.attributes.term
//
//		cell.getButton.titleLabel?.text = (appData?.feed.entry?[indexPath.row].imPrice.label)
//		cell.getButton.layer.cornerRadius = 15
//		cell.getButton.clipsToBounds = true
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AppItemCollectionViewCell", for: indexPath) as! AppItemCollectionViewCell

		return cell
	}

}

//MARK: - UICollectionView Delegate
extension AppsVC: UICollectionViewDelegate {
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		let storyboard = UIStoryboard(name: "Main", bundle: nil)
		let detailVC = storyboard.instantiateViewController(withIdentifier: "AppsDetailVC") as! AppsDetailVC
		
		if collectionView == popularCollectionView {
			detailVC.entry = self.appData?.feed.entry?[indexPath.row]
			detailVC.rankNumber = indexPath.row
			self.navigationController?.pushViewController(detailVC, animated: true)
		}
		if collectionView == newWeLoveCollectionView {
			detailVC.appID = self.newWeLoveData?.feed.results[indexPath.row].id
			self.navigationController?.pushViewController(detailVC, animated: true)
		}
		if collectionView == bestNewUpdatesCollectionView {
			detailVC.appID = self.newWeLoveData?.feed.results[indexPath.row].id
			self.navigationController?.pushViewController(detailVC, animated: true)
		}
		if collectionView == topPaidCollectionView {
			detailVC.entry = self.topPaidAppsData?.feed.entry?[indexPath.row]
			detailVC.rankNumber = indexPath.row
			self.navigationController?.pushViewController(detailVC, animated: true)
		}
		if collectionView == topFreeCollectionView {
			detailVC.entry = self.topFreeAppsData?.feed.entry?[indexPath.row]
			detailVC.rankNumber = indexPath.row
			self.navigationController?.pushViewController(detailVC, animated: true)
		}
		
//		detailVC.entry = self.appData?.feed.entry?[indexPath.row]
//		detailVC.rankNumber = indexPath.row
//		self.navigationController?.pushViewController(detailVC, animated: true)
	}

}

//MARK: - UICollectionViewDelegateFlowLayout
extension AppsVC: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		
		let lineSpacing = Metric.lineSpacing * (Metric.numberOfLine - 1)
		let horizontalPadding = Metric.leftPadding + Metric.rightPadding
		let itemSpacing = Metric.itemSpacing * (Metric.threeItems - 1)
		let verticalPadding = Metric.topPadding + Metric.bottomPadding
		let width = (collectionView.frame.width - lineSpacing - horizontalPadding) / Metric.numberOfLine
		let height = (collectionView.frame.height - itemSpacing - verticalPadding) / Metric.threeItems
		
//		if collectionView == popularCollectionView {
//			return CGSize(width: width, height: height)
//		}
//		else if collectionView == topFreeAppsCollectionView {
//			return CGSize(width: width, height: height)
//		}
//		else if collectionView == topPaidAppsCollectionView {
//			return CGSize(width: width, height: height)
//		}
		
		if collectionView == popularCollectionView {
			let width = (collectionView.frame.width - 10)
			let height = (collectionView.frame.height - 10)
			return CGSize(width: width, height: height)
		}
		if collectionView == bestNewUpdatesCollectionView {
			let lineSpacing = Metric.lineSpacing * (Metric.numberOfLine - 1)
			let horizontalPadding = Metric.leftPadding + Metric.rightPadding
			let itemSpacing = Metric.itemSpacing * (Metric.twoItems - 1)
			let verticalPadding = Metric.topPadding + Metric.bottomPadding
			let width = (collectionView.frame.width - lineSpacing - horizontalPadding) / Metric.numberOfLine
			let height = (collectionView.frame.height - itemSpacing - verticalPadding) / Metric.twoItems
			return CGSize(width: width, height: height)
		}
		
		return CGSize(width: width, height: height)
		
	}

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return Metric.lineSpacing
	}

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
		return Metric.lineSpacing
	}

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		return UIEdgeInsets(top: Metric.topPadding, left: Metric.leftPadding, bottom: Metric.bottomPadding, right: Metric.rightPadding)
	}
}
