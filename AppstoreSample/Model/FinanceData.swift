//
//  FinanceData.swift
//  AppstoreSample
//
//  Created by Nomad on 2019/10/28.
//  Copyright © 2019 Nomad. All rights reserved.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let financeData = try? newJSONDecoder().decode(FinanceData.self, from: jsonData)
//
//// MARK: - FinanceData
struct FinanceData: Codable {
    let feed: Feed
}

// MARK: - Feed
struct Feed: Codable {
    let author: Author?
    let entry: [Entry]?
    let updated, rights, title, icon: Icon?
    let link: [FeedLink]?
    let id: Icon?
}

// MARK: - Author
struct Author: Codable {
    let name, uri: Icon
}

// MARK: - Icon
struct Icon: Codable {
    let label: String
}

// MARK: - Entry
struct Entry: Codable {
    let imName: Icon
    let imImage: [IMImage]
    let summary: Icon
    let imPrice: IMPrice
    let imContentType: IMContentType
    let rights, title: Icon
    let link: [EntryLink]
    let id: ID
    let imArtist: IMArtist
    let category: Category
//    let imReleaseDate: IMReleaseDate

    enum CodingKeys: String, CodingKey {
        case imName = "im:name"
        case imImage = "im:image"
        case summary
        case imPrice = "im:price"
        case imContentType = "im:contentType"
        case rights, title, link, id
        case imArtist = "im:artist"
        case category
//        case imReleaseDate = "im:releaseDate"
    }
}

// MARK: - Category
struct Category: Codable {
    let attributes: CategoryAttributes
}

// MARK: - CategoryAttributes
struct CategoryAttributes: Codable {
    let imID: String
    let term: String //PurpleTerm
    let scheme: String
    let label: String // PurpleLabel

    enum CodingKeys: String, CodingKey {
        case imID = "im:id"
        case term, scheme, label
    }
}

enum PurpleLabel: String, Codable {
    case 금융 = "금융"
}

enum PurpleTerm: String, Codable {
    case finance = "Finance"
}

// MARK: - ID
struct ID: Codable {
    let label: String
    let attributes: IDAttributes
}

// MARK: - IDAttributes
struct IDAttributes: Codable {
    let imID, imBundleID: String

    enum CodingKeys: String, CodingKey {
        case imID = "im:id"
        case imBundleID = "im:bundleId"
    }
}

// MARK: - IMArtist
struct IMArtist: Codable {
    let label: String
    let attributes: IMArtistAttributes
}

// MARK: - IMArtistAttributes
struct IMArtistAttributes: Codable {
    let href: String
}

// MARK: - IMContentType
struct IMContentType: Codable {
    let attributes: IMContentTypeAttributes
}

// MARK: - IMContentTypeAttributes
struct IMContentTypeAttributes: Codable {
    let term: FluffyTerm
    let label: FluffyLabel
}

enum FluffyLabel: String, Codable {
    case 앱 = "앱"
}

enum FluffyTerm: String, Codable {
    case application = "Application"
}

// MARK: - IMImage
struct IMImage: Codable {
    let label: String
    let attributes: IMImageAttributes
}

// MARK: - IMImageAttributes
struct IMImageAttributes: Codable {
    let height: String
}

// MARK: - IMPrice
struct IMPrice: Codable {
    let label: String
    let attributes: IMPriceAttributes
}

// MARK: - IMPriceAttributes
struct IMPriceAttributes: Codable {
    let amount: String
    let currency: String
}

//enum Currency: String, Codable {
//    case krw = "KRW"
//}

//enum IMPriceLabel: String, Codable {
//    case 받기 = "받기"
//}

// MARK: - IMReleaseDate
struct IMReleaseDate: Codable {
    let label: Date?
    let attributes: Icon?
}

// MARK: - EntryLink
struct EntryLink: Codable {
    let attributes: PurpleAttributes
    let imDuration: Icon?

    enum CodingKeys: String, CodingKey {
        case attributes
        case imDuration = "im:duration"
    }
}

