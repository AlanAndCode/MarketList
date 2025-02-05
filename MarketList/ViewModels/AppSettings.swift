//
//  AppSettings.swift
//  MarketList
//
//  Created by Alan Anderson Da silva Modesto on 05/02/2025.
//


import SwiftUI
import Combine

class AppSettings: ObservableObject {
    static let shared = AppSettings()
    
    @Published var itemThreshold: Int = 1  // Valor padrão inicial

    private init() {}  // Singleton para garantir que exista apenas uma instância
}
