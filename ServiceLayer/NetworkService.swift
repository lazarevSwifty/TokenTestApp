import Foundation

protocol NetworkService: AnyObject {
    func fetchSession(completion: @escaping (Session) -> Void)
    func fetchEntries(session: String, completion: @escaping (Entries) -> Void)
    func addEntry(body: String, session: String, completion: @escaping (Entry) -> Void)

}

final class NetworkServiceImp: NetworkService {
    func fetchSession(completion: @escaping (Session) -> Void) {
        let url = URL(string: "https://bnet.i-partner.ru/testAPI/")
        guard let requestUrl = url else { fatalError() }
        var request = URLRequest(url: requestUrl)
        request.setValue(Constants.token, forHTTPHeaderField: "token")
        let postString = "a=new_session";
        request.httpBody = postString.data(using: String.Encoding.utf8);
        request.httpMethod = "POST"
        let session = URLSession.shared
        
        session.dataTask(with: request) { (data, response, error) in
            if let responseData = data {
                do {
                    let sessionData = try JSONDecoder().decode(Session.self, from: responseData)
                    completion(sessionData)
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
    
    func fetchEntries(session: String, completion: @escaping (Entries) -> Void) {
        let url = URL(string: "https://bnet.i-partner.ru/testAPI/")
        guard let requestUrl = url else { fatalError() }
        var request = URLRequest(url: requestUrl)
        request.setValue(Constants.token, forHTTPHeaderField: "token")
        let postString = "a=get_entries&session=\(session)";
        request.httpBody = postString.data(using: String.Encoding.utf8);
        request.httpMethod = "POST"
        let urlSession = URLSession.shared

        urlSession.dataTask(with: request) { (data, response, error) in
            if let responseData = data {
                do {
                    let entries = try JSONDecoder().decode(Entries.self, from: responseData)
                    completion(entries)
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
    
    func addEntry(body: String, session: String, completion: @escaping (Entry) -> Void)  {
        let url = URL(string: "https://bnet.i-partner.ru/testAPI/")
        guard let requestUrl = url else { fatalError() }
        var request = URLRequest(url: requestUrl)
        request.setValue(Constants.token, forHTTPHeaderField: "token")
        let postString = "a=add_entry&session=\(session)&body=\(body)";
        request.httpBody = postString.data(using: String.Encoding.utf8);
        request.httpMethod = "POST"
        
        print(request.cURL)
        let session = URLSession.shared
        
        session.dataTask(with: request) { (data, response, error) in
            if let responseData = data {
                do {
                    let sessionData = try JSONDecoder().decode(Entry.self, from: responseData)
                    completion(sessionData)
                } catch {
                    print("error=\(error)")
                }
            }
        }.resume()
    }
}
