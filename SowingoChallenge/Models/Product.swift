//
//  Product.swift
//  SowingoChallenge
//
//  Created by Antonio on 2020-12-21.
//

import Foundation

// MARK: - Products
struct Products: Codable {
    let hits: [Product]
}

// MARK: - Product
struct Product: Codable {
    let unitName: String
    let subcategory: HitParentCategory
    let objectID: String
    let medicalFieldID: MedicalFieldID
    let contentPerUnit: String
    let filters: Filters?
    let images: [Image]
    let onHand: Int?
    let hitID: String
    let mainImage240_Box, barcodes: JSONNull?
    let vendorInventory: [VendorInventoryElement]
    let countryID: CountryID
    let trackingMethod: String?
    let isFavouriteProduct: Bool
    let advertisingBadges: AdvertisingBadges
    let orderPackageQuantity: Int?
    let hitDescription: String
    let marketplaceID: MarketplaceID
    let parentCategory: HitParentCategory
    let highlightResult: HighlightResult
    let buyByCase: Bool?
    let minimumLevel: Int?
    let manufacturerSku: String
    let manufacturer: HitManufacturer
    let mainImage: String?
    let name: String
    let sdsURL: [String]?
    let officeInventoryItemID, itemType: String?
    let mainImage240_Wide: JSONNull?
    let id: String

    enum CodingKeys: String, CodingKey {
        case unitName = "unit_name"
        case subcategory, objectID
        case medicalFieldID = "medical_field_id"
        case contentPerUnit = "content_per_unit"
        case filters, images
        case onHand = "on_hand"
        case hitID = "id"
        case mainImage240_Box = "main_image_240_box"
        case barcodes
        case vendorInventory = "vendor_inventory"
        case countryID = "country_id"
        case trackingMethod = "tracking_method"
        case isFavouriteProduct = "is_favourite_product"
        case advertisingBadges = "advertising_badges"
        case orderPackageQuantity = "order_package_quantity"
        case hitDescription = "description"
        case marketplaceID = "marketplace_id"
        case parentCategory = "parent_category"
        case highlightResult = "_highlightResult"
        case buyByCase = "buy_by_case"
        case minimumLevel = "minimum_level"
        case manufacturerSku = "manufacturer_sku"
        case manufacturer
        case mainImage = "main_image"
        case name
        case sdsURL = "sds_url"
        case officeInventoryItemID = "office_inventory_item_id"
        case itemType = "item_type"
        case mainImage240_Wide = "main_image_240_wide"
        case id = "_id"
    }
}

// MARK: - AdvertisingBadges
struct AdvertisingBadges: Codable {
    let hasBadge: Bool
    let badges: [Badge]?

    enum CodingKeys: String, CodingKey {
        case hasBadge = "has_badge"
        case badges
    }
}

// MARK: - Badge
struct Badge: Codable {
    let badgeType: String
    let badgeImageURL: String

    enum CodingKeys: String, CodingKey {
        case badgeType = "badge_type"
        case badgeImageURL = "badge_image_url"
    }
}

enum CountryID: String, Codable {
    case ca = "CA"
}

// MARK: - Filters
struct Filters: Codable {
    let manufacturerName: String?
    let promotableItemUs, stepApproved: String
    let packageQuantity: String?
    let webClassification: String
    let totalVolume, caseQuantity, enrichedMktgBasic: String?
    let promotableItemCA: String
    let enrichedVendor, lightTipSize, bodyColor, rechargeability: String?
    let powerSource, lightType, batteryType, minimumLightWavelength: String?
    let lightSpectrum, maximumLightWavelength, bodyColorFamily, containerDimensions: String?
    let language, lidType, containerSize, warningLabel: String?
    let numberOfLidOpenings, colorFamily, containerColor, lidColor: String?
    let mountType, color, productType, maskConstruction: String?
    let maskType, fiberglassContent, standardsMet, productForm: String?
    let mixingAmount, safetyEnvironmentalFeatures, overallDiameter, overallLength: String?

    enum CodingKeys: String, CodingKey {
        case manufacturerName = "Manufacturer Name"
        case promotableItemUs = "Promotable Item Us"
        case stepApproved = "Step Approved"
        case packageQuantity = "Package Quantity"
        case webClassification = "Web Classification"
        case totalVolume = "Total Volume"
        case caseQuantity = "Case Quantity"
        case enrichedMktgBasic = "Enriched, Mktg Basic"
        case promotableItemCA = "Promotable Item Ca"
        case enrichedVendor = "Enriched, Vendor"
        case lightTipSize = "Light Tip Size"
        case bodyColor = "Body Color"
        case rechargeability = "Rechargeability"
        case powerSource = "Power Source"
        case lightType = "Light Type"
        case batteryType = "Battery Type"
        case minimumLightWavelength = "Minimum Light Wavelength"
        case lightSpectrum = "Light Spectrum"
        case maximumLightWavelength = "Maximum Light Wavelength"
        case bodyColorFamily = "Body Color Family"
        case containerDimensions = "Container Dimensions"
        case language = "Language"
        case lidType = "Lid Type"
        case containerSize = "Container Size"
        case warningLabel = "Warning Label"
        case numberOfLidOpenings = "Number Of Lid Openings"
        case colorFamily = "Color Family"
        case containerColor = "Container Color"
        case lidColor = "Lid Color"
        case mountType = "Mount Type"
        case color = "Color"
        case productType = "Product Type"
        case maskConstruction = "Mask Construction"
        case maskType = "Mask Type"
        case fiberglassContent = "Fiberglass Content"
        case standardsMet = "Standards Met"
        case productForm = "Product Form"
        case mixingAmount = "Mixing Amount"
        case safetyEnvironmentalFeatures = "Safety & Environmental Features"
        case overallDiameter = "Overall Diameter"
        case overallLength = "Overall Length"
    }
}

