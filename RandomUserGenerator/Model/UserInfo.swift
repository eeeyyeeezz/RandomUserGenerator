import Foundation

class User{
	
	var completionHandler: ((UserInfoStruct) -> Void)?
	
	func		getData() {
		let decoder = JSONDecoder()
		guard let url = URL(string: "https://randomuser.me/api/") else { return }

		let session = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error { print(error) ; return }
            guard let data = data else { print("Data error!") ; return }
            
            do {
                let user = try decoder.decode(Welcome.self, from: data)
				if let newUser = self.setData(Welcome: user) {
					self.completionHandler?(newUser)
				}
            } catch { print(error) }
        }
        
        session.resume()
    }
    
	private func		setData(Welcome user: Welcome) -> UserInfoStruct? {
		let userStruct = UserInfoStruct(user: user)
		return userStruct
	}
	
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
		address = user.results.first!.location.city + " " + String(user.results.first!.location.street.number) + " " + user.results.first!.location.street.name
		phoneNumber = user.results.first!.phone
		image = user.results.first!.picture.large
	}
	
}
