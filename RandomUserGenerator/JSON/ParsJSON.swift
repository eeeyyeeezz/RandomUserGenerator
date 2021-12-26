import Foundation

class UserInfo {
    var name: String = ""
    var email: String = ""
    var birthday: String = ""
    var address: String = ""
    var phoneNumber: String = ""
    var password: String = ""
    
    func        getData() {
        let decoder = JSONDecoder()
        guard let url = URL(string: "https://randomuser.me/api/") else { return }
        
        let session = URLSession.shared.dataTask(with: url) { [self] data, response, error in
            if let error = error { print(error) ; return }
            guard let data = data else { print("Data error!") ; return }
            
            do {
                let user = try decoder.decode(Welcome.self, from: data)
                print(user.results.first!.name.first + " " + user.results.first!.name.last)
                
            } catch { print(error) }
        }
        
        session.resume()
    }
    
    init () { getData() }
    
}

    
//                self.name = user.results.first!.name.title + user.results.first!.name.first + user.results.first!.name.last
//                self.email = user.results.first!.email
//                self.birthday = user.results.first!.dob.date
//                self.address = user.results.first!.location.city + String(user.results.first!.location.street.number) + user.results.first!.location.street.name
//                self.phoneNumber = user.results.first!.phone
//                self.password = user.results.first!.login.password
