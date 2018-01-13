//
//  UserObject.swift
//  TestyStuff
//
//  Created by Raymond Gatz on 1/7/18.
//  Copyright © 2018 RayzorDragon. All rights reserved.
//

import Foundation
import ObjectMapper

class User: Mappable {
	var id: Int?
	var name: String?
	var username: String?
	var email: String?
	var address: Address?
	var phone: String?
	var website: String?
	var company: Company?
	
	required init?(map: Map) {
		
	}
	
	func mapping(map: Map) {
		id			<- map["id"]
		name		<- map["name"]
		username	<- map["username"]
		email		<- map["email"]
		address		<- map["address"]
		phone		<- map["phone"]
		website		<- map["website"]
		company		<- map["company"]
	}
	
	func userAddress() -> String {
		let addressString = String("\(self.address?.street ?? ""), \(self.address?.suite ?? ""), \(self.address?.city ?? ""), \(self.address?.zipcode ?? "")")
		
		return addressString
	}
	
}

struct Address: Mappable {
	var street: String?
	var suite: String?
	var city: String?
	var zipcode: String?
	var geo: Geo?
	
	init?(map: Map) {
		
	}
	
	mutating func mapping(map: Map) {
		street			<- map["street"]
		suite			<- map["suite"]
		city			<- map["city"]
		zipcode			<- map["zipcode"]
		geo				<- map["geo"]
	}
}

struct Geo: Mappable {
	var lat: Double?
	var lng: Double?
	
	init?(map: Map) {
		
	}
	
	mutating func mapping(map: Map) {
		lat			<- map["lat"]
		lng			<- map["lng"]
	}
}

struct Company: Mappable {
	var name: String?
	var catchPhrase: String?
	var bs: String?
	
	init?(map: Map) {
		
	}
	
	mutating func mapping(map: Map) {
		name			<- map["name"]
		catchPhrase		<- map["catchPhrase"]
		bs				<- map["bs"]
	}
}
