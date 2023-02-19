//
//  FileManagerService.swift
//  FromNothing
//
//  Created by Remmington Damper on 2/18/23.
//

import Foundation

protocol FileManagerService {
    func createDirectory(withFileName: String, resourceType: String) -> URL
    func retrieveVideoFromAssetsFolder()
    func retrieveFiles() -> [URL]
    func returnTempDirectory() -> URL
    var error: Error? { get set }
}
class FileManagerServiceImplementation: FileManagerService {
    
    var error: Error?
    
    func createDirectory(withFileName: String, resourceType: String) -> URL {
        let manager = FileManager.default
        let tmpURL = manager.temporaryDirectory
        let path = tmpURL.appending(path: "\(withFileName).\(resourceType)")
        return path
    }
    func returnTempDirectory() -> URL {
        return NSURL(fileURLWithPath: NSTemporaryDirectory(), isDirectory: true) as URL
    }
    func retrieveFiles() -> [URL] {
        var urlArray: [URL] = []
        let path = returnTempDirectory()
        guard FileManager.default.fileExists(atPath: path.relativePath) else {
            print("Error retrieiving files for path assets")
            return []
        }
        guard let paths = FileManager.default.subpaths(atPath: path.relativePath) else {
            print("could not find files")
            return []
        }
            for subpath in paths {
                guard let url = URL(string: subpath) else {
                    print("not a path")
                    continue
                }
                guard url.isFileURL else {
                    print("didn't find file continuing")
                    continue
                }
                urlArray.append(url.standardizedFileURL)
                return urlArray
            }
        
        return []
    }
    func retrieveVideoFromAssetsFolder() {
        fatalError("not Implemented")
    }
}
