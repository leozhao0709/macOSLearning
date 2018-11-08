//
//  ViewController.swift
//  URLSession
//
//  Created by Lei Zhao on 11/6/18.
//  Copyright © 2018 Lei Zhao. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, URLSessionDownloadDelegate {
    
    lazy var fileData: Data = {
        return Data()
    }()
    
    private var session: URLSession?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func clickMe(_ sender: NSButton) {
//        self.download()
        
        self.delegateDownload()
    }
    
    private func delegateDownload() {
        let session = URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: OperationQueue.main)
        let url = URL(string: "https://d3cbihxaqsuq0s.cloudfront.net/images/53402047_xl.jpg")!
        let dataTask = session.downloadTask(with: url)
        dataTask.resume()
        self.session = session
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        print("\(CGFloat(totalBytesWritten)/CGFloat(totalBytesExpectedToWrite))")
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didResumeAtOffset fileOffset: Int64, expectedTotalBytes: Int64) {
        print(#function)
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        print(#function)
        
        print("\(location)-----")
        
        let downloadDir = FileManager.default.urls(for: .downloadsDirectory, in: .userDomainMask)[0]
        let storeUrl = downloadDir.appendingPathComponent((downloadTask.response?.suggestedFilename)!)
        
        do {
            try FileManager.default.moveItem(at: location, to: storeUrl)
        }
        catch {
            print("move error")
        }
        
        print(storeUrl)
    }
    
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        print(#function)
    }
    
    deinit {
        URLSession.shared.finishTasksAndInvalidate()
        self.session?.finishTasksAndInvalidate()
    }
    
    
    private func download() {
        let session = URLSession.shared
        let url = URL(string: "https://d3cbihxaqsuq0s.cloudfront.net/images/53402047_xl.jpg")!
        let downloadTask = session.downloadTask(with: url) { (location: URL?, response: URLResponse?, error: Error?) in
            print("\(location!)-----")
            
            let downloadDir = FileManager.default.urls(for: .downloadsDirectory, in: .userDomainMask)[0]
            let storeUrl = downloadDir.appendingPathComponent((response?.suggestedFilename)!)
            
            do {
                try FileManager.default.moveItem(at: location!, to: storeUrl)
            }
            catch {
                print("move error")
            }
            
            print(storeUrl)
        }
        downloadTask.resume()
    }

}

