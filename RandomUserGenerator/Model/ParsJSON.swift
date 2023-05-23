import Foundation

extension User{
	func getData() {
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
    
	private func setData(Welcome user: Welcome) -> UserInfoStruct? {
		let userStruct = UserInfoStruct(user: user)
		return userStruct
	}
}
