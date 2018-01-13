//
//  UsersViewController.swift
//  TestyStuff
//
//  Created by Raymond Gatz on 1/7/18.
//  Copyright © 2018 RayzorDragon. All rights reserved.
//

import UIKit

class UsersViewController: UITableViewController {
	
	var userController = UserAPIController()
	var users: Array<User> = Array()
//	var selectedUser: User?

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		getDataForTable()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	func getDataForTable() {
		users.removeAll()
		userController.fetch { (userArray, error)  in
			if let usersArray = userArray {
				self.users = usersArray
				DispatchQueue.main.async {
					self.tableView.reloadData()
				}
			}
		}
	}
	
	override func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.users.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let user = users[indexPath.row]
		
		let cellIdentifier = "UserTableViewCell"
		
		guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as?
			UITableViewCell else {
				print("Error with Cell Dequeue")
		}
		
		cell.textLabel!.text = user.username
		cell.detailTextLabel!.text = user.userAddress()
		
		return cell
	}

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		
		guard let cell = sender as? UITableViewCell,
			let indexPath = tableView.indexPath(for: cell) else {
				return
		}
		
		let index = indexPath.row
		let selectedUser = users[index]
		
		if segue.identifier == "userPosts" {
			let postsVC = segue.destination as? PostsViewController
			postsVC?.user = selectedUser
		}
	}
}

