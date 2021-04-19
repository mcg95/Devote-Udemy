//
//  BackgroundImageView.swift
//  Devote-udemy
//
//  Created by Mewan on 19/04/2021.
//

import SwiftUI

struct BackgroundImageView: View {
    
    // MARK: Body

    var body: some View {
        Image("rocket")
            .antialiased(true)
            .resizable()
            .ignoresSafeArea(.all)
            .scaledToFill()
    }
}

// MARK: Preview

struct BackgroundImageView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundImageView()
    }
}
