//
//  AppsDetailVC.swift
//  AppstoreSample
//
//  Created by Nomad on 2019/10/29.
//  Copyright © 2019 Nomad. All rights reserved.
//

import UIKit
import SnapKit

class AppsDetailVC: UIViewController {
	
	//MARK: - Model
	var entry: Entry?
	var rankNumber: Int? = 0
	var appID: String? = ""
	var appsDetailData: AppsDetailData?
	var appReviewData: AppReviewData?
	
	//MARK: - Outlets
	@IBOutlet weak var appIcon: UIImageView!
	@IBOutlet weak var appName: UILabel!
	@IBOutlet weak var sellerName: UILabel!
	@IBOutlet weak var downloadButton: UIButton!
	@IBOutlet weak var shareButton: UIButton!
	
	@IBOutlet weak var starRating: UILabel!
	@IBOutlet weak var totalRating: UILabel!
	@IBOutlet weak var ranking: UILabel!
	@IBOutlet weak var category: UILabel!
	@IBOutlet weak var ageNumber: UILabel!
	
	
	@IBOutlet weak var iphonepreview: UIView!
	@IBOutlet weak var iPhonePreviewStack: UIStackView!
	@IBOutlet weak var iphoneView: UIView!
	
	@IBOutlet weak var iPadPreview: UIView!
	@IBOutlet weak var iPadPreviewStack: UIStackView!
	
	@IBOutlet weak var iPhoneOriPadLabel: UILabel!
	@IBOutlet weak var iphoneImage: UIImageView!
	@IBOutlet weak var openipadPreviewIcon: UIImageView!
	
	@IBOutlet weak var appDescription: UILabel!
	@IBOutlet weak var appDeveloper: UILabel!
	
	@IBOutlet weak var tapToRateView: UIView!
	
	@IBOutlet weak var userRatingLabel: UILabel!
	@IBOutlet weak var fivestarRating: UIProgressView!
	@IBOutlet weak var fourstarRating: UIProgressView!
	@IBOutlet weak var threestarRating: UIProgressView!
	@IBOutlet weak var twostarRating: UIProgressView!
	@IBOutlet weak var onestarRating: UIProgressView!
	@IBOutlet weak var totalRatingsLabel: UILabel!
	
	
	//TODO: Tap to Rate:
	
	@IBOutlet weak var ReviewCellStack: UIStackView!
	
	
	
	@IBOutlet weak var providerLabel: UILabel!
	@IBOutlet weak var sizeLabel: UILabel!
	@IBOutlet weak var categoryLabel: UILabel!
	@IBOutlet weak var compatibilityLabel: UILabel!
	@IBOutlet weak var languagesLabel: UILabel!
	@IBOutlet weak var ageRatingLabel: UILabel!
	@IBOutlet weak var copyrightLabel: UILabel!
	@IBOutlet weak var developerWebsiteLabel: UILabel!
	@IBOutlet weak var privacyPolicyLabel: UILabel!

	//TODO: More by
	@IBOutlet weak var collectionView: UICollectionView!
	
	let networkService = NetworkService()
	var isRequesting: Bool = false
	var noipadapp: Bool = true
	
	
	
