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
		searchController.searchBar.delegate = self
		searchController.searchBar.placeholder = "Games, Apps, Stories, and More"
		searchController.obscuresBackgroundDuringPresentation = false
		//		searchController.hidesNavigationBarDuringPresentation = false
		
		self.definesPresentationContext = true
		
		self.tableView.delegate = self
		self.tableView.dataSource = self
		
		self.originalData = mockData.self
		
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
		
		
//		let myName = "변재우"
//
//		print(Jamo.getJamo(myName))
//
//		let jamoString = Jamo.getJamo(myName)
//		var searchKeyword  = "ㄴㅈ"
//
//		if jamoString.contains(searchKeyword) {
//			print("true")
//		}
//
//		searchKeyword = Jamo.getJamo("변")
//		if jamoString.contains(searchKeyword) {
//			print("true")
//		}
//
//		print("---------")
//
//		let chosungMyName = Jamo.getChosung(myName)
//		var searchKey = Jamo.getChosung("변재")
//		if chosungMyName.contains(searchKey) {
//			print("ㅂㅈ는 ㅂㅈㅇ 안에 있다!")
//		}
		
	}
//
//	func splitText(text: String) -> Bool {
////		guard let text = text.last else { return false }
//		let val = UnicodeScalar(String(text))?.value
//		guard let value = val else { return false }
//		let x = (value - 0xac00) / 28 / 21
//		let y = ((value - 0xac00) / 28) % 21
//		let z = (value - 0xac00) % 28
//		let i = UnicodeScalar(0x1100 + x) //초성
//		let j = UnicodeScalar(0x1161 + y) //중성
//		let k = UnicodeScalar(0x11a6 + 1 + z) //종성
//
//		return false
//	}
	
	func filterContentForSearchText(_ searchText: String) {
//				filteredData = mockData.filter({ (text) -> Bool in
//					return text.lowercased().contains(searchText.lowercased())
//				})
//
		
//		filteredData = mockData.filter({ (string) -> Bool in
//			guard let unicodeValOfString = UnicodeScalar(String(string))?.value else { return false }
//
//			guard let unicodeValOfSearchText = UnicodeScalar(String(searchText))?.value else { return false }
//
//			//			return string.lowercased().contains(searchText.lowercased())
//		})
		
		//		filteredData = mockData.filter({ (string) -> Bool in
		//			return string.lowercased().hangul.contains(searchText.lowercased().hangul)
		//		})

		
//		filteredData = mockData.filter({ (string) -> Bool in
//			let chosung = string.lowercased().decomposedStringWithCanonicalMapping.unicodeScalars.map{ String($0)}
//
//			if chosung.contains(searchText.lowercased()) {
//				return true
//			} else {
//				return false
//			}
//		})
		
		filteredData = mockData.filter({ (string) -> Bool in
			Jamo.getJamo(string.lowercased()).contains(Jamo.getJamo(searchText.lowercased()))
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

//MARK: - SearchBar Delegate
extension SearchViewController: UISearchBarDelegate {
	func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
		//		filteredData = searchText.isEmpty ?
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


extension CharacterSet{
    static var modernHangul: CharacterSet{
        return CharacterSet(charactersIn: ("가".unicodeScalars.first!)...("힣".unicodeScalars.first!))
    }
}

public class Jamo {
    
    // UTF-8 기준
    static let INDEX_HANGUL_START:UInt32 = 44032  // "가"
    static let INDEX_HANGUL_END:UInt32 = 55199    // "힣"
    
    static let CYCLE_CHO :UInt32 = 588
    static let CYCLE_JUNG :UInt32 = 28
    
    static let CHO = [
        "ㄱ","ㄲ","ㄴ","ㄷ","ㄸ","ㄹ","ㅁ","ㅂ","ㅃ","ㅅ",
        "ㅆ","ㅇ","ㅈ","ㅉ","ㅊ","ㅋ","ㅌ","ㅍ","ㅎ"
    ]
    
    static let JUNG = [
        "ㅏ", "ㅐ", "ㅑ", "ㅒ", "ㅓ", "ㅔ","ㅕ", "ㅖ", "ㅗ", "ㅘ",
        "ㅙ", "ㅚ","ㅛ", "ㅜ", "ㅝ", "ㅞ", "ㅟ", "ㅠ", "ㅡ", "ㅢ",
        "ㅣ"
    ]
    
    static let JONG = [
        "","ㄱ","ㄲ","ㄳ","ㄴ","ㄵ","ㄶ","ㄷ","ㄹ","ㄺ",
        "ㄻ","ㄼ","ㄽ","ㄾ","ㄿ","ㅀ","ㅁ","ㅂ","ㅄ","ㅅ",
        "ㅆ","ㅇ","ㅈ","ㅊ","ㅋ","ㅌ","ㅍ","ㅎ"
    ]
    
    static let JONG_DOUBLE = [
        "ㄳ":"ㄱㅅ","ㄵ":"ㄴㅈ","ㄶ":"ㄴㅎ","ㄺ":"ㄹㄱ","ㄻ":"ㄹㅁ",
        "ㄼ":"ㄹㅂ","ㄽ":"ㄹㅅ","ㄾ":"ㄹㅌ","ㄿ":"ㄹㅍ","ㅀ":"ㄹㅎ",
        "ㅄ":"ㅂㅅ"
    ]
    
    // 주어진 "단어"를 자모음으로 분해해서 리턴하는 함수
    class func getJamo(_ input: String) -> String {
        var jamo = ""
        //let word = input.trimmingCharacters(in: .whitespacesAndNewlines).trimmingCharacters(in: .punctuationCharacters)
        for scalar in input.unicodeScalars{
            jamo += getJamoFromOneSyllable(scalar) ?? ""
        }
        return jamo
    }
	
	class func getChosung(_ input: String) -> String {
		var chosungs = ""
		for scalar in input.unicodeScalars{
			 chosungs += getOnlyChosung(scalar) ?? ""
		}
		return chosungs
	}
    
    // 주어진 "코드의 음절"을 자모음으로 분해해서 리턴하는 함수
    private class func getJamoFromOneSyllable(_ n: UnicodeScalar) -> String?{
        if CharacterSet.modernHangul.contains(n){
            let index = n.value - INDEX_HANGUL_START
            let cho = CHO[Int(index / CYCLE_CHO)]
            let jung = JUNG[Int((index % CYCLE_CHO) / CYCLE_JUNG)]
            var jong = JONG[Int(index % CYCLE_JUNG)]
            if let disassembledJong = JONG_DOUBLE[jong] {
                jong = disassembledJong
            }
            return cho + jung + jong
        }else{
            return String(UnicodeScalar(n))
        }
    }
	
	private class func getOnlyChosung(_ n: UnicodeScalar) -> String?{
			 if CharacterSet.modernHangul.contains(n){
				  let index = n.value - INDEX_HANGUL_START
				  let cho = CHO[Int(index / CYCLE_CHO)]
				 
				  return cho
			 }else{
				  return String(UnicodeScalar(n))
			 }
		}
}

extension SearchViewController: UITextFieldDelegate {
	
}
