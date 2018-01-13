//
//  UserAPIController.swift
//  TestyStuff
//
//  Created by Raymond Gatz on 1/7/18.
//  Copyright © 2018 RayzorDragon. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class UserAPIController {
	
	let api = "https://mobile-code-test.ifactornotifi.com/json/users"
	
	public func fetch(completion: @escaping (Array<User>?, Error?) -> ()) {
		
		Alamofire.request(api).responseArray { (response: DataResponse<[User]>) in
			
			let userReponse = response.result.value
			completion(userReponse!, nil)
		}
	}
	
}


