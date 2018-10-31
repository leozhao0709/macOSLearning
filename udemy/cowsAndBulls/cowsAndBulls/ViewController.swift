//
//  ViewController.swift
//  cowsAndBulls
//
//  Created by Lei Zhao on 10/30/18.
//  Copyright © 2018 Lei Zhao. All rights reserved.
//

import Cocoa
import GameKit

class ViewController: NSViewController, NSTableViewDelegate, NSTableViewDataSource {

    @IBOutlet weak var textField: NSTextField!
    @IBOutlet weak var tableView: NSTableView!
    
    var guessArray: [(String, String)] = []
    var guessWord: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.startGame()
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    func startGame() {
        var numbers = Array(0...9)
        numbers = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: numbers) as! [Int]
        self.guessWord = ""

        for i in 0 ..< 4 {
            self.guessWord? += "\(numbers[i])"
        }
        
        self.guessArray.removeAll()
        self.tableView.reloadData()
    }

    @IBAction func guessBtnClick(_ sender: NSButton) {
        let userGuess = self.textField.stringValue
        if userGuess.count != 4 {
            return
        }
        let regex = try! NSRegularExpression(pattern: "\\d{4}")
        let matches = regex.matches(in: userGuess, range: NSRange(userGuess.startIndex..., in: userGuess))
        
        if matches.count == 0 {
            return
        }
        
        var bulls = 0
        var cows = 0
        
        let userGuessArray = Array(userGuess)
        let guessWordArray = Array(self.guessWord!)
        
        for (i, char) in userGuessArray.enumerated() {
            if guessWordArray[i] == char {
                bulls += 1
            } else if guessWordArray.contains(char) {
                cows += 1
            }
        }
        
        let guessResult = "\(bulls)b\(cows)c"
        self.guessArray.insert((userGuess, guessResult), at: 0)
        self.tableView.insertRows(at: IndexSet(integer: 0), withAnimation: NSTableView.AnimationOptions.slideDown)
        
        if bulls == 4 {
            let alert = NSAlert()
            alert.messageText = "You Win!"
            alert.informativeText = "Congratulations! Click OK to play again."
            alert.runModal()
            
            self.textField.stringValue = ""
            startGame()
        }
    }
    
}

// MARK:- TableView datasource and delegate
extension ViewController {
    func numberOfRows(in tableView: NSTableView) -> Int {
        return self.guessArray.count
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        guard let cellView = tableView.makeView(withIdentifier: tableColumn!.identifier, owner: self) as? NSTableCellView else { return nil }
        
        let (userGuess, guessResult) = self.guessArray[row]
        if tableColumn?.title == "Guess" {
            cellView.textField?.stringValue = userGuess
        } else {
            cellView.textField?.stringValue = guessResult
        }
        
        return cellView
    }
}

