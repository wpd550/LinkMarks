//
//  Data.swift
//  LinkMarks
//
//  Created by dong wu on 2020/12/2.
//

import Foundation
import SwiftUI
import CoreLocation

let landmarkData: [Landmark] = load("landmarkData.json")

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}



final class ImageStore{
    typealias _ImageDictionary = [String:CGImage]
    
    fileprivate var images:_ImageDictionary = [:]
    
    fileprivate static var scale = 2
    
    static var share:ImageStore = ImageStore()
    
    func image(name:String) -> Image {
        let index = _guranteeImage(name: name)
        return Image(images.values[index],scale: CGFloat(ImageStore.scale),label: Text(name))
    }
    
    
    static func loadImage(name:String)->CGImage{
        guard
            let url = Bundle.main.url(forResource: name, withExtension: "jpg"),
            let imageSource = CGImageSourceCreateWithURL(url as NSURL, nil),
            let image = CGImageSourceCreateImageAtIndex(imageSource, 0, nil)
        else {
            fatalError("Could't load image \(name).jpg from main bound")
        }
        return image
    }
    
    fileprivate func _guranteeImage(name:String)->_ImageDictionary.Index{
        if let index = images.index(forKey: name){
            return index
        }
        images[name] = ImageStore.loadImage(name: name)
        return images.index(forKey: name)!
    }
    
}
