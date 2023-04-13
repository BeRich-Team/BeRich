//
//  NetworkManager.swift
//  BeRich
//
//  Created by Matvei Bykadorov on 13.04.2023.
//
import Foundation

protocol INetworkManager {
    func request(path: String, params: [String: String]?, completion: @escaping (Data?, URLResponse?, Error?) -> Void)
}

final class NetworkManager: INetworkManager {
    func request(path: String, params _: [String: String]?, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        guard let url = URL(string: path) else { return }
        let session = URLSession(configuration: .default)
        session.dataTask(with: URLRequest(url: url)) { data, response, error in
            DispatchQueue.main.async {
                completion(data, response, error)
            }
        }.resume()
    }
}
