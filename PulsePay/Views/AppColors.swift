//
//  AppColors.swift
//  PulsePay
//
//  Created by Anindya Mukhopadhyay on 01/01/26.
//

import SwiftUI

enum AppColors {

    // Backgrounds
    static let darkBG = Color(red: 10/255, green: 14/255, blue: 25/255)     // #0A0E19
    static let cardWhite = Color(red: 245/255, green: 247/255, blue: 250/255) // #F5F7FA

    // Text
    static let textPrimary = Color.black.opacity(0.85)
    static let textSecondary = Color.gray.opacity(0.75)
    static let textOnDark = Color.white.opacity(0.9)
    static let textMutedOnDark = Color.white.opacity(0.6)

    // Accents
    static let accentBlue = Color(red: 70/255, green: 130/255, blue: 255/255)
    static let positive = Color(red: 46/255, green: 160/255, blue: 90/255)
    static let negative = Color(red: 210/255, green: 70/255, blue: 70/255)
    static let highlight = Color.orange
}
