//
//  ViewModel.swift
//  HirraSaleemNYTimesTask
//
//  Created by Hirra on 29/04/2023.
//

import UIKit
import Combine

let APIKEY = "Gdi6QC1MZQS0SDSMcSP4dS5NxL5GAKQl"
class ViewModel: ObservableObject {
    @Published var results = [Results]()
    var pub: AnyPublisher<(data: Data, response: URLResponse), URLError>? = nil
    var sub: Cancellable? = nil
    @Published var loading = false
    @Published var selectedResults : Results?
    
    init() {
        let baseURL = "https://api.nytimes.com/svc"
        let section = "all-sections"
        let timePeriod = "7"
        let apiMostPopularArticles = "/mostpopular/v2/mostviewed/\(section)/\(timePeriod).json"
        
        let urlPath = baseURL + apiMostPopularArticles + "?api-key=\(APIKEY)"
        guard let url = URL(string: urlPath) else {return}
        
        pub = URLSession.shared.dataTaskPublisher(for: url)
            .eraseToAnyPublisher()
        sub = pub?.sink(
            receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                }
            },
            receiveValue: { item in
                do {
                    print(item.data)
                    let item = try JSONDecoder().decode(NYTimeModel.self , from: item.data)
                    DispatchQueue.main.async {
                        
                        self.results = item.results  ?? []
                        self.loading = true
                    }
                } catch {
                    print("Failed to decode \(error)")
                }
            }
        )
    }
}
