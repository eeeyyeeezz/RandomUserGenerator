import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let results: [Result]
}


// MARK: - Result
struct Result: Codable {
    let name: Name
    let location: Location
    let email: String
    let dob, registered: Dob
    let phone, cell: String
    let picture: Picture
}

// MARK: - Dob
struct Dob: Codable {
    let date: String
    let age: Int
}


// MARK: - Location
struct Location: Codable {
    let street: Street
    let city, state, country: String
}


// MARK: - Street
struct Street: Codable {
    let number: Int
    let name: String
}


// MARK: - Name
struct Name: Codable {
    let title, first, last: String
}

// MARK: - Picture
struct Picture: Codable {
    let large, medium, thumbnail: String
}
