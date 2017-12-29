//
//  iTunesLibraryContent.swift
//  iTunes Library ParserPackageDescription
//
//  Created by Jacob Williams on 12/22/17.
//

import Foundation
import FileKit

public class iTunesLibraryContent: Decodable {
    public var trackID: UInt
    public var persistentID: String
    public var type: ContentType
    public var size: UInt?
    public var duration: UInt?
    public var year: UInt?
    public var modified: Date?
    public var added: Date?
    public var bitRate: UInt?
    public var sampleRate: UInt?
    public var playCount: UInt
    public var lastPlayedOn: Date?
    public var skipCount: UInt?
    public var lastSkippedOn: Date?
    public var releaseDate: Date?
    public var musicVideo: Bool
    public var hasVideo: Bool
    public var movie: Bool
    public var purchased: Bool
    public var matched: Bool
    public var podcast: Bool
    public var unplayed: Bool
    public var appleMusic: Bool
    public var playlistOnly: Bool
    public var explicit: Bool
    public var name: String?
    public var sortName: String?
    public var artist: String?
    public var sortArtist: String?
    public var albumArtist: String?
    public var sortAlbumArtist: String?
    public var album: String?
    public var sortAlbum: String?
    public var composer: String?
    public var sortComposer: String?
    public var grouping: String?
    public var genre: String?
    public var kind: ContentKind
    public var location: Path?
    public var comments: String?
    public var rating: ContentRating?
    public var discNumber: UInt?
    public var discCount: UInt?
    public var trackNumber: UInt?
    public var trackCount: UInt?

    enum CodingKeys: String, CodingKey {
        case trackID = "Track ID"
        case persistentID = "Persistent ID"
        case type = "Track Type"
        case size = "Size"
        case duration = "Total Time"
        case year = "Year"
        case modified = "Date Modified"
        case added = "Date Added"
        case bitRate = "Bit Rate"
        case sampleRate = "Sample Rate"
        case playCount = "Play Count"
        case lastPlayedOn = "Play Date UTC"
        case skipCount = "Skip Count"
        case lastSkippedOn = "Skip Date"
        case releaseDate = "Release Date"
        case musicVideo = "Music Video"
        case hasVideo = "Has Video"
        case movie = "Movie"
        case purchased = "Purchased"
        case matched = "Matched"
        case podcast = "Podcast"
        case unplayed = "Unplayed"
        case appleMusic = "Apple Music"
        case playlistOnly = "Playlist Only"
        case explicit = "Explicit"
        case name = "Name"
        case sortName = "Sort Name"
        case artist = "Artist"
        case sortArtist = "Sort Artist"
        case albumArtist = "Album Artist"
        case sortAlbumArtist = "Sort Album Artist"
        case album = "Album"
        case sortAlbum = "Sort Album"
        case composer = "Composer"
        case sortComposer  = "Sort Composer"
        case grouping = "Grouping"
        case genre = "Genre"
        case kind = "Kind"
        case location = "Location"
        case comments = "Comments"
        case rating = "Content Rating"
        case discNumber = "Disc Number"
        case discCount = "Disc Count"
        case trackNumber = "Track Number"
        case trackCount = "Track Count"
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        trackID = try container.decode(UInt.self, forKey: .trackID)
        persistentID = try container.decode(String.self, forKey: .persistentID)
        type = try container.decode(ContentType.self, forKey: .type)
        size = try container.decodeIfPresent(UInt.self, forKey: .size)
        duration = try container.decodeIfPresent(UInt.self, forKey: .duration)
        year = try container.decodeIfPresent(UInt.self, forKey: .year)
        modified = try container.decodeIfPresent(Date.self, forKey: .modified)
        added = try container.decodeIfPresent(Date.self, forKey: .added)
        bitRate = try container.decodeIfPresent(UInt.self, forKey: .bitRate)
        sampleRate = try container.decodeIfPresent(UInt.self, forKey: .sampleRate)
        playCount = try container.decodeIfPresent(UInt.self, forKey: .playCount) ?? 0
        lastPlayedOn = try container.decodeIfPresent(Date.self, forKey: .lastPlayedOn)
        skipCount = try container.decodeIfPresent(UInt.self, forKey: .skipCount)
        lastSkippedOn = try container.decodeIfPresent(Date.self, forKey: .lastSkippedOn)
        releaseDate = try container.decodeIfPresent(Date.self, forKey: .releaseDate)
        musicVideo = try container.decodeIfPresent(Bool.self, forKey: .musicVideo) ?? false
        hasVideo = try container.decodeIfPresent(Bool.self, forKey: .hasVideo) ?? false
        movie = try container.decodeIfPresent(Bool.self, forKey: .movie) ?? false
        purchased = try container.decodeIfPresent(Bool.self, forKey: .purchased) ?? false
        matched = try container.decodeIfPresent(Bool.self, forKey: .matched) ?? false
        podcast = try container.decodeIfPresent(Bool.self, forKey: .podcast) ?? false
        unplayed = try container.decodeIfPresent(Bool.self, forKey: .unplayed) ?? false
        appleMusic = try container.decodeIfPresent(Bool.self, forKey: .appleMusic) ?? false
        playlistOnly = try container.decodeIfPresent(Bool.self, forKey: .playlistOnly) ?? false
        explicit = try container.decodeIfPresent(Bool.self, forKey: .explicit) ?? false
        name = try container.decodeIfPresent(String.self, forKey: .name)
        sortName = try container.decodeIfPresent(String.self, forKey: .sortName)
        artist = try container.decodeIfPresent(String.self, forKey: .artist)
        sortArtist = try container.decodeIfPresent(String.self, forKey: .sortArtist)
        albumArtist = try container.decodeIfPresent(String.self, forKey: .albumArtist)
        sortAlbumArtist = try container.decodeIfPresent(String.self, forKey: .sortAlbumArtist)
        album = try container.decodeIfPresent(String.self, forKey: .album)
        sortAlbum = try container.decodeIfPresent(String.self, forKey: .sortAlbum)
        composer = try container.decodeIfPresent(String.self, forKey: .composer)
        sortComposer = try container.decodeIfPresent(String.self, forKey: .sortComposer)
        grouping = try container.decodeIfPresent(String.self, forKey: .grouping)
        genre = try container.decodeIfPresent(String.self, forKey: .genre)
        kind = try container.decodeIfPresent(ContentKind.self, forKey: .kind) ?? .none
        if type == .file {
            let locationString = try container.decode(String.self, forKey: .location)
            location = Path(locationString.replacingOccurrences(of: "file://", with: ""))
        }
        comments = try container.decodeIfPresent(String.self, forKey: .comments)
        rating = try container.decodeIfPresent(ContentRating.self, forKey: .rating)
        discNumber = try container.decodeIfPresent(UInt.self, forKey: .discNumber)
        discCount = try container.decodeIfPresent(UInt.self, forKey: .discCount)
        trackNumber = try container.decodeIfPresent(UInt.self, forKey: .trackNumber)
        trackCount = try container.decodeIfPresent(UInt.self, forKey: .trackCount)
    }
}

