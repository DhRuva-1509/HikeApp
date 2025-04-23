//
//  CardView.swift
//  Hike
//
//  Created by Dhruva Patil on 2024-12-30.
//

import SwiftUI

extension Image {
    func imageModifier() -> some View {
        self
            .resizable()
            .scaledToFit()
    }
}

extension Text{
    func headingModifer() -> some View {
        self
            .fontWeight(.black)
            .font(.system(size: 52))
            .foregroundStyle(LinearGradient(colors: [.colorGrayLight,.colorGrayMedium], startPoint: .top, endPoint: .bottom ))
    }
    
    func descriptionModifier() -> some View {
        self
            .multilineTextAlignment(.leading)
            .italic()
            .foregroundColor(.colorGrayMedium)
    }
}

struct CardView: View {
    
    @State private var imageNumber : Int = 1
    @State private var randomNumber : Int = 1
    @State private var isShowingSheet : Bool = false
    
    func randomNumberGenerator()  {
        repeat{
            randomNumber = Int.random(in: 1...5)
        }while randomNumber == imageNumber
        
        imageNumber = randomNumber
    }
    
    
    var body: some View {
        ZStack {
            CustomBackgroundView()
            VStack {
                //MARK - HEADER
                    VStack (alignment:.leading){
                        HStack {
                            Text("Hiking")
                                .headingModifer()
                            
                            Spacer()
//                            Button(action: {
//                                print("Button was pressed")
//                                isShowingSheet.toggle()
//                             }, label: {
//                                CustomButtonView()
//                            })
                            
                            Button {
                                print("Button was pressed")
                                isShowingSheet.toggle()
                            } label: {
                                CustomButtonView()
                            }
                            .sheet(isPresented: $isShowingSheet)
                            {
                                SettingsView()
                                    .presentationDragIndicator(.visible)
                                    .presentationDetents([.medium,.large])
                            }
                        }
                        
                        Text("Fun and enjoyable outdoor activities for friends and family")
                            .descriptionModifier()
                        
                    }.padding(.horizontal,30)
                //MARK - MAIN CONTENT
                ZStack {
                    CustomCircleView()
                    Image("image-\(randomNumber)")
                        .imageModifier()
                        .animation(.default, value: imageNumber)
                }
                Button( action: {
//                    print("Button was pressed")
                    randomNumberGenerator()
                }, label: {
                    Text("Explore More")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(LinearGradient(colors: [.customGreenLight , .customGreenMedium], startPoint: .top, endPoint: .bottom)
                        )
                        .shadow(color: Color.black.opacity(0.25),radius: 0.25,x:1,y:2)
                        
                }).buttonStyle(GradientButton())
            }
            
            //FOOTER
        }//CARD
        .frame(width:320 ,height: 570)
    }
}

#Preview {
    CardView()
}
