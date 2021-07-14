//
//  RowItemHelper.swift
//  Ambiently
//
//  Created by Jude Wilson on 7/12/21.
//

import SwiftUI
import URLImage

struct RowItemHelper: View {
    var body: some View {
        VStack(alignment: .leading) {
            
            NavigationLink(destination: AudioPlayerView(name: "heavy_rain", displayName: "Heavy Rain", author: "Ambiently")) {
                VStack(alignment: .leading) {
                    Image("heavy_rain")
                        .resizable()
                        .frame(width: 155, height: 155)
                        .cornerRadius(5)
                    
                    Text("Heavy Rain")
                        .font(.caption)
                        .padding(.bottom, 10.0)
                }
            }
        }
        .padding(.leading, 15)
        
    }
}

struct RowItemHelper_Previews: PreviewProvider {
    static var previews: some View {
        RowItemHelper()
    }
}
