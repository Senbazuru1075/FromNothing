//
//  OnboardingItem.swift
//  DealHelper
//
//  Created by Remmington Damper on 1/13/23.
//

import Foundation

//MARK: Networked Codable Responses
///The Onboarding Item Response manages the response for all onboarding items. It will create an array of onboarding items for onboarding
struct OnboardingItemResponse: Codable {
    var onboardingItems: [OnboardingItem]
}

//MARK: Onboarding Item Model
///The OnboardingItem Model is used for onboarding. It holds the information for the onboarding cards in the onboarding view.
struct OnboardingItem: Identifiable, Equatable, Codable {
    //MARK: Adoptions
    ///This is conformance to equatable to be able to compare onboarding item cards
    static func == (lhs: OnboardingItem, rhs: OnboardingItem) -> Bool {
        lhs.id == rhs.id
    }
    
    //MARK: Onboarding Model Properties
    ///id is to order the  onboarding cards
    let id: Int
    ///title is for the main title information of the onboarding card. Gives context of what the user will learn
    let title: String?
    ///url is for linking to pages on the main clearacquire website
    let url: String?
    ///description field is for explaining the onboarding
    let description: String?
    ///optional audio that will go into the onboarding
    let audio: String?
    ///optional video that will go into the onboarding
    let video: String?
    
    //MARK: Coding Keys
    ///Coding Keys for translating data into foundational models
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case url
        case description
        case audio
        case video
        case presentation
    }
    
    //MARK: Codable initializers
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .id)
        try container.encodeIfPresent(self.title, forKey: .title)
        try container.encodeIfPresent(self.url, forKey: .url)
        try container.encodeIfPresent(self.description, forKey: .description)
        try container.encodeIfPresent(self.audio, forKey: .audio)
        try container.encodeIfPresent(self.video, forKey: .video)
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.title = try container.decodeIfPresent(String.self, forKey: .title)
        self.url = try container.decodeIfPresent(String.self, forKey: .url)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.audio = try container.decodeIfPresent(String.self, forKey: .audio)
        self.video = try container.decodeIfPresent(String.self, forKey: .video)
    }
}
