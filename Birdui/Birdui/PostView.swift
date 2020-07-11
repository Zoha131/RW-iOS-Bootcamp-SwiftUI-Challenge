//
//  PostView.swift
//  Birdui
//
//  Created by Audrey Tam on 4/7/20.
//  Copyright © 2020 Razeware. All rights reserved.
//

import SwiftUI

struct PostView: View {
    let post: MediaPost
    
    var body: some View {
        // TODO: This should look exactly like Birdie's table view cell.
        // The post text is left-aligned below the mascot image.
        // The image, if any, is horizontally centered in the view.
        
        VStack{
            HStack {
                Image("mascot_swift-badge")
                    .resizable()
                    .frame(width: 50, height: 50)
                VStack(alignment: .leading) {
                    Text("\(post.userName)")
                    //temp untill I figure out how to format it properly
                    Text("\(post.getFormatedDate())")
                }
                Spacer()
            }
            HStack {
                Text("\(post.textBody ?? "")")
                Spacer()
            }
            if post.uiImage != nil {
                Image(uiImage: post.uiImage!)
                .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150, alignment: .center)
            }
        }
        
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(post: MediaPost(textBody: "Went to the Aquarium today :]",
                                 userName: "Audrey", timestamp: Date(timeIntervalSinceNow: -9876),
                                 uiImage: UIImage(named: "octopus")))
    }
}
