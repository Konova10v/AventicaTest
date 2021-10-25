//
//  ProfileView.swift
//  AventicaTest
//
//  Created by Кирилл Коновалов on 24.10.2021.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var profileVM: ProfileViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            VStack(spacing: 10) {
                ZStack {
                    Circle()
                        .fill(Color.black)
                        .opacity(0.24)
                        .frame(width: 80, height: 80)
                    
                    Image("personal")
                }
            }
            .padding(.top, 20)
            
            List {
                HStack {
                    Text("День рождения")
                    Spacer()
                    Text(profileVM.birthday)
                }
                
                HStack {
                    Text("Возраст")
                    Spacer()
                    Text("\(profileVM.age) лет")
                }
                
                HStack {
                    Text("Пол")
                    Spacer()
                    Text(profileVM.biologicalSex)
                }
                
                HStack {
                    Text("Группа крови")
                    Spacer()
                    Text(profileVM.typeBlood)
                }
                
                HStack {
                    Text("Рост")
                    Spacer()
                    Text("\(profileVM.health)м")
                }
                
                HStack {
                    Text("Вес")
                    Spacer()
                    Text("\(profileVM.weight)кг")
                }
            }
        }
        .navigationBarHidden(true)
        .onAppear {
            profileVM.loadAndDisplayAgeSexAndBloodType()
            profileVM.loadHeight()
            profileVM.loadWeight()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
