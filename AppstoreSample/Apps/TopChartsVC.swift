//
//  AppsViewController.swift
//  AppstoreSample
//
//  Created by Nomad on 2019/10/28.
//  Copyright © 2019 Nomad. All rights reserved.
//

import UIKit

class TopChartsVC: UIViewController {
	
	//MARK: - Outlets
	@IBOutlet weak var tableView: UITableView!
	@IBOutlet weak var segmentedControl: UISegmentedControl!
	
	//	var appData = AppData()
	
	var isRequesting: Bool = false
	
	let cellId = "cellId"
	
	let networkService = NetworkService()
	
	var refreshControl = UIRefreshControl()
	
	var appData: AppData?
	
	//FIXME: - ??? 질문!!
	
	var selectedCategoryID: String = AppCategory.AllApps.getCategoryID() //기본 defaualt 가  all apps.
	
	var segConfig:FeedType = .topfreeapplications
	
	//MARK: - viewDidLoad
	override func viewDidLoad() {
		super.viewDidLoad()
		
		//segmentedControl.selectedSegmentIndex = 0
		
		print("1.")
		networkService.delegate = self
//		networkService.requestGetData() //
		//TODO: - 해당 데이터를 받도록 request를 전 vc 에서 받아오는 함수 필요
		//fetchAppropriateData(type: segConfig.rawValue)
		
		
		setViewMode()
		print("2.")
		
		tableView.dataSource = self
		tableView.delegate = self
		
		self.showSpinner(onView: self.view)
		tableView.reloadData()
		
		tableView.refreshControl = refreshControl
		
		refreshControl.addTarget(self, action: #selector(refresh), for: UIControl.Event.valueChanged)
		
		
		//인디케이터 쇼.
		//		self.showSpinner(onView: self.view)
	}
	
	///외부에서 segConfig 설정 후 호출할것.
	func setViewMode() {
		if segConfig == .toppaidapplications {
			segmentedControl.selectedSegmentIndex = 1
		} else {
			segmentedControl.selectedSegmentIndex = 0
		}
		self.indexChanged(segmentedControl)
	}
	
	//MARK: - viewWillAppear
	override func viewWillAppear(_ animated: Bool) {
		//
	}
	
	func fetchAppropriateData(type: String = FeedType.topfreeapplications.rawValue, limit: String = "20", genre: String = "") {
		networkService.requestGetData(type: type, limit: limit, genre: selectedCategoryID)
	}
	
	@IBAction func showAllApps(_ sender: UIBarButtonItem) {
		
		//let navigation = self.navigationController
		let totalAppsVC = TotalAppsTableViewController()
		
		//자식뷰의 클로저 핸들러를 구현한다.
		totalAppsVC.selectHandle = { item in
			print(item, item.getCategoryID())
			self.navigationItem.rightBarButtonItem?.title = item.rawValue
			self.selectedCategoryID = item.getCategoryID()
			
			self.networkService.requestGetData(type: "topfreeapplications", limit: String(20), genre: item.getCategoryID())
			self.tableView.reloadData()
		}
		
		let navi = UINavigationController.init(rootViewController: totalAppsVC)
		self.present(navi, animated: true, completion: nil)
		
	}
	
	
	@IBAction func indexChanged(_ sender: UISegmentedControl) {
		if segmentedControl.selectedSegmentIndex == 0 {
			print("Free Apps!")
			self.networkService.requestGetData(type: "topfreeapplications", limit: String(20), genre: selectedCategoryID)
			self.tableView.reloadData()
		}
		
		if segmentedControl.selectedSegmentIndex == 1 {
			print("Paid Apps")
			self.networkService.requestGetData(type: "toppaidapplications", limit: String(20), genre: selectedCategoryID)
			self.tableView.reloadData()
		}
	}
	
	@objc func refresh() {
		print("refreshing!!!!")
		self.appData = nil
		tableView.reloadData()
		networkService.requestGetData(limit: "20")
		
	}
	
	
}

//MARK: - NetworkServiceProtocol
extension TopChartsVC: NetworkServiceProtocol {
	func failRequest() {
		self.removeSpinner()

		DispatchQueue.main.async {
			self.tableView.reloadData()
			self.isRequesting = false
			let alert = UIAlertController(title: "더 이상 데이터가 없습니다.", message: nil, preferredStyle: UIAlertController.Style.alert)
			let alertAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.cancel, handler: nil)
			alert.addAction(alertAction)
			self.present(alert, animated: true, completion: nil)
		}
	}
	
	
	func responseGetData(appData: AppData) {
		self.removeSpinner()
		refreshControl.endRefreshing()
		DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
			self.appData = nil
			self.appData = appData
			self.tableView.reloadData()
			self.isRequesting = false
		}
	}
	
