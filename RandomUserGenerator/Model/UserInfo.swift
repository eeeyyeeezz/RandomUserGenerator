import Foundation

class User{
	var completionHandler: ((UserInfoStruct) -> Void)?
	
}

struct UserInfoStruct {
	var name: String
	var email: String
	var age: Int
	var address: String
	var phoneNumber: String
	var image: String
	
	init(user: Welcome){
		name = user.results.first!.name.title + " " + user.results.first!.name.first + " " + user.results.first!.name.last
		email = user.results.first!.email
		age = user.results.first!.dob.age
		address = String(user.results.first!.location.street.number) + " " + user.results.first!.location.street.name
		phoneNumber = user.results.first!.phone
		image = user.results.first!.picture.large
	}
	
}
