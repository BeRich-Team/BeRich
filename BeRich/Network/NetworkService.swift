
import Foundation

typealias NetworkRequest = (URL, @escaping (Result<Data, NetworkError>) -> Void) -> Void

enum NetworkService {
    static func request(_ url: URL, _ completion: @escaping (Result<Data, NetworkError>) -> Void) {
        let session = URLSession(configuration: .default)
        session.dataTask(with: URLRequest(url: url)) { data, _, error in
            DispatchQueue.main.async {
                guard error == nil, let data else {
                    print("Network request failed: \(error?.localizedDescription ?? "")")
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
