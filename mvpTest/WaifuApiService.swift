//
//  WaifuApiService.swift
//  mvpTest
//
//  Created by Emil Shpeklord on 19.04.2022.
//

import Foundation

final class WaifuApiService {
    func getRandomWaifu(completion: @escaping (Waifu) -> Void) {
        let urlString = "https://api.waifu.pics/sfw/waifu"
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)

        URLSession.shared.dataTask(with: request) { data, _, error in
            guard error == nil else {
                print(String(describing: error?.localizedDescription))
                return
            }
            guard let data = data else {
                return
            }

            let jsonDecoder = JSONDecoder()
            do {
                let responseObject = try jsonDecoder.decode(
                    Waifu.self,
                    from: data
                )
                print(responseObject)
                completion(responseObject)
            } catch let error {
                print(String(describing: error.localizedDescription))
            }
        }
        .resume()
    }
}
