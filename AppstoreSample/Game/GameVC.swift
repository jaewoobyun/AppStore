//
//  GameVC.swift
//  AppstoreSample
//
//  Created by Nomad on 2019/10/23.
//  Copyright © 2019 Nomad. All rights reserved.
//

import Foundation
import UIKit

class GameVC: UIViewController {
	
	//MARK: - Outlets
	
	@IBOutlet weak var popularCollectionView: UICollectionView!
	
	@IBOutlet weak var newGamesWeLoveCollectionView: UICollectionView!
	
	@IBOutlet weak var bestNewUpdatesCollectionView: UICollectionView!
	
	@IBOutlet weak var topPaidGamesCollectionView: UICollectionView!
	
	@IBOutlet weak var topFreeGamesCollectionView: UICollectionView!
	
	//MARK: - Properties
	var appData: AppData?
	
	var topPaidAppsData: AppData?
	var topFreeAppsData: AppData?
	var newGamesWeLoveData: RssAppData?
	
	let networkService = NetworkService()
	
	var selectedAppId : String = ""
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		if #available(iOS 11.0, *) {
			self.navigationController?.navigationBar.prefersLargeTitles = true
		}
		
		networkService.delegate = self
		networkService.requestGetData(type: "topfreeapplications", limit: String(20), genre: AppCategory.Game.getCategoryID())
		
		networkService.requestGetData(type: "toppaidapplications", limit: String(20), genre: AppCategory.Game.getCategoryID())
		
		networkService.requestGetFeedAppData(countryCode: "kr", mediaType: "ios-apps", feedType: FeedType.NewGames.rawValue, limit: String(20), genre: "all")
		
		popularCollectionView.delegate = self
		popularCollectionView.dataSource = self
		
		newGamesWeLoveCollectionView.delegate = self
		newGamesWeLoveCollectionView.dataSource = self
		
		bestNewUpdatesCollectionView.delegate = self
		bestNewUpdatesCollectionView.dataSource = self
		
		topFreeGamesCollectionView.delegate = self
		topFreeGamesCollectionView.dataSource = self
		
		topPaidGamesCollectionView.delegate = self
		topPaidGamesCollectionView.dataSource = self
		
		popularCollectionView.register(UINib(nibName: "TopCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TopCollectionViewCell")
		newGamesWeLoveCollectionView.register(UINib(nibName: "AppItemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "AppItemCollectionViewCell")
		bestNewUpdatesCollectionView.register(UINib(nibName: "DoubleItemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "DoubleItemCollectionViewCell")
		topFreeGamesCollectionView.register(UINib(nibName: "AppItemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "AppItemCollectionViewCell")
		topPaidGamesCollectionView.register(UINib(nibName: "AppItemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "AppItemCollectionViewCell")
		
		self.popularCollectionView.reloadData()
		self.newGamesWeLoveCollectionView.reloadData()
		self.bestNewUpdatesCollectionView.reloadData()
		self.topFreeGamesCollectionView.reloadData()
		self.topPaidGamesCollectionView.reloadData()
	}
	
}

//MARK: - NetworkServiceProtocol
extension GameVC: NetworkServiceProtocol {
	func failRequest() {
		DispatchQueue.main.async {
			self.popularCollectionView.reloadData()
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
				self.topFreeGamesCollectionView.reloadData()
			} else {
				self.topPaidAppsData = nil
				self.topPaidAppsData = appData
				self.topPaidGamesCollectionView.reloadData()
			}
			
		} else if genre == AppCategory.Finance.getCategoryID() {
			
		}
	}
	
	func responseGetRSSData(rssData: RssAppData, countryCode: String, mediaType: String, feedType: String, limit: String, genre: String) {
		self.newGamesWeLoveData = nil
		self.newGamesWeLoveData = rssData
		self.newGamesWeLoveCollectionView.reloadData()
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
extension GameVC: UICollectionViewDataSource {
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		if collectionView == popularCollectionView {
			return appData?.feed.entry!.count ?? 0
		}
		else if collectionView == newGamesWeLoveCollectionView {
			return newGamesWeLoveData?.feed.results.count ?? 0
		}
		else if collectionView == bestNewUpdatesCollectionView {
			return newGamesWeLoveData?.feed.results.count ?? 0
		}
		else if collectionView == topFreeGamesCollectionView {
			return topFreeAppsData?.feed.entry!.count ?? 0
		}
		else if collectionView == topPaidGamesCollectionView {
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
		if collectionView == newGamesWeLoveCollectionView {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AppItemCollectionViewCell", for: indexPath) as! AppItemCollectionViewCell
			
			cell.appIconImage.layer.cornerRadius = 10
			cell.appIconImage.clipsToBounds = true
			cell.getButton.layer.cornerRadius = 15
			cell.getButton.clipsToBounds = true
			
			cell.appIconImage.downloaded(from: (newGamesWeLoveData?.feed.results[indexPath.row].artworkUrl100)!)
			cell.appNameLabel.text = newGamesWeLoveData?.feed.results[indexPath.row].name
			cell.appCategoryLabel.text = "게임"
			cell.getButton.titleLabel?.text = "GET" //
			
			return cell
		}
		if collectionView == bestNewUpdatesCollectionView {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DoubleItemCollectionViewCell", for: indexPath) as! DoubleItemCollectionViewCell
			
			cell.appIconImageView.downloaded(from: (newGamesWeLoveData?.feed.results[indexPath.row].artworkUrl100)!, contentMode: UIView.ContentMode.scaleAspectFill)
			cell.appNameLabel.text = newGamesWeLoveData?.feed.results[indexPath.row].name
//			cell.appCategoryLabel.text = newGamesWeLoveData?.feed.results[indexPath.row].genres
//			let categories = newGamesWeLoveData?.feed.results[indexPath.row].genres[indexPath.row].name
			//FIXME: - find all the genre names and append it to the cell.appCategoryLabel.text
			cell.appCategoryLabel.text = "GAME"
			
			return cell
		}
		if collectionView == topFreeGamesCollectionView {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AppItemCollectionViewCell", for: indexPath) as! AppItemCollectionViewCell
			
			cell.appIconImage.layer.cornerRadius = 10
			cell.appIconImage.clipsToBounds = true
			cell.getButton.layer.cornerRadius = 15
			cell.getButton.clipsToBounds = true
			
			cell.appIconImage.downloaded(from: (topFreeAppsData?.feed.entry?[indexPath.row].imImage[0].label)!)
			cell.appNameLabel.text = topFreeAppsData?.feed.entry?[indexPath.row].imName.label
			cell.appCategoryLabel.text = topFreeAppsData?.feed.entry?[indexPath.row].category.attributes.term
			cell.getButton.titleLabel?.text = (topFreeAppsData?.feed.entry?[indexPath.row].imPrice.label)
			cell.inAppPurchasesLabel.text = ""
			
			return cell
		}
		if collectionView == topPaidGamesCollectionView {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AppItemCollectionViewCell", for: indexPath) as! AppItemCollectionViewCell
			
			cell.appIconImage.layer.cornerRadius = 10
			cell.appIconImage.clipsToBounds = true
			cell.getButton.layer.cornerRadius = 15
			cell.getButton.clipsToBounds = true
			
			cell.appIconImage.downloaded(from: (topPaidAppsData?.feed.entry?[indexPath.row].imImage[0].label)!)
			cell.appNameLabel.text = topPaidAppsData?.feed.entry?[indexPath.row].imName.label
			cell.appCategoryLabel.text = topPaidAppsData?.feed.entry?[indexPath.row].category.attributes.term
			cell.getButton.titleLabel?.text = (topPaidAppsData?.feed.entry?[indexPath.row].imPrice.label)
			
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
extension GameVC: UICollectionViewDelegate {
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		let storyboard = UIStoryboard(name: "Main", bundle: nil)
		let detailVC = storyboard.instantiateViewController(withIdentifier: "AppsDetailVC") as! AppsDetailVC
		
		if collectionView == popularCollectionView {
			detailVC.entry = self.appData?.feed.entry?[indexPath.row]
			detailVC.rankNumber = indexPath.row
			self.navigationController?.pushViewController(detailVC, animated: true)
		}
		if collectionView == newGamesWeLoveCollectionView {
			detailVC.appID = self.newGamesWeLoveData?.feed.results[indexPath.row].id
			self.navigationController?.pushViewController(detailVC, animated: true)
		}
		if collectionView == bestNewUpdatesCollectionView {
			detailVC.appID = self.newGamesWeLoveData?.feed.results[indexPath.row].id
			self.navigationController?.pushViewController(detailVC, animated: true)
		}
		if collectionView == topPaidGamesCollectionView {
			detailVC.entry = self.topPaidAppsData?.feed.entry?[indexPath.row]
			detailVC.rankNumber = indexPath.row
			self.navigationController?.pushViewController(detailVC, animated: true)
		}
		if collectionView == topFreeGamesCollectionView {
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
extension GameVC: UICollectionViewDelegateFlowLayout {
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
