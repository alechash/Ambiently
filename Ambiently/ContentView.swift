//
//  ContentView.swift
//  Ambiently
//
//  Created by Jude Wilson on 7/11/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                // Load the initial row with "Our Favorites"
                RowView()
                
                // SwiftUI automatically center aligns content vertically in a VStack
                // We add `Spacer()` to push the content to the top
                Spacer()
            }
            
            // Set the title of the page to "Ambiently"
            .navigationTitle("Ambiently")
            
            // This is the toolbar, this is the stuff above the page title
            .toolbar {
                // This toolbar item is the profile icon
                ToolbarItem(placement: .navigationBarLeading) {
                    // A "hack" to have a link on a button, put the button in the link
                    NavigationLink(destination: AccountSettingsView()) {
                        Button(action: {}) {
                            // In order to get the icon to actually show in the button,
                            // we have to put it in some sort of stack, HStack works
                            HStack {
                                // Load the account icon
                                Image(systemName: "person.crop.circle")
                            }
                        }
                    }
                }
                
                // This toolbar item is the gear icon
                ToolbarItem {
                    // A "hack" to have a link on a button, put the button in the link
                    NavigationLink(destination: AppSettingsView()) {
                        Button(action: {}) {
                            // In order to get the icon to actually show in the button,
                            // we have to put it in some sort of stack, HStack works
                            HStack {
                                // Load the gear icon
                                Image(systemName: "gearshape")
                            }
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 11")
    }
}