//	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//		guard let appsDetailVC = segue.destination as? AppsDetailVC, let index = tableView.indexPathForSelectedRow?.row else { return }
//		appsDetailVC.entry = self.appData?.feed.entry?[index]
//
//		let storyboard = UIStoryboard(name: "Main", bundle: nil)
//		let detail = storyboard.instantiateViewController(identifier: "AppsDetailVC") as! AppsDetailVC
//		self.present(detail, animated: true, completion: nil)
//	}
	
}

//MARK: - UITableView Delegate, Datasource
extension TopChartsVC: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		//		let appData = networkService.getUsingCodable()
		
		return appData?.feed.entry!.count ?? 0
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "TestCell", for: indexPath) as! TestCell
		cell.appName.text = appData?.feed.entry?[indexPath.row].imName.label
		cell.appIcon.downloaded(from: (appData?.feed.entry?[indexPath.row].imImage[0].label)!)
		//FIXME : -
		
		cell.numberLabel.text = String(indexPath.row + 1)
//		cell.appGenre.text = (appData?.feed.entry?[indexPath.row].category.attributes.term).map { $0.rawValue }
		cell.appGenre.text = appData?.feed.entry?[indexPath.row].category.attributes.term
		cell.downloadButton.titleLabel?.text = (appData?.feed.entry?[indexPath.row].imPrice.label)
		
		
		return cell
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 80
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		let storyboard = UIStoryboard(name: "Main", bundle: nil)
		let detailVC = storyboard.instantiateViewController(withIdentifier: "AppsDetailVC") as! AppsDetailVC
		detailVC.entry = self.appData?.feed.entry?[indexPath.row]
		detailVC.rankNumber = indexPath.row
		self.navigationController?.pushViewController(detailVC, animated: true)

	}
	
	
}

//MARK: - UIScrollView Delegate
extension TopChartsVC: UIScrollViewDelegate {
	func scrollViewDidScroll(_ scrollView: UIScrollView) {
		//		print("scrollviewdidScroll point y \(scrollView.contentOffset)")
		//		print("all cell size = \((appData?.feed.entry?.count ?? 0) * 80)")
		//		print("scrollview bottom point = \(scrollView.contentOffset.y + self.tableView.frame.size.height)")
		
		var endoflist = scrollView.contentOffset.y + self.tableView.frame.size.height
		var endofdata = appData?.feed.entry?.count ?? 0
		
		if Int(endoflist) >= (endofdata * 80) + 100 && isRequesting == false {
			print("-----------reload refresh -----------------------")
			isRequesting = true
			
			self.showSpinner(onView: self.view)
			self.networkService.requestGetData(type: "topfreeapplications", limit: String(endofdata + 20), genre: "6015")
			//			self.appData = nil
			
		}
	}
	
	func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
		//		print("scrollviewdidend Decelerating  \(scrollView.contentOffset)")
	}
}

//MARK: - Cell Class
class TestCell: UITableViewCell {
	@IBOutlet weak var appIcon: UIImageView!
	@IBOutlet weak var numberLabel: UILabel!
	@IBOutlet weak var appName: UILabel!
	@IBOutlet weak var appGenre: UILabel!
	@IBOutlet weak var downloadButton: UIButton!
	
	override func awakeFromNib() {
		super.awakeFromNib()
		
		appIcon.layer.cornerRadius = 20
		appIcon.clipsToBounds = true
		appIcon.contentMode = .scaleAspectFill
		
		downloadButton.backgroundColor = UIColor.init(netHex: 0x007AFF)
//		downloadButton.titleColor(for: UIControl.State.normal) = UIColor.white
//		downloadButton.title(for: UIControl.State.normal) = "받기"
		downloadButton.layer.cornerRadius = 15
		downloadButton.clipsToBounds = true
		
		
	}
	
	
	func setCellData() {
		appIcon.layer.cornerRadius = 10
		appIcon.clipsToBounds = true
	}
}



