//
//  TotalAppsTableViewController.swift
//  AppstoreSample
//
//  Created by Nomad on 2019/11/12.
//  Copyright © 2019 Nomad. All rights reserved.
//

import UIKit

class TotalAppsTableViewController: UITableViewController {
	
	var listarray: [AppCategory] = [.AllApps, .Books, .Education, .Entertainment, .Finance, .Game, .HealthAndFitness, .Lifestyle, .Medical, .Music, .Navigation, .News, .PhotoAndVideo, .Productivity, .Reference, .Shopping, .SocialNetworking, .Sports, .Travel, .Utilities, .Weather]

	//클로져 핸들러 만들기.
	var selectHandle: ((_ item:AppCategory)->())?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Uncomment the following line to preserve selection between presentations
		// self.clearsSelectionOnViewWillAppear = false
		
		// Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//		 self.navigationItem.rightBarButtonItem = self.editButtonItem
		
		let btn = UIBarButtonItem(title: "Cancel", style: UIBarButtonItem.Style.plain, target: self, action: #selector(cancel))
		
		self.navigationItem.rightBarButtonItem = btn
		
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: "appsCell")
		
		tableView.allowsMultipleSelection = false
	
	}
	
	@objc func cancel() {
		self.dismiss(animated: true, completion: nil)
	}
	
	// MARK: - Table view data source
	
	override func numberOfSections(in tableView: UITableView) -> Int {
		// #warning Incomplete implementation, return the number of sections
		return 1
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return listarray.count
	}
	
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "appsCell", for: indexPath)
	
		cell.textLabel?.text = listarray[indexPath.row].rawValue
		cell.imageView?.image = UIImage.init(systemName: "magnifyingglass")
		
		
		
		return cell
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
		
		print(listarray[indexPath.row].getCategoryID())
		
		//호출부가 필요함
		selectHandle!(listarray[indexPath.row])
		
		self.dismiss(animated: true) {
			
		}
	}
	
	override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
		tableView.cellForRow(at: indexPath)?.accessoryType = .none
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
