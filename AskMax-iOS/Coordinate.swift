//
//  Coordinate.swift
//  AskMax-iOS
//
//  Created by Vitaliy Radchishin on 3/3/16.
//  Copyright © 2016 UWT Student Engineers. All rights reserved.
//

import Foundation
import Gloss

struct Coordinate: Decodable, Encodable {
    var lat: Double?
    var lng: Double?
    
    init?(json: JSON) {
        self.lat = "lat" <~~ json
        self.lng = "lng" <~~ json
    }
    
    func toJSON() -> JSON? {
        return jsonify([
            "lat" ~~> self.lat,
            "lng" ~~> self.lng
        ])
    }
}