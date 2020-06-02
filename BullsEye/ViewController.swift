//
//  ViewController.swift
//  BullsEye
//
//  Created by Godwin Addy on 5/18/20.
//  Copyright © 2020 Godwin Addy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    var currentSliderValue = 0
    var targetValue = 0
    var score = 0
    var round = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        initSlider()
        
        startNewGame()
    }
    
    func initSlider() {
        let thumbnailImageNormal = UIImage(named: "SliderThumb-Normal")!
        slider.setThumbImage(thumbnailImageNormal, for: .normal)
        let thumbnailImageHighlighted = UIImage(named: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbnailImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
       

        let trackLeftImage = UIImage(named: "SliderTrackLeft")!
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        let trackRightImage = UIImage(named: "SliderTrackRight")!
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
    }
    
    @IBAction func showAlert() {
        let diff = abs( currentSliderValue - targetValue)
        let points = 100 - diff
        score += points
        
        let title: String
        if diff == 0 {
            title = "Perfect!"
        } else if diff < 5 {
            title = "You almost had it"
        } else if diff < 10 {
            title = "Pretty good!"
        } else {
            title = "Not even close..."
        }
        
        let message = "You scored \(points) points"
        
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        let action = UIAlertAction(title: "Awesome!", style: .default, handler: { _ in
            self.startNewRound()
        })
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(_slider: UISlider){
        currentSliderValue = lroundf(_slider.value)
        
        print("the value of the slider is now: \(_slider.value)")
        
    }
    
    @IBAction func startNewGame() {
        round = 0
        score = 0
        startNewRound()
    }
    
    func startNewRound(){
        round += 1
        targetValue = Int.random(in: 1...100)
        currentSliderValue = 50
        slider.value = Float(50)
        updateLabels()
    }
    
    func updateLabels(){
         targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
    func scoreDifference() -> Int {
        return abs( currentSliderValue - targetValue)
    }


}

