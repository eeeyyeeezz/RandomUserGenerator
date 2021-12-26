import Foundation

extension UserInfo {
    
    public func        getData() {
        let decoder = JSONDecoder()
        guard let url = URL(string: "https://randomuser.me/api/") else { return }
        
        let session = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error { print(error) ; return }
            guard let data = data else { print("Data error!") ; return }
            
            do {
                let user = try decoder.decode(Welcome.self, from: data)
                self.setData(user)
            } catch { print(error) }
        }
        
        session.resume()
    }
    
    private func        setData(_ user: Welcome){
        self.name = user.results.first!.name.title + " " + user.results.first!.name.first + " " + user.results.first!.name.last
        self.email = user.results.first!.email
        self.age = user.results.first!.dob.age
        self.address = user.results.first!.location.city + " " + String(user.results.first!.location.street.number) + " " + user.results.first!.location.street.name
        self.phoneNumber = user.results.first!.phone
        self.image = user.results.first!.picture.large
        
        print(self.name!)
        print(self.email!)
        print(self.age!)
        print(self.address!)
        print(self.phoneNumber!)
        print(self.image!)
    }
}
