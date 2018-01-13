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
	
	convenience init?(id: Int?, userId: Int?, title: String?, body: String?) {
		
		var json = [ String: Any ]()
		if id != nil {
			json["id"] = id
		}
		if userId != nil {
			json["userId"] = userId
		}
		if title != nil {
			json["title"] = title
		}
		if body != nil {
			json["body"] = body
		}
		
		let map = Map.init(mappingType: MappingType.fromJSON, JSON:json)
		self.init(map: map)
		self.mapping(map: map)
	}
	
	required init?(map: Map) {
		
	}
	
	func mapping(map: Map) {
		id			<- map["id"]
		userId		<- map["userId"]
		title		<- map["title"]
		body		<- map["body"]
	}
}
