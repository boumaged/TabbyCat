//
//  CatGalleryView.swift
//  TabbyCat
//
//  Created by Majed on 27/08/2023.
//

import SwiftUI
import PhotosUI

struct CatGalleryView: View {
    @State var photoPicked: PhotosPickerItem?
    @State var image : Data?
    var body: some View {
        NavigationStack {
                    VStack {
                        
                        if let image, let uiImage = UIImage(data: image) {
                            Image(uiImage: uiImage).resizable().scaledToFit()
                        }  else {
                            Text("Gallery")
                        }
                    }
                    .navigationTitle("Gallery")
                    .toolbar {
                        PhotosPicker(selection: $photoPicked) {
                            Image(systemName: "photo.on.rectangle.angled")
                        }
                    }
                }
                .onChange(of: photoPicked) { newValue in
                    Task {
                        print("picked")
                        if let simage = try?  await newValue?.loadTransferable(type: Data.self)
                        {
                            print("loaded image")
                            await MainActor.run {
                                self.image = simage
                                
                                print("Updating image")
                            }
                        }
                    }
                }
        
    }
}

struct CatGalleryView_Previews: PreviewProvider {
    static var previews: some View {
        CatGalleryView()
    }
}
