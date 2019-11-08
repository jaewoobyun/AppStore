//
//  SearchViewController.swift
//  AppstoreSample
//
//  Created by Nomad on 2019/11/08.
//  Copyright © 2019 Nomad. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController{
	
	
	@IBOutlet weak var tableView: UITableView!
	
	var originalData:[String] = []
	var displayData:[String] = []
	
	let searchController = UISearchController(searchResultsController: nil)
	let mockData:[String] = ["marvel", "모두의 마블", "이사만루", "카카오톡", "v앱", "인터파크", "picsart", "밴드", "a", "ab", "abc", "bcd", "가", "가나", "가나다", "갸", "갸", "나", "냐", "다", "라", "마", "바"]
	
	var isSearchBarEmtpy: Bool {
		return searchController.searchBar.text?.isEmpty ?? true
	}
	
	var isFiltering: Bool {
		return searchController.isActive && !isSearchBarEmtpy
	}
	
	var filteredData: [String] = []
	
	lazy var searchBar = UISearchBar(frame: CGRect.zero)
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		if #available(iOS 11.0, *) {
			self.navigationController?.navigationBar.prefersLargeTitles = true
		}
		
		navigationItem.searchController = searchController
		
		searchController.searchResultsUpdater = self
		searchController.searchBar.placeholder = "Games, Apps, Stories, and More"
		searchController.obscuresBackgroundDuringPresentation = false
//		searchController.hidesNavigationBarDuringPresentation = false
		
		self.definesPresentationContext = true
		
		self.tableView.delegate = self
		self.tableView.dataSource = self
		
		self.originalData = mockData.self
		
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
		
		
	}
	
	func filterContentForSearchText(_ searchText: String) {
		filteredData = mockData.filter({ (text) -> Bool in
			return text.lowercased().contains(searchText.lowercased())
		})
		tableView.reloadData()
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
//MARK: - UISearchResultsUpdating
extension SearchViewController: UISearchResultsUpdating {
	func updateSearchResults(for searchController: UISearchController) {
		print("updateSearchResults!")
//		self.searchBar = searchController.searchBar
//		filterContentForSearchText(searchBar.text!)
		searchBar = searchController.searchBar
		filterContentForSearchText(searchBar.text!)
		
	}
	
	
}


//MARK: - UITableView Delegate, Datasource
extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if isFiltering {
			return filteredData.count
		}
		
		return self.mockData.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)

		var filteringString: String = ""

		if isFiltering {
			filteringString = filteredData[indexPath.row]
//			displayData.append(filteringString)
//			print("displayData", displayData)
		} else {
			filteringString = mockData[indexPath.row]
		}
		cell.imageView?.image = UIImage.init(systemName: "magnifyingglass")
		cell.textLabel?.text = filteringString
		return cell
		
	}
	
	
}

////MARK: - ScrollView Delegate
//extension SearchViewController: UIScrollViewDelegate {
//	func scrollViewDidScroll(_ scrollView: UIScrollView) {
//		print("scrollViewDidScroll point y = \(scrollView.contentOffset)")
//		print("scrollView bottom point = \(scrollView.contentOffset.y + self.tableView.frame.size.height)")
//	}
//
//	func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//		print("scrollViewDidEndDecelerating \(scrollView.contentOffset)")
//	}
//}
