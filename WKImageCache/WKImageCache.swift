//
// WKImageCache.swift
//
// Copyright (c) 2015 Mathias Koehnke (http://www.mathiaskoehnke.com)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import WatchKit
import Foundation
import Darwin

/**
Supported Cache Types

- FIFO: First In First Out
- LRU:  Least Recently Used
*/
public enum CacheType {
    case FIFO
    case LRU
}

/**
*  WKInterfaceImage extension
*/
public extension WKInterfaceImage {
    /**
    Sets the displayed image using the specified image object and adds it to 
    the cache (if it not already exists).
    
    :param: image       The image to be displayed and added to the cache.
    :param: compression The compression that is applied to the image before transmitting it to the  watch.
                        If not specified, the default (60%) will be used.
    :param: cacheType   The cache strategy that will be used to free space if the cache is full.
                        If not specified, the default (FIFO) will be used.
    
    :returns: The key name under which the image is stored in the cache.
    */
    public func setCachedImage(image : UIImage, compression : CGFloat = DefaultCompression, cacheType : CacheType = DefaultCacheType) -> String {
        return setCachedImageData(UIImageJPEGRepresentation(image, compression), cacheType: cacheType)
    }
    /**
    Sets the displayed image using a formatted data object and adds it to
    the cache (if it not already exists).
    
    :param: image       A data object containing the image data in its native format. 
                        The data can be raw image data or an archived UIImage object.
    :param: compression The compression that is applied to the image before transmitting it to the  watch.
                        If not specified, the default (60%) will be used.
    :param: cacheType   The cache strategy that will be used to free space if the cache is full.
                        If not specified, the default (FIFO) will be used.
    
    :returns: The key name under which the image is stored in the cache.
    */
    public func setCachedImageData(imageData : NSData, cacheType : CacheType = DefaultCacheType) -> String {
        return ImageCache.setCachedImageData(imageData, cacheType: cacheType, cachedBlock: { [weak self] key in
            self?.setImageNamed(key)
        })
    }
    /**
    Returns a dictionary of cached image identifiers and corresponding images.
    
    :returns: A dictionary
    */
    public class func cachedImages() -> [NSObject : AnyObject] {
        return WKInterfaceDevice.currentDevice().cachedImages
    }
}

/**
*  WKInterfaceButton extension
*/
public extension WKInterfaceButton {
    /**
    Changes the button’s background image to the specified image and adds it to
    the cache (if it not already exists).
    
    :param: image       The image to be displayed and added to the cache.
    :param: compression The compression that is applied to the image before transmitting it to the  watch.
                        If not specified, the default (60%) will be used.
    :param: cacheType   The cache strategy that will be used to free space if the cache is full.
                        If not specified, the default (FIFO) will be used.
    
    :returns: The key name under which the image is stored in the cache.
    */
    public func setCachedBackgroundImage(image : UIImage, compression : CGFloat = DefaultCompression, cacheType : CacheType = DefaultCacheType) -> String {
        return setCachedBackgroundImageData(UIImageJPEGRepresentation(image, compression), cacheType: cacheType)
    }
    /**
    Changes the button’s background image to the image in the specified data object and adds it to
    the cache (if it not already exists).
    
    :param: image       A data object containing the image data in its native format.
                        The data can be raw image data or an archived UIImage object.
    :param: compression The compression that is applied to the image before transmitting it to the  watch.
                        If not specified, the default (60%) will be used.
    :param: cacheType   The cache strategy that will be used to free space if the cache is full.
                        If not specified, the default (FIFO) will be used.
    
    :returns: The key name under which the image is stored in the cache.
    */
    public func setCachedBackgroundImageData(imageData : NSData, cacheType : CacheType = DefaultCacheType) -> String {
        return ImageCache.setCachedImageData(imageData, cacheType: cacheType, cachedBlock: { [weak self] key in
            self?.setBackgroundImageNamed(key)
        })
    }
    /**
    Returns a dictionary of cached image identifiers and corresponding images.
    
    :returns: A dictionary
    */
    public class func cachedImages() -> [NSObject : AnyObject] {
        return WKInterfaceDevice.currentDevice().cachedImages
    }
}

/**
*  WKInterfaceGroup extension
*/
public extension WKInterfaceGroup {
    /**
    Changes the background image of the group container to the specified image and adds it to
    the cache (if it not already exists).
    
    :param: image       The image to be displayed and added to the cache.
    :param: compression The compression that is applied to the image before transmitting it to the  watch.
                        If not specified, the default (60%) will be used.
    :param: cacheType   The cache strategy that will be used to free space if the cache is full.
                        If not specified, the default (FIFO) will be used.
    
    :returns: The key name under which the image is stored in the cache.
    */
    public func setCachedBackgroundImage(image : UIImage, compression : CGFloat = DefaultCompression, cacheType : CacheType = DefaultCacheType) -> String {
        return setCachedBackgroundImageData(UIImageJPEGRepresentation(image, compression), cacheType: cacheType)
    }
    /**
    Changes the background image of the group container to the image in the specified data object and adds it to
    the cache (if it not already exists).
    
    :param: image       A data object containing the image data in its native format.
                        The data can be raw image data or an archived UIImage object.
    :param: compression The compression that is applied to the image before transmitting it to the  watch.
                        If not specified, the default (60%) will be used.
    :param: cacheType   The cache strategy that will be used to free space if the cache is full.
                        If not specified, the default (FIFO) will be used.
    
    :returns: The key name under which the image is stored in the cache.
    */
    public func setCachedBackgroundImageData(imageData : NSData, cacheType : CacheType = DefaultCacheType) -> String {
        return ImageCache.setCachedImageData(imageData, cacheType: cacheType, cachedBlock: { [weak self] key in
            self?.setBackgroundImageNamed(key)
        })
    }
    /**
    Returns a dictionary of cached image identifiers and corresponding images.
    
    :returns: A dictionary
    */
    public class func cachedImages() -> [NSObject : AnyObject] {
        return WKInterfaceDevice.currentDevice().cachedImages
    }
}


