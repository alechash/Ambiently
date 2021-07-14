//
//  AudioPlaybackControlsHelper.swift
//  Ambiently
//
//  Created by Jude Wilson on 7/12/21.
//

import SwiftUI
import AVKit

struct AudioPlaybackControlsHelper: View {
    @Environment(\.audioPlayer) var audioPlayer

    var body: some View {
        HStack {
            
            // Play/Pause button
            Button(action: {
                // Pause the audio file
                changePlayBack(audioPlayer: self.audioPlayer!, newSpeed: 0.5)
            }) {
                Text("½×")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            }
            
            Spacer()
            
            // Play/Pause button
            Button(action: {
                // Pause the audio file
                changePlayBack(audioPlayer: self.audioPlayer!, newSpeed: 0.75)
            }) {
                Text("¾×")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            }
            
            Spacer()
            
            // Play/Pause button
            Button(action: {
                // Pause the audio file
                changePlayBack(audioPlayer: self.audioPlayer!, newSpeed: 1)
                
            }) {
                Text("1×")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            }
            
            Spacer()
            
            // Play/Pause button
            Button(action: {
                // Pause the audio file
                changePlayBack(audioPlayer: self.audioPlayer!, newSpeed: 2.5)
            }) {
                Text("1½×")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            }
            
            Spacer()
            
            // Play/Pause button
            Button(action: {
                // Pause the audio file
                changePlayBack(audioPlayer: self.audioPlayer!, newSpeed: 2.0)
            }) {
                Text("2×")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

func changePlayBack(audioPlayer: AVAudioPlayer, newSpeed: Float) {
    print(String(newSpeed))
    
    audioPlayer.rate = newSpeed
    
    print(String(audioPlayer.rate))
}

struct AudioPlaybackControlsHelper_Previews: PreviewProvider {
    static var previews: some View {
        AudioPlaybackControlsHelper()
    }
}
