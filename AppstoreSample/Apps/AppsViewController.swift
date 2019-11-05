//
//  AppsViewController.swift
//  AppstoreSample
//
//  Created by Nomad on 2019/10/28.
//  Copyright © 2019 Nomad. All rights reserved.
//

import UIKit

class AppsViewController: UIViewController {
	
	//MARK: - Outlets
	@IBOutlet weak var tableView: UITableView!
	@IBOutlet weak var segmentedControl: UISegmentedControl!
	
	//	var financeData = FinanceData()
	
	var isRequesting: Bool = false
	
	let cellId = "cellId"
	
	let networkService = NetworkService()
	
	var refreshControl = UIRefreshControl()
	
	var financeData: FinanceData?
	
	//MARK: - viewDidLoad
	override func viewDidLoad() {
		super.viewDidLoad()
		
		segmentedControl.selectedSegmentIndex = 0
		
		print("1.")
		networkService.delegate = self
		networkService.requestGetData()
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
	
	//MARK: - viewWillAppear
	override func viewWillAppear(_ animated: Bool) {
		//
	}
	
	@IBAction func indexChanged(_ sender: UISegmentedControl) {
		if segmentedControl.selectedSegmentIndex == 0 {
			print("Free Apps!")
			self.networkService.requestGetData(type: "topfreeapplications", limit: String(20), genre: "6015")
			self.tableView.reloadData()
		}
		
		if segmentedControl.selectedSegmentIndex == 1 {
			print("Paid Apps")
			self.networkService.requestGetData(type: "toppaidapplications", limit: String(20), genre: "6015")
			self.tableView.reloadData()
		}
	}
	
	@objc func refresh() {
		print("refreshing!!!!")
		self.financeData = nil
		tableView.reloadData()
		networkService.requestGetData(limit: "20")
		
	}
	
	
}

//MARK: - NetworkServiceProtocol
extension AppsViewController: NetworkServiceProtocol {
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
	
	
	func responseGetData(financeData: FinanceData) {
		self.removeSpinner()
		refreshControl.endRefreshing()
		DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
			self.financeData = nil
			self.financeData = financeData
			self.tableView.reloadData()
			self.isRequesting = false
		}
	}
	
//	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//		guard let appsDetailVC = segue.destination as? AppsDetailVC, let index = tableView.indexPathForSelectedRow?.row else { return }
//		appsDetailVC.entry = self.financeData?.feed.entry?[index]
//
//		let storyboard = UIStoryboard(name: "Main", bundle: nil)
//		let detail = storyboard.instantiateViewController(identifier: "AppsDetailVC") as! AppsDetailVC
//		self.present(detail, animated: true, completion: nil)
//	}
	
}

//MARK: - UITableView Delegate, Datasource
extension AppsViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		//		let financeData = networkService.getUsingCodable()
		
		return financeData?.feed.entry!.count ?? 0
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "TestCell", for: indexPath) as! TestCell
		cell.appName.text = financeData?.feed.entry?[indexPath.row].imName.label
		cell.appIcon.downloaded(from: (financeData?.feed.entry?[indexPath.row].imImage[0].label)!)
		//FIXME : -
		
		cell.numberLabel.text = String(indexPath.row + 1)
//		cell.appGenre.text = (financeData?.feed.entry?[indexPath.row].category.attributes.term).map { $0.rawValue }
		cell.appGenre.text = financeData?.feed.entry?[indexPath.row].category.attributes.term
		cell.downloadButton.titleLabel?.text = (financeData?.feed.entry?[indexPath.row].imPrice.label)
		//		cell.setCellData()
		
		
		return cell
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 80
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		let storyboard = UIStoryboard(name: "Main", bundle: nil)
		let detailVC = storyboard.instantiateViewController(withIdentifier: "AppsDetailVC") as! AppsDetailVC
		detailVC.entry = self.financeData?.feed.entry?[indexPath.row]
		detailVC.rankNumber = indexPath.row
		self.navigationController?.pushViewController(detailVC, animated: true)

	}
	
	
}

//MARK: - UIScrollView Delegate
extension AppsViewController: UIScrollViewDelegate {
	func scrollViewDidScroll(_ scrollView: UIScrollView) {
		//		print("scrollviewdidScroll point y \(scrollView.contentOffset)")
		//		print("all cell size = \((financeData?.feed.entry?.count ?? 0) * 80)")
		//		print("scrollview bottom point = \(scrollView.contentOffset.y + self.tableView.frame.size.height)")
		
		var endoflist = scrollView.contentOffset.y + self.tableView.frame.size.height
		var endofdata = financeData?.feed.entry?.count ?? 0
		
		if Int(endoflist) >= (endofdata * 80) + 100 && isRequesting == false {
			print("-----------reload refresh -----------------------")
			isRequesting = true
			
			self.showSpinner(onView: self.view)
			self.networkService.requestGetData(type: "topfreeapplications", limit: String(endofdata + 20), genre: "6015")
			//			self.financeData = nil
			
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
		downloadButton.layer.cornerRadius = 18
		downloadButton.clipsToBounds = true
		
		
	}
	
	
	func setCellData() {
		appIcon.layer.cornerRadius = 10
		appIcon.clipsToBounds = true
	}
}



