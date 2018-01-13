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
	
	public func fetch(user:User, completion: @escaping (Array<Post>) -> ()) {
		let api = "https://mobile-code-test.ifactornotifi.com/json/posts?userId=\(user.id!)"
		
		Alamofire.request(api).responseArray { (response: DataResponse<[Post]>) in
			
			let postResponse = response.result.value
			completion(postResponse!)
		}
	}
	
}
