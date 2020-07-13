//
//  AddButtonView.swift
//  Birdui
//
//  Created by Emilio Rodriguez on 7/12/20.
//  Copyright © 2020 Razeware. All rights reserved.
//

import SwiftUI

struct AddButtonView: View {

  var body: some View {
    
    VStack {
      Spacer()
      HStack {
        Spacer()
        Button(action: {
          
        }, label: {
          Text("+")
            .font(.system(.largeTitle))
            .frame(width: 77, height: 70)
            .foregroundColor(Color.white)
            .padding(.bottom, 7)
        })
          .background(Color.orange)
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
        AddButtonView()
    }
}
