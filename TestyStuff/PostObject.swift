//
//  PostObject.swift
//  TestyStuff
//
//  Created by Raymond Gatz on 1/12/18.
//  Copyright © 2018 RayzorDragon. All rights reserved.
//

import Foundation
import ObjectMapper

class Post: Mappable {
	var id: Int?
	var userId: Int?
	var title: String?
	var body: String?
	
	required init?(map: Map) {
		
	}
	
	func mapping(map: Map) {
		id			<- map["id"]
		userId		<- map["userId"]
		title		<- map["title"]
		body		<- map["body"]
	}
}
