import Foundation

//protocol UserInfoProtocol {
//    var name: String? { get set }
//    var email: String? { get set }
//    var age: Int? { get set }
//    var address: String? { get set }
//    var phoneNumber: String? { get set }
//    var image: String? { get set }
//}

class UserInfo {
    var name: String?
    var email: String?
    var age: Int?
    var address: String?
    var phoneNumber: String?
    var image: String?
    
    init () { getData() }
    
}
