import Foundation

extension URLSession {
    func dataTask(with url: URL, result: @escaping (Result<Data, Error>) -> Void) -> URLSessionDataTask {
        return dataTask(with: url) { (data, _, error) in
            if let error = error {
                result(.failure(error))
                return
            }
            guard let data = data else {
                let error = NSError(domain: "Error", code: 0, userInfo: nil)
                result(.failure(error))
                return
            }
            result(.success(data))
        }
    }
    
    func dataTask(with urlRequest: URLRequest, result: @escaping (Result<Data, Error>) -> Void) -> URLSessionDataTask {
        return dataTask(with: urlRequest) { (data, _, error) in
            if let error = error {
                result(.failure(error))
                return
            }
            guard let data = data else {
                let error = NSError(domain: "Error", code: 0, userInfo: nil)
                result(.failure(error))
                return
            }
            result(.success(data))
        }
    }
}
