//
//  DetailView.swift
//  AventicaTest
//
//  Created by Кирилл Коновалов on 22.10.2021.
//

import SwiftUI

struct DetailView: View {
    var body: some View {
        ZStack {
            Image("backbroundImage")
                .resizable()
                .ignoresSafeArea()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            
            VStack(spacing: UIScreen.screenWidth != 320.0 ? 32 : 14) {
                Spacer()
                
                Text("Получайте персонализированные предложения и полезный контент")
                    .font(Font.bold(size: 26))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color.white)
                
                Text("На следующем экране мы запросим у вас доступ к данным о вашей активности. Если вы поделитесь ими, то сможете:")
                    .font(Font.medium(size: 14))
                    .multilineTextAlignment(.leading)
                    .foregroundColor(Color.white)
                    .frame(width: UIScreen.screenWidth - 32, alignment: .leading)
                
                HStack(alignment: .top, spacing: 20) {
                    ZStack {
                        Circle()
                            .fill(Color.white)
                            .opacity(0.24)
                            .frame(width: 40, height: 40)
                        
                        Image("stock")
                    }
                    
                    Text("Участвовать в специальных акциях")
                        .font(Font.bold(size: 16))
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color.white)
                    
                    Spacer()
                }
                
                HStack(alignment: .top, spacing: 20) {
                    ZStack {
                        Circle()
                            .fill(Color.white)
                            .opacity(0.24)
                            .frame(width: 40, height: 40)
                        
                        Image("personal")
                    }
                    
                    Text("Получать персонализированные предложения")
                        .font(Font.bold(size: 16))
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color.white)
                    
                    Spacer()
                }
                
                HStack(alignment: .top, spacing: 20) {
                    ZStack {
                        Circle()
                            .fill(Color.white)
                            .opacity(0.24)
                            .frame(width: 40, height: 40)
                        
                        Image("content")
                    }
                    
                    Text("Получать более релевантный контент")
                        .font(Font.bold(size: 16))
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color.white)
                    
                    Spacer()
                }
                
                Text("Если вы передумаете, то сможете в дальнейшем отключить эту опцию в настройках мобильного приложения в любой момент")
                    .font(Font.medium(size: 16))
                    .font(.system(size: 16, weight: .medium))
                    .multilineTextAlignment(.leading)
                    .foregroundColor(Color.white)
                    .frame(width: UIScreen.screenWidth - 32, alignment: .leading)
                
                Spacer()
                
                NavigationLink(destination: ProfileView()) {
                    Text("Понятно")
                        .font(Font.bold(size: 16))
                        .frame(width: UIScreen.screenWidth - 48,
                               height: 48,
                               alignment: .center)
                        .foregroundColor(.black)
                        .background(Color.white)
                        .cornerRadius(100)
                        .padding(.bottom, 40)
                }
            }
            .padding(.horizontal, 16)
        }
        .navigationBarHidden(true)
    }
}
