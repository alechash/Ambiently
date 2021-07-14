//
//  AudioPauseControlsHelper.swift
//  Ambiently
//
//  Created by Jude Wilson on 7/12/21.
//

import SwiftUI
import AVKit

struct AudioPauseControlsHelper: View {
    @State var isPlaying: Bool = false
    @Environment(\.audioPlayer) var audioPlayer
    @State var countDownStarted: Bool = false
    @State var stepperValue: Int = 14
    @State var secondsLeft: Int = 59
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                // Play/Pause button
                Button(action: {
                    print("Backward")
                }) {
                    // Set the icon to the play button
                    Image(systemName: "backward.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 25, maxHeight: 25)
                        .accentColor(.primary)
                }
                
                Spacer()
                
                // Play/Pause button
                Button(action: {
                    isPlaying = !isPlaying
                    
                    // Pause the audio file
                    playOrPause(audioPlayer: self.audioPlayer!, isPlaying: self.isPlaying)
                }) {
                    // Set the icon to the play button
                    Image(systemName: self.isPlaying == true ? "pause.fill" : "play.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 25, maxHeight: 25)
                        .accentColor(.primary)
                }
                
                Spacer()
                
                // Play/Pause button
                Button(action: {
                    print("Forward")
                }) {
                    // Set the icon to the play button
                    Image(systemName: "forward.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 25, maxHeight: 25)
                        .accentColor(.primary)
                }
                
                Spacer()
            }
        
            VStack {
                Stepper("Turning off in \(stepperValue)m \(secondsLeft)s", value: $stepperValue, in: 0...90, onEditingChanged : {didChange in
                    waitAndRecalculate(audioPlayer: self.audioPlayer!, count: self.stepperValue, started: self.countDownStarted)
                    if countDownStarted == false {
                        countDownStarted = true
                    }
                })
            }
            .padding(0)
        }
    }
    
    func waitAndRecalculate(audioPlayer: AVAudioPlayer, count: Int, started: Bool) {
        var firedCount = 0
        
        if !started {
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                print("Timer fired!")
                
                firedCount += 1
                
                if (firedCount == 60) {
                    firedCount = 0
                    stepperValue -= 1
                }
                
                if secondsLeft == 0 {
                    secondsLeft = 60
                }
                
                secondsLeft -= 1
                
                if stepperValue == -1 {
                    isPlaying = !isPlaying
                    
                    pause(audioPlayer: audioPlayer)
                    timer.invalidate()
                    
                    stepperValue = 0
                    secondsLeft = 0
                    
                    countDownStarted = false
                }
            }
        }
    }
}

func playOrPause(audioPlayer: AVAudioPlayer, isPlaying: Bool) {
    if isPlaying == true {
        print("Playing")
        audioPlayer.play()
    } else {
        print("Pausing")
        audioPlayer.pause()
    }
}

func pause(audioPlayer: AVAudioPlayer) {
    if audioPlayer.isPlaying == true {
        print("Pausing")
        
        playOrPause(audioPlayer: audioPlayer, isPlaying: false)
    }
}

struct AudioPauseControlsHelper_Previews: PreviewProvider {
    static var previews: some View {
        AudioPauseControlsHelper()
    }
}
