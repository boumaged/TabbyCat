//
//  CatFactsView.swift
//  TabbyCat
//
//  Created by Majed on 27/08/2023.
//

import SwiftUI

struct CatFactsView: View {
    @StateObject var catFactsManager = CatFactsManager()
    var body: some View {
        VStack{
            if let catfact = catFactsManager.catFact{
                Text(catfact.fact)
            }
            else
            {
                ProgressView()
                    .progressViewStyle(.circular)
            }
        }
            .onAppear(){
                catFactsManager.getCatFact()
            }
    }
}

struct CatFactsView_Previews: PreviewProvider {
    static var previews: some View {
        CatFactsView()
    }
}
