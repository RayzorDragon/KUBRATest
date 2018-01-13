//
//  PostsViewController.swift
//  TestyStuff
//
//  Created by Raymond Gatz on 1/12/18.
//  Copyright © 2018 RayzorDragon. All rights reserved.
//

import UIKit

class PostsViewController: UITableViewController {
	
	var user: User?
	let postController = PostAPIController()
	var posts: Array<Post> = Array()
	
	init (user: User) {
		self.user = user
		super.init(style: .plain)
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		if user != nil {
			getDataForTable()
		}
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	func getDataForTable() {
		posts.removeAll()
		postController.fetch(user: self.user!) { (postArray) in
			print(postArray)
			self.posts = postArray
			DispatchQueue.main.async {
				self.tableView.reloadData()
			}
		}
	}
	
	override func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.posts.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let post = posts[indexPath.row]
		
		let cellIdentifier = "PostTableViewCell"
		
		guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as?
			UITableViewCell else {
				print("Error with Cell Dequeue")
		}
		
		cell.textLabel!.text = post.title
		cell.detailTextLabel!.text = post.body
		
		return cell
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		
		if segue.identifier == "userPost" {
			let postVC = segue.destination as? PostViewController
			postVC?.user = user
		} else if segue.identifier == "userPostEdit" {
			
			guard let cell = sender as? UITableViewCell,
				let indexPath = tableView.indexPath(for: cell) else {
					return
			}
			
			let index = indexPath.row
			let selectedPost = posts[index]
			
			let postVC = segue.destination as? PostViewController
			postVC?.user = user
			postVC?.post = selectedPost
		}
	}
}
