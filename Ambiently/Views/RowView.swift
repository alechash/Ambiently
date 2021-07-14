//
//  RowView.swift
//  Ambiently
//
//  Created by Jude Wilson on 7/12/21.
//

import SwiftUI

struct RowView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Our Favorites")
                .font(.title3)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .padding(.leading, 15)
                .padding(.top, 15.0)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    RowItemHelper()
                }
                .padding(.trailing, 15.0)
            }
            .frame(height: 185)
        }
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView()
    }
}
