//
//  Superhero.swift
//  Heroes
//
//  Created by Максим Удальцов on 14.11.2023.
//

import Foundation

// MARK: - WelcomeElement
struct Superhero: Decodable {
    let id: Int
    let name, slug: String
    let powerstats: Powerstats
    let appearance: Appearance
    let biography: Biography
    let work: Work
    let connections: Connections
    let images: Images
}

// MARK: - Appearance
struct Appearance: Decodable {
    let gender: Gender
    let race: String?
    let height, weight: [String]
    let eyeColor, hairColor: String
}

enum Gender: String, Decodable {
    case empty = "-"
    case female = "Female"
    case male = "Male"
}

// MARK: - Biography
struct Biography: Decodable {
    let fullName, alterEgos: String
    let aliases: [String]
    let placeOfBirth, firstAppearance: String
    let publisher: String?
    let alignment: Alignment
}

enum Alignment: String, Decodable {
    case bad = "bad"
    case empty = "-"
    case good = "good"
    case neutral = "neutral"
}

// MARK: - Connections
struct Connections: Decodable {
    let groupAffiliation, relatives: String
}

// MARK: - Images
struct Images: Decodable {
    let xs, sm, md, lg: String
}

// MARK: - Powerstats
struct Powerstats: Decodable {
    let intelligence, strength, speed, durability: Int
    let power, combat: Int
}

// MARK: - Work
struct Work: Decodable {
    let occupation, base: String
}
