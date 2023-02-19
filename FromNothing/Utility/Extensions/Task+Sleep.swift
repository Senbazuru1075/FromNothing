//
//  Task+Sleep.swift
//  FromNothing
//
//  Created by Remmington Damper on 2/18/23.
//

import Foundation

extension Task where Success == Never, Failure == Never {
    static func sleepThrowing(_ seconds: Double) async throws {
        try await self.sleep(nanoseconds: UInt64(seconds * 1_000_000_000))
    }
}
