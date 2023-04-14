
import Foundation

typealias NetworkRequest = (URL, @escaping (Result<Data, NetworkError>) -> Void) -> Void

enum NetworkService {
    static func request(_ path: URL, _ completion: @escaping (Result<Data, NetworkError>) -> Void) {
        let session = URLSession(configuration: .default)
        session.dataTask(with: URLRequest(url: path)) { data, _, error in
            DispatchQueue.main.async {
                guard error == nil, let data = data else {
                    completion(.failure(.badResponse))
                    return
                }
                completion(.success(data))
            }
        }.resume()
    }
}

enum NetworkError: Error {
    case badResponse
}
