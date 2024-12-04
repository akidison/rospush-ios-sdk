//
//  RosPushMetric.swift
//  RosPush
//
//  Created by André Kis on 04.12.24.
//

import Foundation

@objc
public class RosPushMetric: NSObject {
    
    @objc
    public static func configure(with apiKey: String) {
        RosPushInitialize.configure(with: apiKey)
    }
}
