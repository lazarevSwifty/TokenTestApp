import Foundation

protocol NetworkService: AnyObject {
    func fetchImages(completion: @escaping (Result<[Session], Error>) -> Void)
    func fetchSession(completion: @escaping (Session) -> Void)
}

final class NetworkServiceImp: NetworkService {
    func fetchImages(completion: @escaping (Result<[Session], Error>) -> Void) {
        guard let url = URL(string: "") else { return completion(.failure(NSError(domain: "wrong url", code: 001, userInfo: nil))) }
        
        URLSession.shared.dataTask(with: url) { result in
            switch result {
            case .success(let data):
                do {
                    let response = try JSONDecoder().decode(Session.self, from: data)
  //                  completion(.success(response))
                } catch let error {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }.resume()
    }
    
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
}
