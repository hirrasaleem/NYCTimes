//
//  Media+Extension.swift
//  HirraSaleemNYTimesTask
//
//  Created by Apple on 29/04/2023.
//

import Foundation

struct Media: Codable, Equatable, Hashable {
    static func == (lhs: Media, rhs: Media) -> Bool {
        return lhs.type == rhs.type &&
            lhs.subtype == rhs.subtype &&
            lhs.caption == rhs.caption &&
            lhs.copyright == rhs.copyright
    }

    var type: String
    var subtype: String
    var caption: String
    var copyright: String

    var mediaMetadata: [MediaData]

    enum CodingKeys: String, CodingKey {
        case type
        case subtype
        case caption
        case copyright

        case mediaMetadata = "media-metadata"
    }
}

// MARK: - Sample Data
#if DEBUG
extension Media {
    static let exampleData = Media(type: "image", subtype: "photo", caption: "Syringes with the Pfizer vaccine are ready to be distributed in Dearborn, Mich.", copyright: "Emily Rose Bennett for The New York Times", mediaMetadata: MediaData.exampleData)
}
#endif
