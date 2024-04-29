//
//  NetworkManager.swift
//  VestaCare
//
//  Created by aman on 27/04/24.
//

import Foundation

class NetworkManager {
    func getCallsData(completion: @escaping (_ data: Output) -> Void) {
        if let url = URL(string: "http://13.235.159.69/vesta/api/exotelcallapi/inbound_history/format/json") {
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("ci_sessions=bjdtoecj7pmrct5e56a4f50nkgr8qrfp", forHTTPHeaderField: "Cookie")
            
            let parameters: [String: Any] = [
                "nurse_number": "+917838939079"
            ]
            
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            } catch let error {
                print("Error serializing JSON: \(error.localizedDescription)")
            }
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let data = data {
                    do {
                        let response = try JSONDecoder().decode(Output.self, from: data)
                        print("response is: \(response)")
                        completion(response)
                    } catch {
                        print("Error decoding JSON: \(error)")
                    }
                } else if let error = error {
                    print("Error: \(error.localizedDescription)")
                }
            }.resume()
        }
    }
}
