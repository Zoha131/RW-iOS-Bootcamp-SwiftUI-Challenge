//
//  AddButtonView.swift
//  Birdui
//
//  Created by Emilio Rodriguez on 7/12/20.
//  Copyright © 2020 Razeware. All rights reserved.
//

import SwiftUI

struct AddButtonView: View {

  @Binding var showNewPost : Bool
  
  var body: some View {
    
    VStack {
      Spacer()
      HStack {
        Spacer()
        Button(action: {
          self.showNewPost = true
        }, label: {
          Text("+")
            .font(.system(.largeTitle))
            .frame(width: 65, height: 58)
            .foregroundColor(Color.white)
            .padding(.bottom, 7)
        })
          .background(Color.orange.opacity(0.9))
          .cornerRadius(39.5)
          .padding(.trailing, 10)
          .padding(.bottom, 5)
          .shadow(color: Color.black.opacity(0.3),
                  radius: 3,
                  x: 3,
                  y: 3)
      }
    }
    
    
  }
  
  
}

struct AddButtonView_Previews: PreviewProvider {
    static var previews: some View {
      AddButtonView(showNewPost: .constant(false))
    }
}
