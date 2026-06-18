//
    // Project: CatFactsWidgets
    //  File: CatFact.swift
    //  Created by Noah Carpenter
    //  🐱 Follow me on YouTube! 🎥
    //  https://www.youtube.com/@noahdoescoding
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Fun Fact: Cats have five toes on their front paws, but only four on their back paws! 🐾
    //  Dream Big, Code Bigger
    

import Foundation

struct CatFact: Identifiable, Hashable{
    let id = UUID()
    
    let text: String
    
    static let sampleFacts: [CatFact] = [
        CatFact(text: "Pete the Cat is cool"),
        CatFact(text: "A group of cats is called a clowder."),
        CatFact(text: "The oldest known pet cat was found in a 9,500-year-old grave."),
        CatFact(text: "Cats have five toes on their front paws, but only four on their back paws!"),
        CatFact(text: "House cats can run up to 30 miles per hour.")
    ]
}
