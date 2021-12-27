import Foundation

struct Welcome: Decodable {
    let results: [Result]
}

struct Result: Decodable {
    let name: Name
    let location: Location
    let email: String
    let dob: Dob
    let phone: String
    let picture: Picture
}

struct Dob: Decodable {
    let age: Int
}


struct Location: Decodable {
    let street: Street
    let city, state, country: String
}

struct Street: Decodable {
    let number: Int
    let name: String
}


struct Name: Decodable {
    let title, first, last: String
}

struct Picture: Decodable {
    let large: String
}
