//
//  ApiHelpers.swift
//  SafeGuide
//
//  Created by Sesh Sadasivam on 11/10/18.
//  Copyright © 2018 SAFEGUIDE. All rights reserved.
//

import Foundation
import MapKit
import GoogleMaps

internal class ApiHelpers {
    
//    static private var safetyScoreCache: [String: Double] = [:]
    
    static func getToken(callback: @escaping () -> Void) {
        let url = apiUrls["token"]!
        
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "POST"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                // Fundamental networking error
                print("API getToken error=\(String(describing: error))")
                return
            }
            
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode > 299 {
                // Http errors
                print("API getToken statusCode should be 200, but is \(httpStatus.statusCode)")
                print("response = \(String(describing: response))")
            }
            
            guard let token_data = try? JSONDecoder().decode(ApiObtainTokenResult.self, from: data) else {
                print("Could not parse token data: ", data)
                return
            }
            // Persist the token
            UserDefaults.standard.set(token_data.token, forKey: "sg_api_token")
            UserDefaults.standard.set(token_data.user, forKey: "sg_api_user")
            print("API Token: ", token_data.token)
            
            callback()
        }
        
        // Put the task on the queue
        task.resume()
    }
    
    static func getSafetyScore(callback: @escaping (Double)->Void) {
        let api_token = UserDefaults.standard.object(forKey: "sg_api_token")!
        
        if Globals.sharedLocationManager.lastKnownLocation == nil {
            print("In getSafetyScore, expected last known location to not be nil...")
            return
        }
        
        let lat = String(Globals.sharedLocationManager.lastKnownLocation?.coordinate.latitude ?? 0)
        let lon = String(Globals.sharedLocationManager.lastKnownLocation?.coordinate.longitude ?? 0)
//        if safetyScoreCache["\(lat),\(lon)"] != nil {
//            callback(safetyScoreCache["\(lat),\(lon)"]!)
//        }
        
        var url_components = URLComponents(string: apiUrls["safety_score"]!)
        url_components!.queryItems = [
            URLQueryItem(name: "lat", value: lat),
            URLQueryItem(name: "lon", value: lon),
        ]
        
        var request = URLRequest(url: (url_components?.url)!)
        request.httpMethod = "GET"
        request.setValue("Token \(api_token)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                // Fundamental networking error
                print("API getSafetyScore error=\(String(describing: error))")
                return
            }

            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
                // Http errors
                print("API getSafetyScore statusCode should be 200, but is \(httpStatus.statusCode)")
                print("response = \(String(describing: response))")
                callback(-1)
                return
            }

            guard let score_data = try? JSONDecoder().decode(ApiSafetyScoreResult.self, from: data) else {
                print("Could not parse token data: ", data)
                return
            }
            
