//
//  PostAPIController.swift
//  TestyStuff
//
//  Created by Raymond Gatz on 1/12/18.
//  Copyright © 2018 RayzorDragon. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class PostAPIController {
	
	public func fetch(user:User, completion: @escaping (Array<Post>?, Error?) -> ()) {
		let api = "https://mobile-code-test.ifactornotifi.com/json/posts?userId=\(user.id!)"
		
		Alamofire.request(api).responseArray { (response: DataResponse<[Post]>) in
			
			let postResponse = response.result.value
			completion(postResponse!, nil)
		}
	}
	
	public func post(post:Post, completion: @escaping (Post?, Error?) -> ()) {
		let api = "https://mobile-code-test.ifactornotifi.com/json/posts"
		
		Alamofire.request(api, method: .post, parameters: post.toJSON(), encoding: JSONEncoding.default, headers: nil).responseObject { (response: DataResponse<Post>) in
			
			let postResponse = response.result.value
			print(postResponse!)
			completion(postResponse, nil)
		}
	}
	
	public func put(post:Post, completion: @escaping (Post?, Error?) -> ()) {
		let api = "https://mobile-code-test.ifactornotifi.com/json/posts/\(post.id!)"
		
		Alamofire.request(api, method: .put, parameters: post.toJSON(), encoding: JSONEncoding.default, headers: nil).responseObject { (response: DataResponse<Post>) in
			
			let postResponse = response.result.value
			print(postResponse!)
			completion(postResponse, nil)
		}
	}
	
	public func delete(post:Post, completion: @escaping (Post?, Error?) -> ()) {
		let api = "https://mobile-code-test.ifactornotifi.com/json/posts/\(post.id!)"
		
		Alamofire.request(api, method: .delete, parameters: post.toJSON(), encoding: JSONEncoding.default, headers: nil).responseObject { (response: DataResponse<Post>) in
			
			let postResponse = response.result.value
			print(postResponse!)
			completion(postResponse, nil)
		}
	}
	
}
