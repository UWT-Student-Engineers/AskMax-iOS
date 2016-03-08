//
//  Location.swift
//  AskMax-iOS
//
//  Created by Vitaliy Radchishin on 3/3/16.
//  Copyright © 2016 UWT Student Engineers. All rights reserved.
//

import Foundation
import Gloss

struct Location: Decodable, Encodable {
    var building: String?
    var room: String?
    var tags: [String]?
    var coordinates: [Coordinate]?
    
    init?(json: JSON) {
        self.building = "building" <~~ json
        self.room = "room" <~~ json
        self.tags = "tags" <~~ json
        self.coordinates = "coordinates" <~~ json
    }
    
    func toJSON() -> JSON? {
        return jsonify([
            "building" ~~> self.building,
            "room" ~~> self.room,
            "tags" ~~> self.tags,
            "coordinates" ~~> self.coordinates
        ])
    }
}