//
//  CatImagesView.swift
//  TabbyCat
//
//  Created by Majed on 27/08/2023.
//

import SwiftUI

struct CatImagesView: View {
    @State var catURL = "https://cataas.com/cat?"
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: catURL)!){ img  in
                img
                    .resizable()
                    .scaledToFit()
                
                    
            }placeholder: {
                ProgressView()
            }
            Button("Give me new cat!")
            {
                catURL += "1"
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

struct CatImagesView_Previews: PreviewProvider {
    static var previews: some View {
        CatImagesView()
    }
}