//            safetyScoreCache["\(lat),\(lon)"] = score_data.score
            
            // Safety Category is either 1, 2, or 3.
            // 1 is most safe, 3 is least safe.
            // Since the front-end assumes safety score in a range from 1-5, we'll scale this number
            // TODO: Need to change this back to 1-3 scale
            let frontend_safety_score = (Double(score_data.category) / 3.0) * 5
            
            // Call the callback
            callback(frontend_safety_score)
        }
        
        // Put the task on the queue
        task.resume()
    }
    
    static func getCrimeCategories(callback: @escaping ([ApiCrimeCategoryResult]?)->(Void)){
        //Command to run:
        //http --json --follow get https://safeguide.jae.works/api/geo/events "Authorization: Token 6728534d0eef25f39d84e8e48b58fa0bd10f8546"

        let api_token = UserDefaults.standard.object(forKey: "sg_api_token")!
        
        let url_components = URLComponents(string: apiUrls["crime_events"]!)
        var request = URLRequest(url: (url_components?.url)!)
        print("URL")
        print(url_components?.url ?? "Null")
        request.httpMethod = "GET"
        request.setValue("Token \(api_token)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                // Fundamental networking error
                print("API getCrimeCategories error=\(String(describing: error))")
                return
            }
            
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode > 299 {
                // Http errors
                print("API getCrimeCategories statusCode should be 200, but is \(httpStatus.statusCode)")
                print("response = \(String(describing: response))")
                callback(nil)
                return
            }
            
            guard let crime_events = try? JSONDecoder().decode([ApiCrimeCategoryResult].self, from: data) else {
                print("Could not parse token data: ", data)
                return
            }   
            callback(crime_events)
        }
        task.resume()
    }
    
    static func getGeoNodes(coords: CLLocationCoordinate2D?, dist: Float?, event: Int?, callback: @escaping (([ApiGeoNodeResult]?) -> Void)){
        let api_token = UserDefaults.standard.object(forKey: "sg_api_token")!
        
        var lat: String
        var lon: String
        if (coords == nil) {
            if Globals.sharedLocationManager.lastKnownLocation == nil {
                print("In getGeoNodes, expected last known location to not be nil...")
                return
            }
            
            lat = String(Globals.sharedLocationManager.lastKnownLocation?.coordinate.latitude ?? 0)
            lon = String(Globals.sharedLocationManager.lastKnownLocation?.coordinate.longitude ?? 0)
        }
        else {
            lat = String(coords!.latitude)
            lon = String(coords!.longitude)
        }
        
        var url_components = URLComponents(string: apiUrls["crime_geonodes"]!)
        var QueryItemsList = [
            URLQueryItem(name: "lat", value: lat),
            URLQueryItem(name: "lon", value: lon),
        ]
        if let d = dist {
            QueryItemsList.append(URLQueryItem(name: "dst", value: String(d)))
        }
        if let e = event {
            QueryItemsList.append(URLQueryItem(name: "event", value: String(e)))
        }
        url_components!.queryItems = QueryItemsList
        
        var request = URLRequest(url: (url_components?.url)!)
        print("URL")
        print(url_components?.url ?? "Null")
        request.httpMethod = "GET"
        request.setValue("Token \(api_token)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                // Fundamental networking error
                print("API getGeoNodes error=\(String(describing: error))")
                return
            }
            
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode > 299 {
                // Http error
                print("API getGeoNodes statusCode should be 200, but is \(httpStatus.statusCode)")
                print("response = \(String(describing: response))")
                callback(nil)
                return
            }
            
            
            let string_data = String(data: data, encoding: String.Encoding.utf8) ?? ""
            let utf8_data = string_data.data(using: .utf8) ?? data
            
            do {
                print("TRYING", string_data)
                let monkey = try JSONDecoder().decode([ApiGeoNodeResult].self, from: utf8_data)
                print(monkey)
            } catch {
                print("JSON ERROR")
                print(error)
            }
            
            guard let geonodes = try? JSONDecoder().decode([ApiGeoNodeResult].self, from: utf8_data) else {
                print("Could not parse token data: ", data)
                return
            }
            callback(geonodes)
        }
        task.resume()
    }
    
    static func getSafeLocations(coords: CLLocationCoordinate2D?, callback: @escaping ((ApiSafeLocations?) -> Void)){
        let api_token = UserDefaults.standard.object(forKey: "sg_api_token")!
        
        var lat: String
        var lon: String
        if (coords == nil) {
            if Globals.sharedLocationManager.lastKnownLocation == nil {
                print("In getGeoNodes, expected last known location to not be nil...")
                return
            }
            
            lat = String(Globals.sharedLocationManager.lastKnownLocation?.coordinate.latitude ?? 0)
            lon = String(Globals.sharedLocationManager.lastKnownLocation?.coordinate.longitude ?? 0)
        }
        else {
            lat = String(coords!.latitude)
            lon = String(coords!.longitude)
        }
        
        var url_components = URLComponents(string: apiUrls["safe_locations"]!)
        let QueryItemsList = [
            URLQueryItem(name: "lat", value: lat),
            URLQueryItem(name: "lon", value: lon),
        ]
        url_components?.queryItems = QueryItemsList
        
        var request = URLRequest(url: (url_components?.url)!)
        request.httpMethod = "GET"
        request.setValue("Token \(api_token)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                // Fundamental networking error
                print("API getSafeLocations error=\(String(describing: error))")
                return
            }
            
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode > 299 {
                // Http errors
                print("API getSafeLocations statusCode should be within the 200s, but is \(httpStatus.statusCode)")
                print("response = \(String(describing: response))")
                callback(nil)
                return
            }
            
            guard let safe_locations = try? JSONDecoder().decode(ApiSafeLocations.self, from: data) else {
                print("Could not parse token data: ", data)
                return
            }
            callback(safe_locations)
        }
        task.resume()
    }
    
    
    static func getDirectionsToLocation(marker: GMSMarker, callback: @escaping ((GMSMarker, ApiGMRouteResult) -> Void)) {
        if Globals.sharedLocationManager.lastKnownLocation == nil {
            print("In getDirectionsToLocation, expected last known location to not be nil...")
            return
        }
        
        let lat1 = String(Globals.sharedLocationManager.lastKnownLocation?.coordinate.latitude ?? 0)
        let lon1 = String(Globals.sharedLocationManager.lastKnownLocation?.coordinate.longitude ?? 0)
        let lat2 = String(marker.position.latitude)
        let lon2 = String(marker.position.longitude)
        
        var url_components = URLComponents(string: apiUrls["google_directions"]!)
        let QueryItemsList = [
            URLQueryItem(name: "origin", value: "\(lat1),\(lon1)"),
            URLQueryItem(name: "destination", value: "\(lat2),\(lon2)"),
            URLQueryItem(name: "key", value: Globals.googleApiKey),
            URLQueryItem(name: "mode", value: "walking"),
        ]
        url_components?.queryItems = QueryItemsList
        
        var request = URLRequest(url: (url_components?.url)!)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                // Fundamental networking error
                print("API getDirectionsToLocation error=\(String(describing: error))")
                return
            }
            
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode > 299 {
                // Http errors
                print("API getSafeLocations statusCode should be within the 200s, but is \(httpStatus.statusCode)")
                print("response = \(String(describing: response))")
                return
            }
            
            if let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                if let result = ApiGMRouteResult(json: json ?? [:]) {
                    callback(marker, result)
                }
            }
        }
        task.resume()
    }
    
    private static var apiUrls:[String: String] = [
        "token": "https://safeguide.jae.works/api/auth/device",
        "crime_events": "https://safeguide.jae.works/api/geo/events/",
        "crime_geonodes": "https://safeguide.jae.works/api/geo/geonodes/",
        "safety_score": "https://safeguide.jae.works/api/geo/geonodes/score/",
        "safe_locations": "https://safeguide.jae.works/api/geo/geonodes/safe/",
        "google_directions": "https://maps.googleapis.com/maps/api/directions/json",
    ] 
}