public enum ContentType: String, Decodable {
    case file = "File"
    case remote = "Remote"
    case url = "URL"
}

public enum AudioContentKind: String, Decodable {
    case mpeg
    case mpeg4
    case aac
    case wav
    case stream
    case ringtone
}

public enum VideoContentKind: String, Decodable {
    case mpeg4
}

public enum ContentKind: Decodable {
    case audio(AudioContentKind)
    case video(VideoContentKind)
    case none
    indirect case protected(ContentKind)

    public init(from decoder: Decoder) throws {
        var rawValue = try decoder.singleValueContainer().decode(String.self)
        rawValue = rawValue.replacingOccurrences(of: "Purchased ", with: "")
        rawValue = rawValue.replacingOccurrences(of: "Matched ", with: "")
        rawValue = rawValue.replacingOccurrences(of: " file", with: "")
        rawValue = rawValue.replacingOccurrences(of: "-", with: "")
        rawValue = rawValue.replacingOccurrences(of: "Apple Music ", with: "")

        let old = rawValue
        rawValue = rawValue.replacingOccurrences(of: "Protected ", with: "")
        var protected = false
        if old != rawValue {
            protected = true
        }

        var kind: ContentKind
        if rawValue.hasSuffix(" audio") {
            kind = .audio(AudioContentKind(rawValue: rawValue.replacingOccurrences(of: " audio", with: "").lowercased())!)
        } else if rawValue.hasSuffix(" video") {
            kind = .video(VideoContentKind(rawValue: rawValue.replacingOccurrences(of: " video", with: "").lowercased())!)
        } else if rawValue.hasSuffix(" stream") {
            kind = .audio(.stream)
        } else if rawValue == "Ringtone" {
            kind = .audio(.ringtone)
        } else {
            fatalError("Unknown kind: '\(rawValue)'")
        }

        if protected {
            self = .protected(kind)
        } else {
            self = kind
        }
    }
}

public struct ContentRating: Decodable {
    public let organization: String
    public let rating: Rating
    public let reason: String

    public enum Rating: String {
        case g
        case pg
        case pg13
        case r
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()

        let str = try container.decode(String.self)
        let parts = str.components(separatedBy: "|")

        organization = parts[0]
        rating = Rating(rawValue: parts[1].replacingOccurrences(of: "-", with: "").lowercased())!
        reason = parts[3]
    }
}
