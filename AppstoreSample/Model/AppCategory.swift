//
//  Category.swift
//  AppstoreSample
//
//  Created by Nomad on 2019/11/12.
//  Copyright © 2019 Nomad. All rights reserved.
//

import Foundation
import UIKit

	enum AppCategory: String {
		case AllApps = "All Apps"
		case Books = "Books"
//		case Business = "Business"
		case Education = "Education"
		case Entertainment = "Entertainment"
		case Finance = "Finanace"
//		case FoodAndDrink = "Food & Drink"
		case Game = "Game"
		case HealthAndFitness = "Health & Fitness"
//		case Kids = "Kids"
		case Lifestyle = "Lifestyle"
//		case MagazinesAndNewspapers = "Magazines & Newspapers"
		case Medical = "Medical"
		case Music = "Music"
		case Navigation = "Navigation"
		case News = "News"
		case PhotoAndVideo = "Photo & Video"
		case Productivity = "Productivity"
		case Reference = "Reference"
		case Shopping = "Shopping"
		case SocialNetworking = "SocialNetworking"
		case Sports = "Sports"
		case Travel = "Travel"
		case Utilities = "Utilities"
		case Weather = "Weather"
		
		
//		func getTitle() -> String {
//			switch self {
//			case .Finance:
//				return "Finanace"
//			case .Books:
//				return "Books"
//			case .Education:
//				return "Education"
//			}
//		}
		
		func getCategoryID() -> String {
			switch self {
			case .AllApps:
				return ""
			case .Books:
				return "6018"
//			case .Business:
//				return "1321"
			case .Education:
				return "6017"
			case .Entertainment:
				return "6016"
			case .Finance:
				return "6015"
//			case .FoodAndDrink:
//				return "1306"
			case .Game:
				return "6014"
			case .HealthAndFitness:
				return "6013"
//			case .Kids:
//				return "1305"
			case .Lifestyle:
				return "6012"
//			case .MagazinesAndNewspapers:
//				return "13019"
			case .Medical:
				return "6020"
			case .Music:
				return "6011"
			case .Navigation:
				return "6010"
			case .News:
				return "6009"
			case .PhotoAndVideo:
				return "6008"
			case .Productivity:
				return "6007"
			case .Reference:
				return "6006"
			case .Shopping:
				return "1472"
			case .SocialNetworking:
				return "6005"
			case .Sports:
				return "6004"
			case .Travel:
				return "6003"
			case .Utilities:
				return "6002"
			case .Weather:
				return "6001"
			}
		}
	}
