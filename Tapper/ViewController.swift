//
//  ViewController.swift
//  Tapper
//
//  Created by Josh Gebara on 12/2/15.
//  Copyright © 2015 Josh Gebara. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Properties
    var maxTaps = 0
    var currentTaps = 0
    
    // Outlets
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var howManyTapsText: UITextField!
    @IBOutlet weak var playButton: UIButton!
    
    @IBOutlet weak var tapButton: UIButton!
    @IBOutlet weak var tapsLabel: UILabel!
    
    @IBAction func onPlayButtonPressed(sender: UIButton) {
        if Int(howManyTapsText.text!) != nil {
                logoImage.hidden = true
                playButton.hidden = true
                howManyTapsText.hidden = true
                
                tapButton.hidden = false
                tapsLabel.hidden = false
                
                maxTaps = Int(howManyTapsText.text!)!
                currentTaps = 0
                
                updateTapsLabel()
        }
    }
    
    @IBAction func onCoinTapped(sender: UIButton) {
        currentTaps++
        updateTapsLabel()
        
        if isGameOver() {
            restartGame()
        }
    }
    
    func restartGame() {
        maxTaps = 0
        howManyTapsText.text = ""
        
        logoImage.hidden = false
        playButton.hidden = false
        howManyTapsText.hidden = false
        
        tapsLabel.hidden = true
        tapButton.hidden = true
    }
    
    func isGameOver() -> Bool {
        if currentTaps >= maxTaps {
            return true
        } else {
            return false
        }
    }
    
    func updateTapsLabel() {
        tapsLabel.text = "\(currentTaps) Taps"
    }
}

