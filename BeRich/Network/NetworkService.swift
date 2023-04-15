
import Foundation

typealias NetworkRequest = (URL, @escaping (Result<Data, Error>) -> Void) -> Void

enum NetworkService {
    static func request(_ url: URL, completion: @escaping (Result<Data, Error>) -> Void) {
        let session = URLSession(configuration: .default)
        session.dataTask(with: URLRequest(url: url)) { data, response, error in
            DispatchQueue.main.async {
                if let error {
                    printInDebugMode("Network request failed: \(error.localizedDescription)")
                    completion(.failure(error))
                    return
                }

                guard let httpURLResponse = response?.httpURLResponse, httpURLResponse.isSuccessful else {
                    completion(.failure(NetworkError.badResponse))
                    return
                }

                guard let data else {
                    completion(.failure(NetworkError.noData))
                    return
                }
                completion(.success(data))
            }
        }.resume()
    }
}

enum NetworkError: Error {
    case noData
    case badResponse
}

extension URLResponse {
    /// Returns casted HTTPURLResponse
    var httpURLResponse: HTTPURLResponse? {
        self as? HTTPURLResponse
    }
}

extension HTTPURLResponse {
    /// Returns true if statusCode is in range 200...299.
    /// Otherwise false.
    var isSuccessful: Bool {
        200 ... 299 ~= statusCode
    }
}
