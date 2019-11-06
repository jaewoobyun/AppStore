// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let appReviewData = try? newJSONDecoder().decode(AppReviewData.self, from: jsonData)

import Foundation

// MARK: - AppReviewData
struct AppReviewData: Codable {
    var feed: Feeds?
}

// MARK: - Feed
struct Feeds: Codable {
    var author: FeedAuthor?
    var entry: [Entrys]?
    var updated, rights, title, label: label?
//    var link: [LinkElement]?
    var id: label?
}

// MARK: - FeedAuthor
struct FeedAuthor: Codable {
    var name, uri: label?
}

// MARK: - label
struct label: Codable {
    var label: String?
}

// MARK: - Entry
struct Entrys: Codable {
    var author: EntryAuthor?
    var imVersion, imRating, id, title: label?
    var content: Content?
//    var link: EntryLinks?
    var imVoteSum: label?
//    var imContentType: IMContentTypes?
    var imVoteCount: label?

    enum CodingKeys: String, CodingKey {
        case author
        case imVersion
        case imRating = "im:rating"
        case id, title, content//, link
        case imVoteSum
//        case imContentType
        case imVoteCount
    }
}

// MARK: - EntryAuthor
struct EntryAuthor: Codable {
    var uri, name: label?
    var label: String?
}

// MARK: - Content
struct Content: Codable {
    var label: String?
//    var attributes: ContentAttributes?
}

//// MARK: - ContentAttributes
//struct ContentAttributes: Codable {
//    var type: TypeEnum?
//}
//
//enum TypeEnum: String, Codable {
//    case text = "text"
//}
//
//// MARK: - IMContentType
//struct IMContentTypes: Codable {
//    var attributes: IMContentTypeAttributes?
//}
//
//// MARK: - IMContentTypeAttributes
//struct IMContentTypeAttributes: Codable {
//    var term: Term?
//    var label: Label?
//}

enum Label: String, Codable {
    case 앱 = "앱"
}

enum Term: String, Codable {
    case application = "Application"
}

//// MARK: - EntryLink
//struct EntryLinks: Codable {
//    var attributes: PurpleAttributes?
//}
//
//// MARK: - PurpleAttributes
//struct PurpleAttributes: Codable {
//    var rel: Rel?
//    var href: String?
//}
//
//enum Rel: String, Codable {
//    case related = "related"
//}
//
//// MARK: - LinkElement
//struct LinkElement: Codable {
//    var attributes: FluffyAttributes?
//}
//
//// MARK: - FluffyAttributes
//struct FluffyAttributes: Codable {
//    var rel, type: String?
//    var href: String?
//}
