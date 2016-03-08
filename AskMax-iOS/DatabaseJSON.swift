//
//  DatabaseJSON.swift
//  AskMax-iOS
//
//  Created by Vitaliy Radchishin on 3/3/16.
//  Copyright © 2016 UWT Student Engineers. All rights reserved.
//

import Gloss

class DatabaseJSON {
    let rootDir = (NSBundle.mainBundle().resourcePath)! + "/common/jsondb"
    
    var buildings = [String]()
    var rooms = [String]()
    var map = [String: [Location]]()
    
    init() {
        setup()
    }
    
    func setup() {
        let fileMgr = NSFileManager.defaultManager()
        
        // Create a list of buildings based on the names of folders in the root directory.
        if let list = try? fileMgr.contentsOfDirectoryAtPath(rootDir) {
            buildings = list
        }
        
        // Create a map of locations that can be lookup by tags.
        for building in buildings {
            let location = get(building)
            
            for tag in location?.tags ?? [] {
                var list = map[tag] ?? [Location]()
                list.append(location!)
                map[tag] = list
            }
        }
    }
    
    // Returns an array of locations that correspond to the passed query.
    func search(query: String) -> [Location] {
        var results = [Location]()
        
        for part in query.componentsSeparatedByString(" ") {
            for tag in map.keys where tag.hasPrefix(part) {
                if let result = map[tag] {
                    results.appendContentsOf(result)
                }
            }
        }
        
        return results
    }
    
    // Returns a Location of a building if its corresponding json file gets imported successfully.
    func get(building: String, room: String = "index") -> Location? {
        let path = "\(rootDir)/\(building)/\(room).json"
        
        if let data = NSData(contentsOfFile: path), json = (try? NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions())) as? JSON {
            return Location(json: json)
        }
        return nil
    }
}