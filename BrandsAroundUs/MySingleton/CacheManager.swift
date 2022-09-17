//
//  CacheManager.swift
//  BrandsAroundUs
//
//  Created by Bhavin  Nagaria on 9/6/20.
//  Copyright © 2020 21 Event and Tech. All rights reserved.
//

import UIKit

class CacheManager: NSObject {
    private let cache = NSCache<NSString, UIImage>()
    private var observer: NSObjectProtocol!
    
    static let shared = CacheManager()
    
    private override init() {
        // make sure to purge cache on memory pressure
        super.init()
        observer = NotificationCenter.default.addObserver(forName: UIApplication.didReceiveMemoryWarningNotification, object: nil, queue: nil) { [weak self] notification in
            self?.cache.removeAllObjects()
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(observer)
    }
    
    func image(forKey key: String) -> UIImage? {
        return cache.object(forKey: key as NSString)
    }
    
    func save(image: UIImage, forKey key: String) {
        cache.setObject(image, forKey: key as NSString)
    }
}
