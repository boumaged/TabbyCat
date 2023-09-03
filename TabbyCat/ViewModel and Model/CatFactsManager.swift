//
//  CatFactsManager.swift
//  TabbyCat
//
//  Created by Majed on 27/08/2023.
//

import Foundation

class CatFactsManager: ObservableObject
{
    let apiURL = URL(string: "https://catfact.ninja/fact")!
    @Published var catFact : CatFact?
    
    func getCatFact() {
           Task {
               let (data, _) = try await URLSession.shared.data(from: apiURL)
               print("🐱🐱🐱 Got the data!")
               print(String(data: data, encoding: .utf8))
               
               try await MainActor.run{
                   self.catFact = try JSONDecoder().decode(CatFact.self,from: data)
               }
          }
       }
}
