//
//  ViewController.swift
//  photoMemories
//
//  Created by Lei Zhao on 11/2/18.
//  Copyright © 2018 Lei Zhao. All rights reserved.
//

import Cocoa

let photoCellIdentifier = NSUserInterfaceItemIdentifier("PhotoCell")

class ViewController: NSViewController {

    @IBOutlet weak var collectionView: NSCollectionView!
    
    var photos: [URL] = []
    
    lazy var photosDir: URL = {
        let fm = FileManager.default
        let documentDir = fm.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let saveDir = documentDir.appendingPathComponent("SlideMark")

        if !fm.fileExists(atPath: saveDir.path) {
            try? fm.createDirectory(at: saveDir, withIntermediateDirectories: true, attributes: nil)
        }

        return documentDir.appendingPathComponent("SlideMark")
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(PhotoCell.self, forItemWithIdentifier: photoCellIdentifier)
        
        do {
            let fm = FileManager.default
            let files = try fm.contentsOfDirectory(at: self.photosDir, includingPropertiesForKeys: nil)
            for file in files {
                if file.pathExtension == "jpg" || file.pathExtension == "png" {
                    self.photos.append(file)
                }
            }
        } catch {
            print("Set up error")
        }
    }
    
}

extension ViewController: NSCollectionViewDelegate, NSCollectionViewDataSource {
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.photos.count
    }
    
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        let item = collectionView.makeItem(withIdentifier: photoCellIdentifier, for: indexPath)
        
        guard let collectionViewItem = item as? PhotoCell else { return item }
        
        collectionViewItem.imageView?.image = NSImage(contentsOf: self.photos[indexPath.item])
        
        return collectionViewItem
    }
}

