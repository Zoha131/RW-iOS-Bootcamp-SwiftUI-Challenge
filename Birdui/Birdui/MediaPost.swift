//
//  AppDelegate.swift
//  Birdui
//
//  Created by Audrey Tam on 3/7/20.
//  Copyright © 2020 Razeware. All rights reserved.
//

import UIKit

struct MediaPost: Identifiable {
  let id = UUID()
  var textBody: String?
  let userName: String
  let timestamp: Date
  let uiImage: UIImage?
  var edited = false
}

extension MediaPost {
  
  func getFormatedDate() -> String {
    
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "en_US")
    dateFormatter.setLocalizedDateFormatFromTemplate("MMMd'T'HH:mm")
    
    return dateFormatter.string(from: timestamp)
  }
  
}
