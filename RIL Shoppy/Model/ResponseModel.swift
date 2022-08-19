//
//  ResponseModel.swift
//  RIL Shoppy
//
//  Created by Srikanth Gimka on 17/08/22.
//

import Foundation

public struct ResponseModel : Codable, Identifiable {
    public var id = UUID()
    public var total = 0
    public var query = ""
    public var url = ""
    public var result : [ProductDetailModel] = []

    enum CodingKeys: String, CodingKey {

        case total = "total_result"
        case query = "query"
        case url = "fetch_from"
        case result = "result"
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        total = try values.decodeIfPresent(Int.self, forKey: .total) ?? 0
        query = try values.decodeIfPresent(String.self, forKey: .query) ?? ""
        url = try values.decodeIfPresent(String.self, forKey: .url) ?? ""
        result = try values.decodeIfPresent([ProductDetailModel].self, forKey: .result) ?? []

    }
    public init() {
         
    }

 }
