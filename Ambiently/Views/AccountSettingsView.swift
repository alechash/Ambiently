//
//  AccountSettingsView.swift
//  Ambiently
//
//  Created by Jude Wilson on 7/12/21.
//

import SwiftUI

struct AccountSettingsView: View {
    var body: some View {
        VStack {
            // Have the settings form loaded and ready to use
            Text("Hiii")
            
            // SwiftUI automatically center aligns content vertically in a VStack
            // We add `Spacer()` to push the content to the top
            Spacer()
        }
            
        // Set the title of the page to "Account Settings"
        .navigationTitle("Account Settings")
    }
}

struct AccountSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        AccountSettingsView()
    }
}