// MARK: Private

private let DefaultCacheType : CacheType = .FIFO
private let DefaultCompression : CGFloat = 0.6

private class ImageCache {
    
    private class func setCachedImageData(imageData : NSData, cacheType : CacheType, cachedBlock: (key : String) -> Void) -> String {
        ImageCache.cacheType = cacheType
        
        let imageKey = imageData.MD5() as String
        if (ImageCache.imageExists(imageKey)) {
            cachedBlock(key : imageKey)
            if (ImageCache.cacheType == .LRU) {
                ImageCache.addTimeStamp(NSDate().timeIntervalSinceReferenceDate, key: imageKey)
            }
        } else {
            ImageCache.addCachedImageWithData(imageData, key: imageKey)
            cachedBlock(key : imageKey)
        }
        return imageKey
    }
    
    private class func imageExists(name : String) -> Bool {
        var exists: Bool = false
        dispatch_sync(lockQueue) {
            exists = WKInterfaceDevice.currentDevice().cachedImages[name] != nil
        }
        return exists
    }

    private class func addTimeStamp(timestamp : NSTimeInterval, key : String) {
        getTimeStamps().setObject(timestamp, forKey: key)
        NSUserDefaults.standardUserDefaults().setObject(getTimeStamps(), forKey: cacheKey)
    }
    
    private class func removeTimeStamp(key : String) {
        getTimeStamps().removeObjectForKey(key)
        NSUserDefaults.standardUserDefaults().setObject(getTimeStamps(), forKey: cacheKey)
    }

    private class func addCachedImageWithData(data : NSData, key : String) {
        dispatch_sync(lockQueue) {
            var success = false
            do {
                let debugCacheSize = NSProcessInfo.processInfo().environment["DEBUG_CACHE_SIZE"] as? String
                let cachedImages = WKInterfaceDevice.currentDevice().cachedImages
                if let _debugCacheSize = debugCacheSize where cachedImages.count >= _debugCacheSize.toInt() {
                    self.DLog("Hit debug size")
                    success = false
                } else {
                    self.DLog("Adding \(key) to cache")
                    success = WKInterfaceDevice.currentDevice().addCachedImageWithData(data, name: key)
                }
                
                if (success == false) {
                    self.removeImageWithCacheStrategy(self.cacheType)
                    
                    // There seems to be a race condition in the WatchKit cache during bulk adding/removing images
                    // especially with the same name. Therefore this delay as a workaround.
                    usleep(400000)
                }
            } while (success == false)
            self.addTimeStamp(NSDate().timeIntervalSinceReferenceDate, key: key)
        }
    }
    
    private class func removeCachedImage(key : String) {
        removeTimeStamp(key)
        WKInterfaceDevice.currentDevice().removeCachedImageWithName(key)
    }
    
    private class func removeImageWithCacheStrategy(cacheType : CacheType) {
        if contains([.FIFO, .LRU], cacheType) {
            var imageName : String?
            var imageTimeStamp : NSTimeInterval = 0.0
            for (key, timestamp) in getTimeStamps() {
                if (imageTimeStamp == 0.0 || imageTimeStamp > timestamp.doubleValue) {
                    imageName = key as? String
                    imageTimeStamp = timestamp.doubleValue
                }
            }
            if let _imageName = imageName {
                DLog("Removing cached image with key \(_imageName)")
                removeCachedImage(_imageName)
            } else {
                DLog("No image found to remove. Clearing cache to avoid inconsistency ...");
                getTimeStamps().removeAllObjects()
                NSUserDefaults.standardUserDefaults().setObject(getTimeStamps(), forKey: cacheKey)
                WKInterfaceDevice.currentDevice().removeAllCachedImages()
            }
        }
    }
    
    private static var cacheType : CacheType = DefaultCacheType
    private static let cacheKey = "com.mathiaskoehnke.wkimagecache"
    private static let lockQueue = dispatch_queue_create(cacheKey, nil)
    private static var timeStamps : NSMutableDictionary?
    
    private class func getTimeStamps() -> NSMutableDictionary {
        if let _timeStamps = timeStamps {
            return _timeStamps
        }
        
        var defaults = NSUserDefaults.standardUserDefaults()
        timeStamps = defaults.objectForKey(cacheKey) as? NSMutableDictionary
        if let _timeStamps = timeStamps {
            return _timeStamps
        }
        
        timeStamps = NSMutableDictionary()
        return timeStamps!
    }
    
    private class func DLog(message: String, function: String = __FUNCTION__) {
        #if DEBUG
            println("\(function): \(message)")
        #endif
    }
}

private extension NSData {
    func MD5() -> NSString {
        let digestLength = Int(CC_MD5_DIGEST_LENGTH)
        let md5Buffer = UnsafeMutablePointer<CUnsignedChar>.alloc(digestLength)
        
        CC_MD5(bytes, CC_LONG(length), md5Buffer)
        var output = NSMutableString(capacity: Int(CC_MD5_DIGEST_LENGTH * 2))
        for i in 0..<digestLength {
            output.appendFormat("%02x", md5Buffer[i])
        }
        
        return NSString(format: output)
    }
}