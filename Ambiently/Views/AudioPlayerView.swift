//
//  AudioPlayerView.swift
//  Ambiently
//
//  Created by Jude Wilson on 7/12/21.
//

import SwiftUI
import AVKit

// Define different items and what parameters they take.
struct audioPlayerKey: EnvironmentKey {
    static let defaultValue: AVAudioPlayer? = nil
}

// Define global variables that other files can access
extension EnvironmentValues {
    var audioPlayer: AVAudioPlayer? {
        get { self[audioPlayerKey.self] }
        set { self[audioPlayerKey.self] = newValue }
    }
}

struct AudioPlayerView: View {
    @State var audioPlayer: AVAudioPlayer!
    var name: String
    var displayName: String
    var author: String

    var body: some View {
        VStack(alignment: .leading) {
            Text("by Ambiently")
                .padding(.horizontal, 20)
            
            // Cover image for audio
            GeometryReader { geo in
                Image(name)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geo.size.width, height: geo.size.width)
                        .clipped()
                        .cornerRadius(10)
                
                // Load the child view that continas the Playback Rate Controls
                VStack {
                    AudioPlaybackControlsHelper()
                        .padding(.top, geo.size.width + 20.0)
                }
                // Pass the audio player to the child view
                .environment(\.audioPlayer, audioPlayer)
                                
                // Load the child view that continas the Pause Controls
                VStack {
                    AudioPauseControlsHelper()
                        .padding(.top, geo.size.width + 65.0)
                }
                // Pass the audio player to the child view
                .environment(\.audioPlayer, audioPlayer)
            }
            .padding(.horizontal, 20)
                        
            // SwiftUI automatically center aligns content vertically in a VStack
            // We add `Spacer()` to push the content to the top
            Spacer()
        }
        // This "hack" makes the width of the view 100% and the height too. Then it shoves contents in the topLeading part of the view.
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)

        // Set the title of the page to "Account Settings"
        .navigationTitle(displayName)
        .onAppear {
            // Load the audio file into the `sound` constant
            let sound = Bundle.main.path(forResource: name, ofType: "mp3")
            
            // Load the `sound` constant into the `audioPlayer`
            self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
            
            self.audioPlayer.enableRate = true
            self.audioPlayer.prepareToPlay()
            
            // Infinetely loop the `audioPlayer`
            self.audioPlayer.numberOfLoops = -1
        }
    }
}

struct AudioPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        AudioPlayerView(name: "name", displayName: "Name", author: "ambiently")
    }
}