	//MARK: - viewDidLoad
	override func viewDidLoad() {
		super.viewDidLoad()
		//		self.view.backgroundColor = UIColor.brown
		
		//		self.showSpinner(onView: self.view)
		
		//MARK: 우리가 조회할 앱의 APP ID
		appID = entry?.id.attributes.imID
		
		networkService.delegate = self
		networkService.requestGetAppDetailData(appId: appID!)
		networkService.requestGetAppReviewData(appId: appID!)
		
		setupLayout()
		self.collectionView.delegate = self
		self.collectionView.dataSource = self
		
		self.collectionView.register(UINib(nibName: "AppItemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "AppItemCollectionViewCell")
		
	}
	
//	func addiPhonePreviewImageViewsToStack(numberOfItems: Int) {
//		for i in numberOfItems {
//
//		}
//	}
	@objc func openLink(url: URL) {
//				let url = URL.init(string: "https://m.naver.com")!
		if UIApplication.shared.canOpenURL(url) && developerWebsiteLabel.isUserInteractionEnabled  {
			UIApplication.shared.open(url, options: [:], completionHandler: nil)
		}
	}
	
	func setupLayout() {
		appIcon.layer.cornerRadius = 20
		appIcon.clipsToBounds = true
		
		downloadButton.layer.cornerRadius = 10 // 조정 필요
		downloadButton.clipsToBounds = true
		
		appDescription.numberOfLines = 3
		
		iPadPreview.isHidden = true
		iphoneView.isHidden = true
		openipadPreviewIcon.isHidden = true
		tapToRateView.isHidden = true
		
	}
	
	@IBAction func openDescriptionAction(_ sender: UIButton) {
		sender.isSelected = !sender.isSelected
		
		if sender.isSelected {
			appDescription.numberOfLines = 0
		} else {
			appDescription.numberOfLines = 3
		}
	}
	
	@IBAction func openAction(_ sender: UIButton) {
		if noipadapp == true {
			sender.isEnabled = false
			openipadPreviewIcon.isHidden = true
			iphoneView.isHidden = true
			iPadPreview.isHidden = true
		}
		if noipadapp == false {
			sender.isEnabled = true
			openipadPreviewIcon.isHidden = true
			iphoneView.isHidden = false
			iPadPreview.isHidden = false
			iPhoneOriPadLabel.text = "iPad"
		}
	}
	
	@IBAction func onPressDeveloper(_ sender: UIButton) {
		print("user clicked Developer info")
	}
	
	@IBAction func developerWebsiteTapped(sender: UILabel!) {
		
	}
	/*
	// MARK: - Navigation
	
	// In a storyboard-based application, you will often want to do a little preparation before navigation
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
	// Get the new view controller using segue.destination.
	// Pass the selected object to the new view controller.
	}
	*/
	
}


struct Metric {
  static let numberOfLine: CGFloat = 1
  static let numberOfItem: CGFloat = 2
  
  static let leftPadding: CGFloat = 5.0
  static let rightPadding: CGFloat = 5.0
  static let topPadding: CGFloat = 5.0
  static let bottomPadding: CGFloat = 5.0
  
  static let itemSpacing: CGFloat = 10.0
  static let lineSpacing: CGFloat = 10.0
}

//MARK: - CollectionView DataSource, Delegate, DelegateFlowLayout
extension AppsDetailVC: UICollectionViewDataSource {
	
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 4
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cellData = ["1", "2", "3", "4", "5"]
		
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AppItemCollectionViewCell", for: indexPath) as! AppItemCollectionViewCell
		cell.appIconImage.downloaded(from: (entry?.imImage[0].label ?? nil)!, contentMode: UIView.ContentMode.scaleAspectFill)
		cell.appIconImage.layer.cornerRadius = 10
		cell.appIconImage.clipsToBounds = true
		
//		cell.appNameLabel.text = cellData[indexPath.row]
		cell.appNameLabel.text = entry?.imName.label
		cell.appCategoryLabel.text = entry?.category.attributes.label
		return cell
	}

}

extension AppsDetailVC: UICollectionViewDelegate {
	
}

extension AppsDetailVC: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let lineSpacing = Metric.lineSpacing * (Metric.numberOfLine - 1)
		let horizontalPadding = Metric.leftPadding + Metric.rightPadding
		let itemSpacing = Metric.itemSpacing * (Metric.numberOfItem - 1)
		let verticalPadding = Metric.topPadding + Metric.bottomPadding
		let width = (collectionView.frame.width - lineSpacing - horizontalPadding) / Metric.numberOfLine
		let height = (collectionView.frame.height - itemSpacing - verticalPadding) / Metric.numberOfItem
//		let width = self.collectionView.frame.width
		
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



extension UILabel {
	func setRatingText(value: String, hasText: Bool) {
		let doubleValue = Double(value) ?? 0.0
		self.setRatingText(value: doubleValue, hasText: hasText)
	}
	
