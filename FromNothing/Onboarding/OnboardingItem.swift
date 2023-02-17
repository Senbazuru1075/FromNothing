//
//  OnboardingItem.swift
//  DealHelper
//
//  Created by Remmington Damper on 1/13/23.
//

import Foundation

struct OnboardingItemResponse: Decodable, Encodable {
    var onboardingItems: [OnboardingItem]
}
struct OnboardingItem: Identifiable, Equatable, Decodable, Encodable {
    static func == (lhs: OnboardingItem, rhs: OnboardingItem) -> Bool {
        lhs.id == rhs.id
    }
    let id: Int
    let title: String
    let url: String?
    let description: String
    let audio: String?
    let video: String?
    
    enum CodingKeys: CodingKey {
        case id
        case title
        case url
        case description
        case audio
        case video
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.title, forKey: .title)
        try container.encodeIfPresent(self.url, forKey: .url)
        try container.encode(self.description, forKey: .description)
        try container.encodeIfPresent(self.audio, forKey: .audio)
        try container.encodeIfPresent(self.video, forKey: .video)
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.title = try container.decode(String.self, forKey: .title)
        self.url = try container.decodeIfPresent(String.self, forKey: .url)
        self.description = try container.decode(String.self, forKey: .description)
        self.audio = try container.decodeIfPresent(String.self, forKey: .audio)
        self.video = try container.decodeIfPresent(String.self, forKey: .video)
    }
}
