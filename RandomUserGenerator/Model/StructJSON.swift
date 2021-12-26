import Foundation

// MARK: - Welcome
struct Welcome: Decodable {
    let results: [Result]
}


// MARK: - Result
struct Result: Decodable {
    let name: Name
    let location: Location
    let email: String
    let dob, registered: Dob
    let phone, cell: String
    let picture: Picture
}

// MARK: - Dob
struct Dob: Decodable {
    let date: String
    let age: Int
}


// MARK: - Location
struct Location: Decodable {
    let street: Street
    let city, state, country: String
}


// MARK: - Street
struct Street: Decodable {
    let number: Int
    let name: String
}


// MARK: - Name
struct Name: Decodable {
    let title, first, last: String
}

// MARK: - Picture
struct Picture: Decodable {
    let large, medium, thumbnail: String
}
