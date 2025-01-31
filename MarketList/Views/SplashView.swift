//
//  SplashScreen.swift
//  MarketList
//
//  Created by Alan Anderson Da silva Modesto on 31/01/2025.
//


import SwiftUI

struct SplashScreen: View {
    @State private var isActive = false
    @State private var carrinhoOffset: CGFloat = -200
    @State private var textoOpacity: Double = 0 // Controla a opacidade do texto

    var body: some View {
        Group {
            if isActive {
                ContentView()
            } else {
                ZStack {
                    LinearGradient(gradient: Gradient(colors: [.green, .blue]), startPoint: .top, endPoint: .bottom)
                        .ignoresSafeArea()

                    VStack {
                        Image(systemName: "cart.fill")
                            .font(.system(size: 100))
                            .foregroundColor(.white)
                            .offset(x: 0, y: carrinhoOffset)

                        Text("Bem-vindo ao MarketList")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .opacity(textoOpacity) // Controla a opacidade do texto
                    }
                }
                .onAppear {
                    withAnimation(.easeInOut(duration: 1.5)) {
                        carrinhoOffset = 0
                    }

                    // Animação do texto
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        withAnimation(.easeInOut(duration: 1)) {
                            textoOpacity = 1
                        }
                    }

                    // Tempo de exibição da Splash Screen
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        withAnimation {
                            isActive = true
                        }
                    }
                }
            }
        }
    }
}

struct ContentView: View {
    var body: some View {
        Text("Tela Principal do Aplicativo")
            .font(.largeTitle)
            .padding()
    }
}

#Preview {
    SplashScreen()
}