// MARK: - HighlightResult
struct HighlightResult: Codable {
    let subcategory: HighlightResultParentCategory
    let marketplaceID: Description
    let vendorInventory: HighlightResultVendorInventory
    let parentCategory: HighlightResultParentCategory
    let medicalFieldID, name: Description
    let manufacturer: HighlightResultManufacturer
    let id, highlightResultDescription: Description

    enum CodingKeys: String, CodingKey {
        case subcategory
        case marketplaceID = "marketplace_id"
        case vendorInventory = "vendor_inventory"
        case parentCategory = "parent_category"
        case medicalFieldID = "medical_field_id"
        case name, manufacturer, id
        case highlightResultDescription = "description"
    }
}

// MARK: - Description
struct Description: Codable {
    let matchLevel: MatchLevel
    let value: String
    let matchedWords: [JSONAny]
}

enum MatchLevel: String, Codable {
    case none = "none"
}

// MARK: - HighlightResultManufacturer
struct HighlightResultManufacturer: Codable {
    let sku, id, name: Description
}

// MARK: - HighlightResultParentCategory
struct HighlightResultParentCategory: Codable {
    let id, name: Description
}

// MARK: - HighlightResultVendorInventory
struct HighlightResultVendorInventory: Codable {
    let vendorInventoryID, price, vendorSku: Description

    enum CodingKeys: String, CodingKey {
        case vendorInventoryID = "vendor_inventory_id"
        case price
        case vendorSku = "vendor_sku"
    }
}

// MARK: - Image
struct Image: Codable {
    let image240_Wide: JSONNull?
    let image: String?
    let image240_Box: JSONNull?
    let mainImageBool: Bool

    enum CodingKeys: String, CodingKey {
        case image240_Wide = "image_240_wide"
        case image
        case image240_Box = "image_240_box"
        case mainImageBool = "main_image_bool"
    }
}

// MARK: - HitManufacturer
struct HitManufacturer: Codable {
    let sku, id, name: String
}

enum MarketplaceID: String, Codable {
    case mrktV3C5H7HDE5S8Z3XwRMQumc = "mrkt_v3c5H7HDE5S8Z3XwRMQumc"
}

enum MedicalFieldID: String, Codable {
    case dentistry = "dentistry"
}

// MARK: - HitParentCategory
struct HitParentCategory: Codable {
    let id, name: String
}

// MARK: - VendorInventoryElement
struct VendorInventoryElement: Codable {
    let promotions: [Promotion]?
    let vendorInventoryID: String
    let listPrice: Double
    let marketplaceID: MarketplaceID
    let price: Double
    let specialFee: SpecialFee
    let specialFeeAmount: JSONNull?
    let vendorSku: String
    let hasPromotions: Bool
    let vendor: Vendor
    let isPublished: Bool

    enum CodingKeys: String, CodingKey {
        case promotions
        case vendorInventoryID = "vendor_inventory_id"
        case listPrice = "list_price"
        case marketplaceID = "marketplace_id"
        case price
        case specialFee = "special_fee"
        case specialFeeAmount = "special_fee_amount"
        case vendorSku = "vendor_sku"
        case hasPromotions = "has_promotions"
        case vendor
        case isPublished = "is_published"
    }
}

// MARK: - Promotion
struct Promotion: Codable {
    let promotionProperties: PromotionProperties
    let effectivePrice: Double
    let endDate, promotionNotes, id, promotionType: String
    let startDate: String

    enum CodingKeys: String, CodingKey {
        case promotionProperties = "promotion_properties"
        case effectivePrice = "effective_price"
        case endDate = "end_date"
        case promotionNotes = "promotion_notes"
        case id
        case promotionType = "promotion_type"
        case startDate = "start_date"
    }
}

// MARK: - PromotionProperties
struct PromotionProperties: Codable {
    let buy, promotionPropertiesGet: Int

    enum CodingKeys: String, CodingKey {
        case buy
        case promotionPropertiesGet = "get"
    }
}

enum SpecialFee: String, Codable {
    case regular = "regular"
}

// MARK: - Vendor
struct Vendor: Codable {
    let image: String
    let isActive: Bool
    let id: ID
    let name: Name

    enum CodingKeys: String, CodingKey {
        case image
        case isActive = "is_active"
        case id, name
    }
}

enum ID: String, Codable {
    case f64YHcyZBy9RW9Lop4US8V = "F64YHcyZBy9rW9Lop4uS8V"
    case pnkhjL39ZySB5ELgtK2W9R = "PnkhjL39ZySB5ELgtK2W9R"
}

enum Name: String, Codable {
    case hansAmedLimited = "HANSAmed Limited"
    case pattersonDental = "Patterson Dental"
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}
