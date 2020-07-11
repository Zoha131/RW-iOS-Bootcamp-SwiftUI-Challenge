//
//  ImagePicker.swift
//  Birdui
//
//  Created by Audrey Tam on 4/7/20.
//  Copyright © 2020 Razeware. All rights reserved.
//

import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
  
  
  @Binding var uiImage: UIImage?
  @Environment(\.presentationMode) var presentationMode
  
  class Coordinator: NSObject,
    UIImagePickerControllerDelegate,
    UINavigationControllerDelegate{
    
    var parent: ImagePicker
    
    init(_ parent: ImagePicker){
      self.parent = parent
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
      
      if let uiImage = info[.originalImage] as? UIImage{
        parent.uiImage = uiImage
      }
      
      parent.presentationMode.wrappedValue.dismiss()
    }
    
  }
  
  func makeCoordinator() -> Coordinator {
    return Coordinator(self)
  }
  
  func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) ->  UIImagePickerController {
    let picker = UIImagePickerController()
    picker.delegate = context.coordinator
    return picker
  }
  
  func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
    
  }
  
  
}
// Hint: hackingwithswift.com

struct ImagePicker_Previews: PreviewProvider {
  static var previews: some View {
    /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
  }
}
