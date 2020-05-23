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


public extension URLRequest {

    /// Returns a cURL command for a request
    /// - return A String object that contains cURL command or "" if an URL is not properly initalized.
    public var cURL: String {

        guard
            let url = url,
            let httpMethod = httpMethod,
            url.absoluteString.utf8.count > 0
        else {
                return ""
        }

        var curlCommand = "curl --verbose \\\n"

        // URL
        curlCommand = curlCommand.appendingFormat(" '%@' \\\n", url.absoluteString)

        // Method if different from GET
        if "GET" != httpMethod {
            curlCommand = curlCommand.appendingFormat(" -X %@ \\\n", httpMethod)
        }

        // Headers
        let allHeadersFields = allHTTPHeaderFields!
        let allHeadersKeys = Array(allHeadersFields.keys)
        let sortedHeadersKeys  = allHeadersKeys.sorted(by: <)
        for key in sortedHeadersKeys {
            curlCommand = curlCommand.appendingFormat(" -H '%@: %@' \\\n", key, self.value(forHTTPHeaderField: key)!)
        }

        // HTTP body
        if let httpBody = httpBody, httpBody.count > 0 {
            let httpBodyString = String(data: httpBody, encoding: String.Encoding.utf8)!
            let escapedHttpBody = URLRequest.escapeAllSingleQuotes(httpBodyString)
            curlCommand = curlCommand.appendingFormat(" --data '%@' \\\n", escapedHttpBody)
        }

        return curlCommand
    }

    /// Escapes all single quotes for shell from a given string.
    static func escapeAllSingleQuotes(_ value: String) -> String {
        return value.replacingOccurrences(of: "'", with: "'\\''")
    }
}