// MARK: - PurpleAttributes
struct PurpleAttributes: Codable {
    let rel: Rel
    let type: TypeEnum
    let href: String
    let title: Title?
    let imAssetType: IMAssetType?

    enum CodingKeys: String, CodingKey {
        case rel, type, href, title
        case imAssetType = "im:assetType"
    }
}

enum IMAssetType: String, Codable {
    case preview = "preview"
}

enum Rel: String, Codable {
    case alternate = "alternate"
    case enclosure = "enclosure"
}

enum Title: String, Codable {
    case 미리보기 = "미리보기"
}

enum TypeEnum: String, Codable {
    case imageJPEG = "image/jpeg"
    case textHTML = "text/html"
}

// MARK: - FeedLink
struct FeedLink: Codable {
    let attributes: FluffyAttributes
}

// MARK: - FluffyAttributes
struct FluffyAttributes: Codable {
    let rel: String
    let type: TypeEnum?
    let href: String
}

//----------------------------------------------------------------------
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let financeData = try FinanceData(json)
//
//import Foundation
//
//// MARK: - FinanceData
//struct FinanceData: Codable {
//    var feed: Feed?
//}
//
//// MARK: FinanceData convenience initializers and mutators
//
//extension FinanceData {
//    init(data: Data) throws {
//        self = try newJSONDecoder().decode(FinanceData.self, from: data)
//    }
//
//    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
//        guard let data = json.data(using: encoding) else {
//            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
//        }
//        try self.init(data: data)
//    }
//
//    init(fromURL url: URL) throws {
//        try self.init(data: try Data(contentsOf: url))
//    }
//
//    func with(
//        feed: Feed?? = nil
//    ) -> FinanceData {
//        return FinanceData(
//            feed: feed ?? self.feed
//        )
//    }
//
//    func jsonData() throws -> Data {
//        return try newJSONEncoder().encode(self)
//    }
//
//    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
//        return String(data: try self.jsonData(), encoding: encoding)
//    }
//}
//
//// MARK: - Feed
//struct Feed: Codable {
//    var author: Author?
//    var entry: [Entry]?
//    var updated, rights, title, icon: Icon?
//    var link: [FeedLink]?
//    var id: Icon?
//}
//
//// MARK: Feed convenience initializers and mutators
//
//extension Feed {
//    init(data: Data) throws {
//        self = try newJSONDecoder().decode(Feed.self, from: data)
//    }
//
//    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
//        guard let data = json.data(using: encoding) else {
//            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
//        }
//        try self.init(data: data)
//    }
//
//    init(fromURL url: URL) throws {
//        try self.init(data: try Data(contentsOf: url))
//    }
//
//    func with(
//        author: Author?? = nil,
//        entry: [Entry]?? = nil,
//        updated: Icon?? = nil,
//        rights: Icon?? = nil,
//        title: Icon?? = nil,
//        icon: Icon?? = nil,
//        link: [FeedLink]?? = nil,
//        id: Icon?? = nil
//    ) -> Feed {
//        return Feed(
//            author: author ?? self.author,
//            entry: entry ?? self.entry,
//            updated: updated ?? self.updated,
//            rights: rights ?? self.rights,
//            title: title ?? self.title,
//            icon: icon ?? self.icon,
//            link: link ?? self.link,
//            id: id ?? self.id
//        )
//    }
//
//    func jsonData() throws -> Data {
//        return try newJSONEncoder().encode(self)
//    }
//
//    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
//        return String(data: try self.jsonData(), encoding: encoding)
//    }
//}
//
//// MARK: - Author
//struct Author: Codable {
//    var name, uri: Icon?
//}
//
//// MARK: Author convenience initializers and mutators
//
//extension Author {
//    init(data: Data) throws {
//        self = try newJSONDecoder().decode(Author.self, from: data)
//    }
//
//    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
//        guard let data = json.data(using: encoding) else {
//            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
//        }
//        try self.init(data: data)
//    }
//
//    init(fromURL url: URL) throws {
//        try self.init(data: try Data(contentsOf: url))
//    }
//
//    func with(
//        name: Icon?? = nil,
//        uri: Icon?? = nil
//    ) -> Author {
//        return Author(
//            name: name ?? self.name,
//            uri: uri ?? self.uri
//        )
//    }
//
//    func jsonData() throws -> Data {
//        return try newJSONEncoder().encode(self)
//    }
//
//    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
//        return String(data: try self.jsonData(), encoding: encoding)
//    }
//}
//
//// MARK: - Icon
//struct Icon: Codable {
//    var label: String?
//}
//
//// MARK: Icon convenience initializers and mutators
//
//extension Icon {
//    init(data: Data) throws {
//        self = try newJSONDecoder().decode(Icon.self, from: data)
//    }
//
//    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
//        guard let data = json.data(using: encoding) else {
//            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
//        }
//        try self.init(data: data)
//    }
//
//    init(fromURL url: URL) throws {
//        try self.init(data: try Data(contentsOf: url))
//    }
//
//    func with(
//        label: String?? = nil
//    ) -> Icon {
//        return Icon(
//            label: label ?? self.label
//        )
//    }
//
//    func jsonData() throws -> Data {
//        return try newJSONEncoder().encode(self)
//    }
//
//    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
//        return String(data: try self.jsonData(), encoding: encoding)
//    }
//}
//
//// MARK: - Entry
//struct Entry: Codable {
//    var imName: Icon?
//    var imImage: [IMImage]?
//    var summary: Icon?
//    var imPrice: IMPrice?
//    var imContentType: IMContentType?
//    var rights, title: Icon?
//    var link: [EntryLink]?
//    var id: ID?
//    var imArtist: IMArtist?
//    var category: Category?
//    var imReleaseDate: IMReleaseDate?
//
//    enum CodingKeys: String, CodingKey {
//        case imName = "im:name"
//        case imImage = "im:image"
//        case summary
//        case imPrice = "im:price"
//        case imContentType = "im:contentType"
//        case rights, title, link, id
//        case imArtist = "im:artist"
//        case category
//        case imReleaseDate = "im:releaseDate"
//    }
//}
//
//// MARK: Entry convenience initializers and mutators
//
//extension Entry {
//    init(data: Data) throws {
//        self = try newJSONDecoder().decode(Entry.self, from: data)
//    }
//
//    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
//        guard let data = json.data(using: encoding) else {
//            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
//        }
//        try self.init(data: data)
//    }
//
//    init(fromURL url: URL) throws {
//        try self.init(data: try Data(contentsOf: url))
//    }
//
//    func with(
//        imName: Icon?? = nil,
//        imImage: [IMImage]?? = nil,
//        summary: Icon?? = nil,
//        imPrice: IMPrice?? = nil,
//        imContentType: IMContentType?? = nil,
//        rights: Icon?? = nil,
//        title: Icon?? = nil,
//        link: [EntryLink]?? = nil,
//        id: ID?? = nil,
//        imArtist: IMArtist?? = nil,
//        category: Category?? = nil,
//        imReleaseDate: IMReleaseDate?? = nil
//    ) -> Entry {
//        return Entry(
//            imName: imName ?? self.imName,
//            imImage: imImage ?? self.imImage,
//            summary: summary ?? self.summary,
//            imPrice: imPrice ?? self.imPrice,
//            imContentType: imContentType ?? self.imContentType,
//            rights: rights ?? self.rights,
//            title: title ?? self.title,
//            link: link ?? self.link,
//            id: id ?? self.id,
//            imArtist: imArtist ?? self.imArtist,
//            category: category ?? self.category,
//            imReleaseDate: imReleaseDate ?? self.imReleaseDate
//        )
//    }
//
//    func jsonData() throws -> Data {
//        return try newJSONEncoder().encode(self)
//    }
//
//    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
//        return String(data: try self.jsonData(), encoding: encoding)
//    }
//}
//
//// MARK: - Category
//struct Category: Codable {
//    var attributes: CategoryAttributes?
//}
//
//// MARK: Category convenience initializers and mutators
//
//extension Category {
//    init(data: Data) throws {
//        self = try newJSONDecoder().decode(Category.self, from: data)
//    }
//
//    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
//        guard let data = json.data(using: encoding) else {
//            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
//        }
//        try self.init(data: data)
//    }
//
//    init(fromURL url: URL) throws {
//        try self.init(data: try Data(contentsOf: url))
//    }
//
//    func with(
//        attributes: CategoryAttributes?? = nil
//    ) -> Category {
//        return Category(
//            attributes: attributes ?? self.attributes
//        )
//    }
//
//    func jsonData() throws -> Data {
//        return try newJSONEncoder().encode(self)
//    }
//
//    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
//        return String(data: try self.jsonData(), encoding: encoding)
//    }
//}
//
//// MARK: - CategoryAttributes
//struct CategoryAttributes: Codable {
//    var imID: String?
//    var term: PurpleTerm?
//    var scheme: String?
//    var label: PurpleLabel?
//
//    enum CodingKeys: String, CodingKey {
//        case imID = "im:id"
//        case term, scheme, label
//    }
//}
//
//// MARK: CategoryAttributes convenience initializers and mutators
//
//extension CategoryAttributes {
//    init(data: Data) throws {
//        self = try newJSONDecoder().decode(CategoryAttributes.self, from: data)
//    }
//
//    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
//        guard let data = json.data(using: encoding) else {
//            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
//        }
//        try self.init(data: data)
//    }
//
//    init(fromURL url: URL) throws {
//        try self.init(data: try Data(contentsOf: url))
//    }
//
//    func with(
//        imID: String?? = nil,
//        term: PurpleTerm?? = nil,
//        scheme: String?? = nil,
//        label: PurpleLabel?? = nil
//    ) -> CategoryAttributes {
//        return CategoryAttributes(
//            imID: imID ?? self.imID,
//            term: term ?? self.term,
//            scheme: scheme ?? self.scheme,
//            label: label ?? self.label
//        )
//    }
//
//    func jsonData() throws -> Data {
//        return try newJSONEncoder().encode(self)
//    }
//
//    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
//        return String(data: try self.jsonData(), encoding: encoding)
//    }
//}
//
//enum PurpleLabel: String, Codable {
//    case 금융 = "금융"
//}
//
//enum PurpleTerm: String, Codable {
//    case finance = "Finance"
//}
//
//// MARK: - ID
//struct ID: Codable {
//    var label: String?
//    var attributes: IDAttributes?
//}
//
//// MARK: ID convenience initializers and mutators
//
//extension ID {
//    init(data: Data) throws {
//        self = try newJSONDecoder().decode(ID.self, from: data)
//    }
//
//    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
//        guard let data = json.data(using: encoding) else {
//            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
//        }
//        try self.init(data: data)
//    }
//
//    init(fromURL url: URL) throws {
//        try self.init(data: try Data(contentsOf: url))
//    }
//
//    func with(
//        label: String?? = nil,
//        attributes: IDAttributes?? = nil
//    ) -> ID {
//        return ID(
//            label: label ?? self.label,
//            attributes: attributes ?? self.attributes
//        )
//    }
//
//    func jsonData() throws -> Data {
//        return try newJSONEncoder().encode(self)
//    }
//
//    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
//        return String(data: try self.jsonData(), encoding: encoding)
//    }
//}
//
//// MARK: - IDAttributes
//struct IDAttributes: Codable {
//    var imID, imBundleID: String?
//
//    enum CodingKeys: String, CodingKey {
//        case imID = "im:id"
//        case imBundleID = "im:bundleId"
//    }
//}
//
//// MARK: IDAttributes convenience initializers and mutators
//
//extension IDAttributes {
//    init(data: Data) throws {
//        self = try newJSONDecoder().decode(IDAttributes.self, from: data)
//    }
//
//    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
//        guard let data = json.data(using: encoding) else {
//            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
//        }
//        try self.init(data: data)
//    }
//
//    init(fromURL url: URL) throws {
//        try self.init(data: try Data(contentsOf: url))
//    }
//
//    func with(
//        imID: String?? = nil,
//        imBundleID: String?? = nil
//    ) -> IDAttributes {
//        return IDAttributes(
//            imID: imID ?? self.imID,
//            imBundleID: imBundleID ?? self.imBundleID
//        )
//    }
//
//    func jsonData() throws -> Data {
//        return try newJSONEncoder().encode(self)
//    }
//
//    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
//        return String(data: try self.jsonData(), encoding: encoding)
//    }
//}
//
//// MARK: - IMArtist
//struct IMArtist: Codable {
//    var label: String?
//    var attributes: IMArtistAttributes?
//}
//
//// MARK: IMArtist convenience initializers and mutators
//
//extension IMArtist {
//    init(data: Data) throws {
//        self = try newJSONDecoder().decode(IMArtist.self, from: data)
//    }
//
//    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
//        guard let data = json.data(using: encoding) else {
//            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
//        }
//        try self.init(data: data)
//    }
//
//    init(fromURL url: URL) throws {
//        try self.init(data: try Data(contentsOf: url))
//    }
//
//    func with(
//        label: String?? = nil,
//        attributes: IMArtistAttributes?? = nil
//    ) -> IMArtist {
//        return IMArtist(
//            label: label ?? self.label,
//            attributes: attributes ?? self.attributes
//        )
//    }
//
//    func jsonData() throws -> Data {
//        return try newJSONEncoder().encode(self)
//    }
//
//    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
//        return String(data: try self.jsonData(), encoding: encoding)
//    }
//}
//
//// MARK: - IMArtistAttributes
//struct IMArtistAttributes: Codable {
//    var href: String?
//}
//
//// MARK: IMArtistAttributes convenience initializers and mutators
//
//extension IMArtistAttributes {
//    init(data: Data) throws {
//        self = try newJSONDecoder().decode(IMArtistAttributes.self, from: data)
//    }
//
//    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
//        guard let data = json.data(using: encoding) else {
//            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
//        }
//        try self.init(data: data)
//    }
//
//    init(fromURL url: URL) throws {
//        try self.init(data: try Data(contentsOf: url))
//    }
//
//    func with(
//        href: String?? = nil
//    ) -> IMArtistAttributes {
//        return IMArtistAttributes(
//            href: href ?? self.href
//        )
//    }
//
//    func jsonData() throws -> Data {
//        return try newJSONEncoder().encode(self)
//    }
//
//    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
//        return String(data: try self.jsonData(), encoding: encoding)
//    }
//}
//
//// MARK: - IMContentType
//struct IMContentType: Codable {
//    var attributes: IMContentTypeAttributes?
//}
//
//// MARK: IMContentType convenience initializers and mutators
//
//extension IMContentType {
//    init(data: Data) throws {
//        self = try newJSONDecoder().decode(IMContentType.self, from: data)
//    }
//
//    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
//        guard let data = json.data(using: encoding) else {
//            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
//        }
//        try self.init(data: data)
//    }
//
//    init(fromURL url: URL) throws {
//        try self.init(data: try Data(contentsOf: url))
//    }
//
//    func with(
//        attributes: IMContentTypeAttributes?? = nil
//    ) -> IMContentType {
//        return IMContentType(
//            attributes: attributes ?? self.attributes
//        )
//    }
//
//    func jsonData() throws -> Data {
//        return try newJSONEncoder().encode(self)
//    }
//
//    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
//        return String(data: try self.jsonData(), encoding: encoding)
//    }
//}
//
//// MARK: - IMContentTypeAttributes
//struct IMContentTypeAttributes: Codable {
//    var term: FluffyTerm?
//    var label: FluffyLabel?
//}
//
//// MARK: IMContentTypeAttributes convenience initializers and mutators
//
//extension IMContentTypeAttributes {
//    init(data: Data) throws {
//        self = try newJSONDecoder().decode(IMContentTypeAttributes.self, from: data)
//    }
//
//    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
//        guard let data = json.data(using: encoding) else {
//            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
//        }
//        try self.init(data: data)
//    }
//
//    init(fromURL url: URL) throws {
//        try self.init(data: try Data(contentsOf: url))
//    }
//
//    func with(
//        term: FluffyTerm?? = nil,
//        label: FluffyLabel?? = nil
//    ) -> IMContentTypeAttributes {
//        return IMContentTypeAttributes(
//            term: term ?? self.term,
//            label: label ?? self.label
//        )
//    }
//
//    func jsonData() throws -> Data {
//        return try newJSONEncoder().encode(self)
//    }
//
//    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
//        return String(data: try self.jsonData(), encoding: encoding)
//    }
//}
//
//enum FluffyLabel: String, Codable {
//    case 앱 = "앱"
//}
//
//enum FluffyTerm: String, Codable {
//    case application = "Application"
//}
//
//// MARK: - IMImage
//struct IMImage: Codable {
//    var label: String?
//    var attributes: IMImageAttributes?
//}
//
//// MARK: IMImage convenience initializers and mutators
//
//extension IMImage {
//    init(data: Data) throws {
//        self = try newJSONDecoder().decode(IMImage.self, from: data)
//    }
//
//    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
//        guard let data = json.data(using: encoding) else {
//            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
//        }
//        try self.init(data: data)
//    }
//
//    init(fromURL url: URL) throws {
//        try self.init(data: try Data(contentsOf: url))
//    }
//
//    func with(
//        label: String?? = nil,
//        attributes: IMImageAttributes?? = nil
//    ) -> IMImage {
//        return IMImage(
//            label: label ?? self.label,
//            attributes: attributes ?? self.attributes
//        )
//    }
//
//    func jsonData() throws -> Data {
//        return try newJSONEncoder().encode(self)
//    }
//
//    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
//        return String(data: try self.jsonData(), encoding: encoding)
//    }
//}
//
//// MARK: - IMImageAttributes
//struct IMImageAttributes: Codable {
//    var height: String?
//}
//
//// MARK: IMImageAttributes convenience initializers and mutators
//
//extension IMImageAttributes {
//    init(data: Data) throws {
//        self = try newJSONDecoder().decode(IMImageAttributes.self, from: data)
//    }
//
//    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
//        guard let data = json.data(using: encoding) else {
//            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
//        }
//        try self.init(data: data)
//    }
//
//    init(fromURL url: URL) throws {
//        try self.init(data: try Data(contentsOf: url))
//    }
//
//    func with(
//        height: String?? = nil
//    ) -> IMImageAttributes {
//        return IMImageAttributes(
//            height: height ?? self.height
//        )
//    }
//
//    func jsonData() throws -> Data {
//        return try newJSONEncoder().encode(self)
//    }
//
//    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
//        return String(data: try self.jsonData(), encoding: encoding)
//    }
//}
//
//// MARK: - IMPrice
//struct IMPrice: Codable {
//    var label: IMPriceLabel?
//    var attributes: IMPriceAttributes?
//}
//
//// MARK: IMPrice convenience initializers and mutators
//
//extension IMPrice {
//    init(data: Data) throws {
//        self = try newJSONDecoder().decode(IMPrice.self, from: data)
//    }
//
//    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
//        guard let data = json.data(using: encoding) else {
//            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
//        }
//        try self.init(data: data)
//    }
//
//    init(fromURL url: URL) throws {
//        try self.init(data: try Data(contentsOf: url))
//    }
//
//    func with(
//        label: IMPriceLabel?? = nil,
//        attributes: IMPriceAttributes?? = nil
//    ) -> IMPrice {
//        return IMPrice(
//            label: label ?? self.label,
//            attributes: attributes ?? self.attributes
//        )
//    }
//
//    func jsonData() throws -> Data {
//        return try newJSONEncoder().encode(self)
//    }
//
//    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
//        return String(data: try self.jsonData(), encoding: encoding)
//    }
//}
//
//// MARK: - IMPriceAttributes
//struct IMPriceAttributes: Codable {
//    var amount: String?
//    var currency: Currency?
//}
//
//// MARK: IMPriceAttributes convenience initializers and mutators
//
//extension IMPriceAttributes {
//    init(data: Data) throws {
//        self = try newJSONDecoder().decode(IMPriceAttributes.self, from: data)
//    }
//
//    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
//        guard let data = json.data(using: encoding) else {
//            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
//        }
//        try self.init(data: data)
//    }
//
//    init(fromURL url: URL) throws {
//        try self.init(data: try Data(contentsOf: url))
//    }
//
//    func with(
//        amount: String?? = nil,
//        currency: Currency?? = nil
//    ) -> IMPriceAttributes {
//        return IMPriceAttributes(
//            amount: amount ?? self.amount,
//            currency: currency ?? self.currency
//        )
//    }
//
//    func jsonData() throws -> Data {
//        return try newJSONEncoder().encode(self)
//    }
//
//    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
//        return String(data: try self.jsonData(), encoding: encoding)
//    }
//}
//
//enum Currency: String, Codable {
//    case krw = "KRW"
//}
//
//enum IMPriceLabel: String, Codable {
//    case 받기 = "받기"
//}
//
//// MARK: - IMReleaseDate
//struct IMReleaseDate: Codable {
//    var label: Date?
//    var attributes: Icon?
//}
//
//// MARK: IMReleaseDate convenience initializers and mutators
//
//extension IMReleaseDate {
//    init(data: Data) throws {
//        self = try newJSONDecoder().decode(IMReleaseDate.self, from: data)
//    }
//
//    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
//        guard let data = json.data(using: encoding) else {
//            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
//        }
//        try self.init(data: data)
//    }
//
//    init(fromURL url: URL) throws {
//        try self.init(data: try Data(contentsOf: url))
//    }
//
//    func with(
//        label: Date?? = nil,
//        attributes: Icon?? = nil
//    ) -> IMReleaseDate {
//        return IMReleaseDate(
//            label: label ?? self.label,
//            attributes: attributes ?? self.attributes
//        )
//    }
//
//    func jsonData() throws -> Data {
//        return try newJSONEncoder().encode(self)
//    }
//
//    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
//        return String(data: try self.jsonData(), encoding: encoding)
//    }
//}
//
//// MARK: - EntryLink
//struct EntryLink: Codable {
//    var attributes: PurpleAttributes?
//    var imDuration: Icon?
//
//    enum CodingKeys: String, CodingKey {
//        case attributes
//        case imDuration = "im:duration"
//    }
//}
//
//// MARK: EntryLink convenience initializers and mutators
//
//extension EntryLink {
//    init(data: Data) throws {
//        self = try newJSONDecoder().decode(EntryLink.self, from: data)
//    }
//
//    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
//        guard let data = json.data(using: encoding) else {
//            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
//        }
//        try self.init(data: data)
//    }
//
//    init(fromURL url: URL) throws {
//        try self.init(data: try Data(contentsOf: url))
//    }
//
//    func with(
//        attributes: PurpleAttributes?? = nil,
//        imDuration: Icon?? = nil
//    ) -> EntryLink {
//        return EntryLink(
//            attributes: attributes ?? self.attributes,
//            imDuration: imDuration ?? self.imDuration
//        )
//    }
//
//    func jsonData() throws -> Data {
//        return try newJSONEncoder().encode(self)
//    }
//
//    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
//        return String(data: try self.jsonData(), encoding: encoding)
//    }
//}
//
//// MARK: - PurpleAttributes
//struct PurpleAttributes: Codable {
//    var rel: Rel?
//    var type: TypeEnum?
//    var href: String?
//    var title: Title?
//    var imAssetType: IMAssetType?
//
//    enum CodingKeys: String, CodingKey {
//        case rel, type, href, title
//        case imAssetType = "im:assetType"
//    }
//}
//
//// MARK: PurpleAttributes convenience initializers and mutators
//
//extension PurpleAttributes {
//    init(data: Data) throws {
//        self = try newJSONDecoder().decode(PurpleAttributes.self, from: data)
//    }
//
//    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
//        guard let data = json.data(using: encoding) else {
//            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
//        }
//        try self.init(data: data)
//    }
//
//    init(fromURL url: URL) throws {
//        try self.init(data: try Data(contentsOf: url))
//    }
//
//    func with(
//        rel: Rel?? = nil,
//        type: TypeEnum?? = nil,
//        href: String?? = nil,
//        title: Title?? = nil,
//        imAssetType: IMAssetType?? = nil
//    ) -> PurpleAttributes {
//        return PurpleAttributes(
//            rel: rel ?? self.rel,
//            type: type ?? self.type,
//            href: href ?? self.href,
//            title: title ?? self.title,
//            imAssetType: imAssetType ?? self.imAssetType
//        )
//    }
//
//    func jsonData() throws -> Data {
//        return try newJSONEncoder().encode(self)
//    }
//
//    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
//        return String(data: try self.jsonData(), encoding: encoding)
//    }
//}
//
//enum IMAssetType: String, Codable {
//    case preview = "preview"
//}
//
//enum Rel: String, Codable {
//    case alternate = "alternate"
//    case enclosure = "enclosure"
//}
//
//enum Title: String, Codable {
//    case 미리보기 = "미리보기"
//}
//
//enum TypeEnum: String, Codable {
//    case imageJPEG = "image/jpeg"
//    case textHTML = "text/html"
//}
//
//// MARK: - FeedLink
//struct FeedLink: Codable {
//    var attributes: FluffyAttributes?
//}
//
//// MARK: FeedLink convenience initializers and mutators
//
//extension FeedLink {
//    init(data: Data) throws {
//        self = try newJSONDecoder().decode(FeedLink.self, from: data)
//    }
//
//    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
//        guard let data = json.data(using: encoding) else {
//            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
//        }
//        try self.init(data: data)
//    }
//
//    init(fromURL url: URL) throws {
//        try self.init(data: try Data(contentsOf: url))
//    }
//
//    func with(
//        attributes: FluffyAttributes?? = nil
//    ) -> FeedLink {
//        return FeedLink(
//            attributes: attributes ?? self.attributes
//        )
//    }
//
//    func jsonData() throws -> Data {
//        return try newJSONEncoder().encode(self)
//    }
//
//    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
//        return String(data: try self.jsonData(), encoding: encoding)
//    }
//}
//
//// MARK: - FluffyAttributes
//struct FluffyAttributes: Codable {
//    var rel: String?
//    var type: TypeEnum?
//    var href: String?
//}
//
//// MARK: FluffyAttributes convenience initializers and mutators
//
//extension FluffyAttributes {
//    init(data: Data) throws {
//        self = try newJSONDecoder().decode(FluffyAttributes.self, from: data)
//    }
//
//    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
//        guard let data = json.data(using: encoding) else {
//            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
//        }
//        try self.init(data: data)
//    }
//
//    init(fromURL url: URL) throws {
//        try self.init(data: try Data(contentsOf: url))
//    }
//
//    func with(
//        rel: String?? = nil,
//        type: TypeEnum?? = nil,
//        href: String?? = nil
//    ) -> FluffyAttributes {
//        return FluffyAttributes(
//            rel: rel ?? self.rel,
//            type: type ?? self.type,
//            href: href ?? self.href
//        )
//    }
//
//    func jsonData() throws -> Data {
//        return try newJSONEncoder().encode(self)
//    }
//
//    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
//        return String(data: try self.jsonData(), encoding: encoding)
//    }
//}
//
//// MARK: - Helper functions for creating encoders and decoders
//
//func newJSONDecoder() -> JSONDecoder {
//    let decoder = JSONDecoder()
//    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
//        decoder.dateDecodingStrategy = .iso8601
//    }
//    return decoder
//}
//
//func newJSONEncoder() -> JSONEncoder {
//    let encoder = JSONEncoder()
//    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
//        encoder.dateEncodingStrategy = .iso8601
//    }
//    return encoder
//}
