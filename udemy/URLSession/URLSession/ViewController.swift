//
//  ViewController.swift
//  URLSession
//
//  Created by Lei Zhao on 11/6/18.
//  Copyright © 2018 Lei Zhao. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    @IBAction func clickMe(_ sender: NSButton) {
//        self.get()
//        self.objToJSON()
        self.post()
    }
    
    private func objToJSON() {
        let post = Post(user_id: 12, id: 10, title: "haha", body:"I'm body")
        let json = try! JSONEncoder().encode(post)
        print(String(data: json, encoding: String.Encoding.utf8)!)
    }
    
    private func get() {
        let session = URLSession.shared
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/5") else { return }
        let dataTask = session.dataTask(with: url) { (data: Data?, response: URLResponse?, err: Error?) in
            if err == nil {
                let post = try! JSONDecoder().decode(Post.self, from: data!)
                print(post)
            }
        }
        dataTask.resume()
    }
    
    private func post() {
        let session = URLSession.shared
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.allHTTPHeaderFields = ["Content-Type": "application/json"]
        let post = Post(user_id: 12, id: nil, title: "haha", body:"I'm body")
        urlRequest.httpBody = try? JSONEncoder().encode(post)
        let dataTask = session.dataTask(with: urlRequest) { (data: Data?, response: URLResponse?, error: Error?) in
            let post = try? JSONDecoder().decode(Post.self, from: data!)
            print(post!)
        }
        
        dataTask.resume()
    }
    


}

