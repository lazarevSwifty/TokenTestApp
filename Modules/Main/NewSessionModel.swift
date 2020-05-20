struct Session: Codable {
    let status: Int
    let data: Data
    
    struct Data: Codable {
        let session: String
    }
}


struct Entries: Codable {
    let status: Int
    let data: [Data]
    
    struct Data: Codable {
        let id: String
        let body: String
        let da: String
        let dm: String
    }
}

