//
//  SplashScreen.swift
//  MarketList
//
//  Created by Alan Anderson Da silva Modesto on 31/01/2025.
//


import SwiftUI

struct SplashView: View {
    @State private var isActive = false
    @State private var carrinhoOffset: CGFloat = -200
    @State private var textoOpacity: Double = 0

    var body: some View {
        Group {
            if isActive {
                ContentView()
            } else {
                ZStack {
                    LinearGradient(gradient: Gradient(colors: [.green, .blue]), startPoint: .top, endPoint: .bottom)
                        .ignoresSafeArea()

                    VStack {
                        Image("SplashTest")
                            .font(.system(size: 10))
                            .foregroundColor(.white)
                            .offset(x: 0, y: carrinhoOffset)

                        Text("Bem-vindo ao MarketList")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .opacity(textoOpacity)
                    }
                }
                .onAppear {
                    withAnimation(.easeInOut(duration: 1.5)) {
                        carrinhoOffset = 0
                    }

                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        withAnimation(.easeInOut(duration: 1)) {
                            textoOpacity = 1
                        }
                    }

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

#Preview {
    SplashView()
}
