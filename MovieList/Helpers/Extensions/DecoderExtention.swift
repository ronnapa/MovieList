//
//  DecoderExtention.swift
//  MovieList
//
//  Created by Ronald Napa on 6/5/22.
//

import Foundation

extension KeyedDecodingContainer {
    func decodeWrapper<T>(key: K, defaultValue: T) throws -> T
        where T : Decodable {
        return try decodeIfPresent(T.self, forKey: key) ?? defaultValue
    }
}
