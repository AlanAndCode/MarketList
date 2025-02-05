//
//  SettingsViewModel.swift
//  MarketList
//
//  Created by Alan Anderson Da silva Modesto on 04/02/2025.
//


import Foundation
import Combine

class SettingsViewModel: ObservableObject {
    @Published var itemThreshold: Int = 1 // Valor padrão
}