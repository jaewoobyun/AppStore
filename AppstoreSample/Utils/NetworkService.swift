//
//  NetworkService.swift
//  AppstoreSample
//
//  Created by Nomad on 2019/10/28.
//  Copyright © 2019 Nomad. All rights reserved.
//

import Foundation
import UIKit

protocol NetworkServiceProtocol {
	///무슨요청인지는 모르겠지만 뭔가 네트워크 서비스상에 에러가 났을때.
	func failRequest()
	
	///앱데이터 요청 후 정상적으로 요청이 왔을때.
	func responseGetData(appData: AppData)
	func responseGetData(appData: AppData, genre: String, isFree:Bool)
	func responseGetAppData(appsDetailData: AppsDetailData)
	func responseGetReviewData(appReviewData: AppReviewData)
	func responseGetRSSData(rssData: RssAppData, countryCode: String, mediaType: String, feedType: String, limit: String, genre: String)
	
	//	func topFreeGames(gameData: AppData)
	//	func topPaidGames(gameData: AppData)
}

extension NetworkServiceProtocol {
	func responseGetData(appData: AppData){}
	func responseGetData(appData: AppData, genre: String, isFree:Bool){}
	func responseGetAppData(appsDetailData: AppsDetailData){}
	func responseGetReviewData(appReviewData: AppReviewData){}
	func responseGetRSSData(rssData: RssAppData, countryCode: String, mediaType: String, feedType: String, limit: String, genre: String){}
	
	//	func topFreeGames(gameData: AppData){}
	//	func topPaidGames(gameData: AppData){}
}

class NetworkService {
	
	var delegate : NetworkServiceProtocol?
	
	
	func requestGetData(type: String = "topfreeapplications", limit: String = "20", genre: String = "") {
		let url = URL(string: "https://itunes.apple.com/kr/rss/" + type + "/limit=" + limit + "/genre=" + genre + "/json")
		var request = URLRequest(url: url!)
		request.httpMethod = "GET"
		request.httpBody = nil
		
		request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
		
		let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
			if let e = error {
				NSLog("An error has occurred : \(e.localizedDescription)")
				return
			}
			
			if let jsonData = data {
				//						print(jsonData)
				do {
					let appData = try JSONDecoder().decode(AppData.self, from: jsonData)
					//						return appData
					//							print(appData)
					DispatchQueue.main.async {
						self.delegate?.responseGetData(appData: appData)
						
						if genre == AppCategory.Game.getCategoryID() && type == "topfreeapplications" {
							//								self.delegate?.topFreeGames(gameData: appData)
							
							self.delegate?.responseGetData(appData: appData, genre:genre, isFree: true)
						}
						if genre == AppCategory.Game.getCategoryID() && type == "toppaidapplications" {
							//								self.delegate?.topPaidGames(gameData: appData)
							
							self.delegate?.responseGetData(appData: appData, genre:genre, isFree: false)
						}
					}
					
				}
				catch let error{
					print("error occurred fetching data??", error)
					self.delegate?.failRequest()
				}
			}
		}
		task.resume()
		print("----------------")
	}
	//https://rss.itunes.apple.com/api/v1/kr/ios-apps/new-games-we-love/all/10/explicit.json
	func requestGetFeedAppData(countryCode: String = "kr", mediaType: String = "ios-apps", feedType: String, limit: String, genre: String = "all") {
		let url = URL(string: "https://rss.itunes.apple.com/api/v1/" + countryCode + "/" + mediaType + "/" + feedType + "/" + genre + "/" + limit + "/explicit.json")
		var request = URLRequest(url: url!)
		request.httpMethod = "GET"
		request.httpBody = nil
		
		request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
		
		let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
			if let e = error {
				NSLog("An error has occurred : \(e.localizedDescription)")
				return
			}
			
			if let jsonData = data {
				//print(jsonData)
				do {
					let rssappData = try JSONDecoder().decode(RssAppData.self, from: jsonData)
					//return appData
					//print(appData)
					DispatchQueue.main.async {
//						self.delegate?.responseGetFeedData(rssappdata: rssappData)
						if feedType == FeedType.NewGames.rawValue {
							self.delegate?.responseGetRSSData(rssData: rssappData, countryCode: countryCode, mediaType: mediaType, feedType: feedType, limit: limit, genre: genre)
						}
						
						
					}
					
				}
				catch let error{
					print("error occurred fetching data??", error)
					self.delegate?.failRequest()
				}
			}
		}
		task.resume()
		print("----------------")
		
	}
	
	
	func requestGetAppDetailData(appId: String) {
		let SCHEMA: String = "https://"
		let HOST: String = "itunes.apple.com"
		
		let requestUrl = URL(string: SCHEMA + HOST + "/lookup?id=" + appId + "&country=kr")
		var request = URLRequest(url: requestUrl!)
		request.httpMethod = "GET"
		request.httpBody = nil
		request.addValue("application/x-www-for-urlencoded", forHTTPHeaderField: "Content-Type")
		
		let task = URLSession.shared.dataTask(with: requestUrl!) { (data, response, error) in
			if let err = error {
				print("datatask error?? : ", err)
				NSLog("Error has Occurred: \(err.localizedDescription)")
				return
			}
			
			if let jsonData = data {
				//				print("jsonData: ", jsonData)
				do {
					let appDetailData = try JSONDecoder().decode(AppsDetailData.self, from: jsonData)
					//					print("appDetailData!!:", appDetailData)
					DispatchQueue.main.async {
						self.delegate?.responseGetAppData(appsDetailData: appDetailData)
						
						
					}
				}
				catch let error {
					print("parsing Error??: ", error)
					self.delegate?.failRequest()
				}
			}
			
		}
		task.resume()
		print("------")
	}
	
	func requestGetAppReviewData(appId: String, sortBy: String = "mostRecent") {
		let SCHEMA: String = "https://"
		let HOST: String = "itunes.apple.com"
		let requestUrl = URL(string: SCHEMA + HOST + "/kr/rss/customerreviews/id=" + appId + "/sortBy=" + sortBy + "/json")
		var request = URLRequest(url: requestUrl!)
		request.httpMethod = "GET"
		request.httpBody = nil
		request.addValue("application/x-www-for-urlencoded", forHTTPHeaderField: "Content-Type")
		
		let task = URLSession.shared.dataTask(with: requestUrl!) { (data, response, error) in
			if let err = error {
				print("data task error? :", err)
				NSLog("Error has Occurred: \(err.localizedDescription)")
				return
			}
			
			if let jsonData = data {
				print(jsonData)
				do {
					let appReviewData = try JSONDecoder().decode(AppReviewData.self, from: jsonData)
					//					print("appReviewData!!: ", appReviewData)
					DispatchQueue.main.async {
						self.delegate?.responseGetReviewData(appReviewData: appReviewData)
					}
				}
				catch let error {
					print("parsing Error??: ", error)
					self.delegate?.failRequest()
				}
			}
			
		}
		task.resume()
		print("------")
	}
	
	
}

func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
	URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
}

//func downloadImage(from url: URL) -> UIImage {
//
//	print("Download Started")
//	var downloadedImage: UIImage
//	getData(from: url) { (data, response, error) in
//		guard let data = data, error == nil else { return }
//		print(response?.suggestedFilename ?? url.lastPathComponent)
//		print("Download Finished")
//		DispatchQueue.main.async {
//			downloadedImage = UIImage(data: data)!
//		}
//	}
//	return downloadedImage
//}
