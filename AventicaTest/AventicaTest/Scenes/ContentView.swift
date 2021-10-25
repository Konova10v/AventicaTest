//
//  ContentView.swift
//  AventicaTest
//
//  Created by Кирилл Коновалов on 22.10.2021.
//

import SwiftUI

struct MainScreen: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.black
                    .edgesIgnoringSafeArea(.all)

                PlayerView()
                    .edgesIgnoringSafeArea(.all)

                VStack {
                    Spacer()
                    Text("Персональные тренировки")
                        .font(Font.bold(size: 40))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color.white)
                    Spacer()

                    VStack(spacing: 16) {
                        Text("Начните свой путь \nк фитнес-цели")
                            .font(Font.bold(size: 20))
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color.white)

                        VStack(spacing: 24) {
                            NavigationLink(destination: DetailView()) {
                                Text("Начать")
                                    .font(Font.bold(size: 16))
                                    .frame(width: UIScreen.screenWidth - 48,
                                           height: 48,
                                           alignment: .center)
                                    .foregroundColor(Color.black)
                                    .background(Color.white)
                                    .cornerRadius(100)
                            }

                            NavigationLink(destination: DetailView()) {
                                VStack {
                                    Text("У вас уже есть аккаунт?")
                                        .font(Font.medium(size: 14))
                                        .foregroundColor(Color.init(hex: "B9B9BA"))

                                    Text("Войти")
                                        .font(Font.bold(size: 14))
                                        .foregroundColor(Color.white)
                                }
                            }

                        }
                    }
                    .padding(.bottom, 20)
                }
            }
            .navigationBarHidden(true)
        }
    }
}
