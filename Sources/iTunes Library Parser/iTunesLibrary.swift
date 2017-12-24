//
//  iTunesLibrary.swift
//  iTunes Library Parser
//
//  Created by Jacob Williams on 12/22/17.
//  Copyright © 2017 JTW. All rights reserved.
//

import Foundation
import FileKit

public enum iTunesLibraryError: Error {
    case iTunesLibraryNotShared

    var localizedDescription: String {
        switch self {
        case .iTunesLibraryNotShared:
            return "You need to configure iTunes to share the iTunes Library XML with other applications."
        }
    }
}

public class iTunesLibrary: Decodable {
    let applicationVersion: String
    let date: Date
    let persistentID: String
    let tracks: [Int: iTunesLibraryContent]

    enum CodingKeys: String, CodingKey {
        case applicationVersion = "Application Version"
        case date = "Date"
        case persistentID = "Library Persistent ID"
        case tracks = "Tracks"
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        applicationVersion = try container.decode(String.self, forKey: .applicationVersion)
        date = try container.decode(Date.self, forKey: .date)
        persistentID = try container.decode(String.self, forKey: .persistentID)
        tracks = try container.decode([Int: iTunesLibraryContent].self, forKey: .tracks)
    }
}
