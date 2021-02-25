//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Raj Tailor on 2/23/2021.
//  Copyright © 2019 Raj Tailor. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var timer = Timer()
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view.
    }
    
    

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        if quizBrain.checkAnswer(sender.currentTitle!) {
            sender.backgroundColor = UIColor.green
            MP3.background.startMusic(sound: "correct")
        } else {
            sender.backgroundColor = UIColor.red
            MP3.background.startMusic(sound: "wrong")
        }
        
        quizBrain.nextQuestion()

        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    
    }
    
    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        
    }
}

class MP3{
    static let background = MP3()
    var audioPlayer: AVAudioPlayer?
    
    func startMusic(sound: String){
        if let bundle = Bundle.main.path(forResource: sound, ofType: "mp3"){
            let backgroundMusic = NSURL(fileURLWithPath: bundle)
            do{
                audioPlayer = try AVAudioPlayer(contentsOf: backgroundMusic as URL)
                guard let audioPlayer = audioPlayer else {return}
                audioPlayer.numberOfLoops = 0
                audioPlayer.prepareToPlay()
                audioPlayer.play()
            } catch {
                print(error)
            }
        }
    }
    func stopMusic() {
        audioPlayer?.stop()
    }
}
