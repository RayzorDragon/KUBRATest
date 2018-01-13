//
//  PostViewController.swift
//  TestyStuff
//
//  Created by Raymond Gatz on 1/12/18.
//  Copyright © 2018 RayzorDragon. All rights reserved.
//

import UIKit

class PostViewController: UIViewController {
	var user: User?
	var post: Post?
	let postController = PostAPIController()
	
	@IBOutlet weak var titleField: UITextField!
	@IBOutlet weak var postField: UITextView!
	
	convenience init (user: User) {
		self.init(user: user, post: nil)
	}
	
	init (user: User, post: Post?) {
		self.user = user
		self.post = post
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		if post != nil {
			titleField.text = post?.title
			postField.text = post?.body
		}
		
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	@IBAction func saveButtonTapped(_ sender: Any) {
		print("Saving")
		if self.post != nil {
			print("Do a Put/Patch")
		} else {
			print("Do a Post")
			let newPost = Post.init(id: nil, userId: user?.id, title: self.titleField?.text, body: self.postField.text)
			
			self.postController.post(post: newPost!, completion: {
				print("Post Finished")
			})
		}
	}
	
	
	
}

extension PostViewController: UITextFieldDelegate {

	func textFieldDidBeginEditing(_ textField: UITextField) {
		textField.becomeFirstResponder()
	}
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		return true;
	}
}

extension PostViewController: UITextViewDelegate {
	
	func textViewDidBeginEditing(_ textView: UITextView) {
		textView.becomeFirstResponder()
	}
	
}