	func setRatingText(value: Double, hasText: Bool) {
		var starRating = ""
		if value > 5.0 {
			starRating = "★★★★★"
		}
		else if value <= 5.0 && value > 4.0 {
			starRating = "★★★★★"
		}
		else if value <= 4.0 && value > 3.0 {
			starRating = "★★★★☆"
		}
		else if value <= 3.0 && value > 2.0 {
			starRating = "★★★☆☆"
		}
		else if value <= 2.0 && value > 1.0 {
			starRating = "★★☆☆☆"
		}
		else if value <= 1.0 && value > 0.0 {
			starRating = "★☆☆☆☆"
		}
		else if value == 0.0 {
			starRating = "☆☆☆☆☆"
		}
		else {
			starRating = "☆☆☆☆☆"
		}
		
		if hasText == true {
			self.text = String(value) + starRating
		}
		else {
			self.text = starRating
		}
		
	}
}

//MARK: - NetworkServiceProtocol
extension AppsDetailVC: NetworkServiceProtocol {
	
	func failRequest() {
		self.removeSpinner()
		DispatchQueue.main.async {
			self.isRequesting = false
			let alert = UIAlertController(title: "에러", message: nil, preferredStyle: UIAlertController.Style.alert)
			let alertAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.cancel, handler: nil)
			alert.addAction(alertAction)
			self.present(alert, animated: true, completion: nil)
		}
	}
	
