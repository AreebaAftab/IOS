//
//  ViewController.swift
//  Audio
//
//  Created by user142944 on 2/27/19.
//  Copyright © 2019 user142944. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioRecorderDelegate,AVAudioPlayerDelegate{
    
    @IBOutlet weak var playBTN: UIButton!
    @IBOutlet weak var recordBTN: UIButton!
    
    var soundRecorder : AVAudioRecorder!
    var soundPlayer : AVAudioPlayer!
    
    var fileName : String = "audioFile.m4a"
    
    // Create the alert controller
    let alertController = UIAlertController(title: "Title", message: "Your file has been saved successfully!", preferredStyle: .alert)
    
    // Create the actions
    let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default) {
        UIAlertAction in
        NSLog("OK Pressed")
    }
    let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) {
        UIAlertAction in
        NSLog("Cancel Pressed")
    }
    
    // Add the actions
    
    
    
    // Present the controller
    override func viewDidLoad() {
        super.viewDidLoad()
     
        setupRecorder()
        playBTN.isEnabled = false
        
    }

    func getDocumentsDirector() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func setupRecorder() {
        let audioFilename = getDocumentsDirector().appendingPathComponent(fileName)
        let recordSetting = [ AVFormatIDKey : kAudioFormatAppleLossless ,AVEncoderAudioQualityKey :
            AVAudioQuality.max.rawValue,
            AVEncoderBitRateKey : 320000,
            AVNumberOfChannelsKey : 2,
        AVSampleRateKey : 44100.2 ] as [String : Any]
        
        do{
            soundRecorder = try AVAudioRecorder(url: audioFilename, settings: recordSetting)
            soundRecorder.delegate = self
            soundRecorder.prepareToRecord()
        }catch {
            print(error)
        }
    }
    
    func setupPlayer() {
        let audioFilename = getDocumentsDirector().appendingPathComponent(fileName)
        do {
            soundPlayer = try AVAudioPlayer(contentsOf: audioFilename)
            soundPlayer.delegate = self
            soundPlayer.prepareToPlay()
            soundPlayer.volume = 1.0
        }catch {
            print(error)
        }
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        playBTN.isEnabled = true
        print(recorder.url)
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        recordBTN.isEnabled = true
        playBTN.setTitle("Play", for: .normal)
    }
    
    
    @IBAction func recordAct(_ sender: Any) {
        if recordBTN.titleLabel?.text == "Record" {
            soundRecorder.record()
            recordBTN.setTitle("Stop", for: .normal)
            playBTN.isEnabled = false
        }else {
            soundRecorder.stop()
            recordBTN.setTitle("Record", for: .normal)
            playBTN.isEnabled = false
        }
    
    }
    
    @IBAction func playAct(_ sender: Any) {
        if playBTN.titleLabel?.text == "Play" {
            playBTN.setTitle("Stop", for: .normal)
            recordBTN.isEnabled = false
            setupPlayer()
            soundPlayer.play()
        }else {
            soundPlayer.stop()
            playBTN.setTitle("Play", for: .normal)
            recordBTN.isEnabled = false

    }
}
    @IBAction func saveAct(_ sender: Any) {
        self.present(alertController, animated: true, completion: nil);
        alertController.addAction(okAction)    }
    
}
