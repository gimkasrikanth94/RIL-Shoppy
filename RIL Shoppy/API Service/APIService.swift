//
//  APIService.swift
//  RIL Shoppy
//
//  Created by Srikanth Gimka on 17/08/22.
//

import Foundation


class APIService : ObservableObject{
    @Published var response = [ProductDetailModel]()
    
    func loadData(completion:@escaping ([ProductDetailModel]) -> ()) {
        guard let url = URL(string: "https://dvishal485.github.io/flipkart-scraper-api/sample-search.json") else {
            completion([])
            return
        }
        let request = URLRequest(url: url)

        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                completion([])
                return }
                      do {
                          let decoder = JSONDecoder()
                          let response = try decoder.decode(ResponseModel.self, from: data)
                              DispatchQueue.main.async {
                                  self.response = response.result
                                  completion(self.response)
                                  return
                              }
                      } catch let err {
                          print("Err", err)
                          completion([])
                          return

                      }
        }.resume()

    }
}
