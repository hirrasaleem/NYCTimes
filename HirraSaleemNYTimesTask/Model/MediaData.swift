//
//  Media.swift
//  HirraSaleemNYTimesTask
//
//  Created by Hirra on 29/04/2023.
//

import Foundation
struct MediaData : Codable, Hashable {
    var url: URL
    var format: String

}

// MARK: - Sample Data
#if DEBUG
extension MediaData {
    static let exampleData = [
        MediaData(url: URL(string: "https://static01.nyt.com/images/2021/04/23/business/00Virus-Doses-01/merlin_186604812_a38b6576-e784-4bf0-985f-293733bfddb0-thumbStandard.jpg")!, format: "Standard Thumbnail"),
        MediaData(url: URL(string: "https://static01.nyt.com/images/2021/04/23/business/00Virus-Doses-01/merlin_186604812_a38b6576-e784-4bf0-985f-293733bfddb0-mediumThreeByTwo210.jpg")!, format: "mediumThreeByTwo210"),
        MediaData(url: URL(string: "https://static01.nyt.com/images/2021/04/23/business/00Virus-Doses-01/merlin_186604812_a38b6576-e784-4bf0-985f-293733bfddb0-mediumThreeByTwo440.jpg")!, format: "mediumThreeByTwo440")
    ]
}
#endif