	func responseGetAppData(appsDetailData: AppsDetailData) {
		self.removeSpinner()
		
		self.appsDetailData = nil
		self.appsDetailData = appsDetailData
		
		self.isRequesting = false
			
			
		if let result = appsDetailData.results {
			
			//MARK: Header
			
			appIcon.downloaded(from: (entry?.imImage[0].label ?? nil)!, contentMode: UIView.ContentMode.scaleAspectFill)
			
			appName.text = entry?.imName.label
			sellerName.text = entry?.imArtist.label
			
			downloadButton.titleLabel?.text = entry?.imPrice.label
			
			//MARK: Ratings & Rank & Age
			
			if let averageUserRating = result[0].averageUserRating {
				starRating.setRatingText(value: averageUserRating, hasText: true)
			}//TODO: needs logic to add stars based on double
			totalRating.text = String(describing: result[0].userRatingCount! / 1000 ) + "K Ratings"
			
			ranking.text = "No" + String(describing: rankNumber! + 1)
//			category.text = (entry?.category.attributes.label).map { $0.rawValue } //
			category.text = entry?.category.attributes.label
			
			ageNumber.text = String(describing: result[0].contentAdvisoryRating ?? "4+") //
			
			//MARK: iPhone Preview
			
			if let screenshotUrls = result[0].screenshotUrls {
				print("-------------screenshotUrls----------")
//				print(screenshotUrls)
				
				
				for v in iPhonePreviewStack.arrangedSubviews {
					v.removeFromSuperview()
				}
				// jsonData 에 screenshotUrls 가 있을 때 그 안의 String 들의 갯수만큼 iPhonePreviewStack 에 추가
				for i in screenshotUrls.indices {
					let previews: UIImageView = UIImageView(frame: CGRect.zero)
					previews.downloaded(from: screenshotUrls[i], contentMode: UIView.ContentMode.scaleAspectFit)
					previews.layer.cornerRadius = 10
					previews.clipsToBounds = true
//					previews.backgroundColor = UIColor.black
					
//					previews ==> auto ==> 200
					
					iPhonePreviewStack.addArrangedSubview(previews)
					
					let w = Double(iPhonePreviewStack.frame.size.height) * 0.56
					
					previews.snp.makeConstraints { (make) in
						make.width.equalTo(w)
						make.height.equalTo(iPhonePreviewStack)
					}
				}
				
			}
			//MARK: iPad Preview
			
			// jsonData 에 ipadScreenshotUrls 가 있을 때 그 안의 String 들의 갯수만큼 iPadPreviewStack 에 추가
			if result[0].ipadScreenshotUrls != nil {
				if let ipadScreenshotUrls = result[0].ipadScreenshotUrls, ipadScreenshotUrls.count != 0 {
					iPhoneOriPadLabel.text = "Offers iPad App"
					openipadPreviewIcon.isHidden = false
					noipadapp = false
					
					for i in ipadScreenshotUrls.indices {
						let previews: UIImageView = UIImageView(frame: CGRect.zero)
//						previews.backgroundColor = UIColor.black
						previews.layer.cornerRadius = 10
						previews.clipsToBounds = true
						
						previews.downloaded(from: ipadScreenshotUrls[i], contentMode: UIView.ContentMode.scaleAspectFit)
						iPadPreviewStack.addArrangedSubview(previews)
						
						let w = Double(iPadPreviewStack.frame.size.height)
						
						previews.snp.makeConstraints { (make) in
							make.width.equalTo(w)
							make.height.equalTo(iPadPreviewStack)
						}
					}
				}
				
			}
			else {
				iPhoneOriPadLabel.text = "iPhone only"
				openipadPreviewIcon.isHidden = true
				noipadapp = true
			}
			
			//MARK: Summary
			appDescription.text = entry?.summary.label
			
			
			//MARK: Developer
			appDeveloper.text = result[0].artistName!
			
			//MARK: Ratings & Reviews
			userRatingLabel.text = String(describing: result[0].averageUserRating!)
			totalRatingsLabel.text = String(describing: result[0].userRatingCount!) + "Ratings"
			
			
			//MARK: What's New
			
			
			
			//MARK: Information
			providerLabel.text = String(describing: result[0].artistName!)
//			sizeLabel.text = String(describing: result[0].fileSizeBytes! )
			if let fileSizeBytes = result[0].fileSizeBytes!.toInt() {
				let fileSizeMB = fileSizeBytes / 1000000
				sizeLabel.text =  String(fileSizeMB) + "MB"
			}
//			category.text = (entry?.category.attributes.term).map { $0.rawValue } //
			categoryLabel.text = entry?.category.attributes.term ?? "none"
			compatibilityLabel.text = "Works on this iPhone" //TODO: needs logic to change the text if the software is compatible with the device
			languagesLabel.text = "English and Korean" //TODO: needs logic to handle what kind of languages are supported
			ageRatingLabel.text = String(describing: result[0].contentAdvisoryRating!)
			//		developerWebsiteLabel.text =
			let attributedString = NSMutableAttributedString(string: "Developer Website")
//			let url = URL(string: String(describing: result[0].trackViewURL))!
//			if let urlString = result[0].trackViewURL {
//				let url = URL(string: urlString)
			let url = URL.init(string: result[0].trackViewURL ?? "https://m.naver.com")
			attributedString.setAttributes([.link: url!], range: NSMakeRange(0, attributedString.length))
			developerWebsiteLabel.attributedText = attributedString
			developerWebsiteLabel.isUserInteractionEnabled = true
			
			copyrightLabel.text = entry?.rights.label ?? "none"
			
		}
		
		

		
	}
	

	
	func responseGetReviewData(appReviewData: AppReviewData) {
		self.appReviewData = nil
		self.appReviewData = appReviewData
		print("!!!!!!!!!!!!!REQUESTING REVIEW DATA COMPLETE!!!!!!!!!!!!")
		
		self.isRequesting = false
		
		var totalFiveRatings:Float = 0
		var totalFourRatings:Float = 0
		var totalThreeRatings:Float = 0
		var totalTwoRatings:Float = 0
		var totalOneRatings:Float = 0
		var totalZeroRatings:Float = 0
		
		if let entry = appReviewData.feed?.entry {
			for i in 0..<entry.count {
				if entry[i].imRating?.label == "5" {
					totalFiveRatings += 1
				}
				if entry[i].imRating?.label == "4" {
					totalFourRatings += 1
				}
				if entry[i].imRating?.label == "3" {
					totalThreeRatings += 1
				}
				if entry[i].imRating?.label == "2" {
					totalTwoRatings += 1
				}
				if entry[i].imRating?.label == "1" {
					totalOneRatings += 1
				}
				if entry[i].imRating?.label == "0" {
					totalZeroRatings += 1
				}
			}
		}
		
		self.fivestarRating.setProgress(totalFiveRatings / 50, animated: true)
		self.fourstarRating.setProgress(totalFourRatings / 50, animated: true)
		self.threestarRating.setProgress(totalThreeRatings / 50, animated: true)
		self.twostarRating.setProgress(totalTwoRatings / 50, animated: true)
		self.onestarRating.setProgress(totalOneRatings / 50, animated: true)
		
//		let reviewData:[String] = ["1","2","3","4","5"]
//		for i in 0..<reviewData.count {
//			let view = Bundle.loadView(fromNib: "ReviewCell", withType: ReviewCell.self)
//			ReviewCellStack.addArrangedSubview(view)
//			view.snp.makeConstraints { (make) in
//				make.width.equalTo(300)
//			}
//		}

//		let entry = appReviewData.feed?.entry ?? []
//		print(appReviewData.feed?.entry?[0].author)
//		for i in 0..<entry.count {
//			if i == 0 {
////				entry[i]. ????
//			}
//		}
		
//		if let entry = appReviewData.feed?.entry, entry.count > 0 {
//			for i in 0..<entry.count {
//				if i == 0 {
//					//i번째 데이터가 없다. 내가원하는 데이터가 없는듯?
//					entry[0]
//				}
//			}
//		} else {
//			//아예 엔트리가 없다. 이떄는 통신 불안정으로 처리한다.
//		}
//		for i in 0..<(appReviewData.feed?.entry ?? []).count {
//
//		}

		
		guard let feed = appReviewData.feed else {
			print("Error: No feed?")
			return
		}
		
		guard let entry = feed.entry else {
			print("Error: No Entry?")
			return
		}
		
		for index in 0..<entry.count {
			let data = entry[index]
			
			let reviewCellInstance = Bundle.loadView(fromNib: "ReviewCell", withType: ReviewCell.self)
			reviewCellInstance.wrapper.layer.cornerRadius = 10
			reviewCellInstance.wrapper.clipsToBounds = true
			
			reviewCellInstance.titleLabel.text = data.title?.label
			reviewCellInstance.dateLabel.text = "Today for now?" //TODO: change
//
//			var starRating = ""
//			if data.imRating?.label == "5" {
//				starRating = "★★★★★"
//			}
//			else if data.imRating?.label == "4" {
//				starRating = "★★★★☆"
//			}
//			else if data.imRating?.label == "3" {
//				starRating = "★★★☆☆"
//			}
//			else if data.imRating?.label == "2" {
//				starRating = "★★☆☆☆"
//			}
//			else if data.imRating?.label == "1" {
//				starRating = "★☆☆☆☆"
//			}
//			else if data.imRating?.label == "0" {
//				starRating = "☆☆☆☆☆"
//			}
			
			let starRating = data.imRating?.label ?? "0"
			reviewCellInstance.fiveStarLabel.setRatingText(value: starRating, hasText: false)
			reviewCellInstance.nicknameLabel.text = data.author?.name?.label
			reviewCellInstance.reviewContentLabel.text = data.content?.label
			
			ReviewCellStack.addArrangedSubview(reviewCellInstance)
			
			let w = Double(UIScreen.main.bounds.size.width)
			
			reviewCellInstance.snp.makeConstraints { (make) in
				make.width.equalTo(w)
			}
//			if index == 1 {
//				let oneData = entry[1]
//				//카운트가 1개라면
//				//여긴 절대 못들어옴.
//			}
		}
		
	}
	
	
}
