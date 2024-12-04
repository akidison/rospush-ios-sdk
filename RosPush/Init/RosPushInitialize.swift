//
//  RosPushInitialize.swift
//  RosPush
//
//  Created by André Kis on 04.12.24.
//

import Foundation
import AppMetricaCore

struct RosPushInitialize {
    static func configure(with apiKey: String) {
        let configuration = AppMetricaConfiguration(apiKey: apiKey)
        AppMetrica.activate(with: configuration!)
    }
}
