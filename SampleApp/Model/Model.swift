

import Foundation

class Datas: Codable{
    var status: Bool?
    var homeData: [HomeDatum]?
}

class HomeDatum: Codable {
    var type: String?
    var values: [Value]?
}

class Value: Codable {
    var id: Int?
    var name: String?
    var imageURL, bannerURL: String?
    var image: String?
    var actualPrice, offerPrice: String?
    var offer: Int?
    var isExpress: Bool?

    enum CodingKeys: String, CodingKey {
        case id, name
        case imageURL = "image_url"
        case bannerURL = "banner_url"
        case image
        case actualPrice = "actual_price"
        case offerPrice = "offer_price"
        case offer
        case isExpress = "is_express"
    }
}
