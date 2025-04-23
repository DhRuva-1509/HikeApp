//
//  SettingsView.swift
//  Hike
//
//  Created by Dhruva Patil on 2025-01-01.
//

import SwiftUI

struct SettingsView: View {
    private let alternateAppIcons : [String] = [
         "AppIcon-MagnifyingGlass",
         "AppIcon-Map",
         "AppIcon-Mushroom",
         "AppIcon-Camera",
         "AppIcon-Backpack",
         "AppIcon-Campfire "
    ]
    var body: some View {
        List{
            //           MARK - SECTION HEADER
            Section{
                HStack {
                    Spacer()
                    Image(systemName: "laurel.leading")
                        .font(.system(size:80 ,weight: .black))
                    
                    VStack (spacing:-10){
                        Text("HIKE")
                            .font(.system(size: 66 , weight: .black))
                        Text("Editors' Choice")
                            .fontWeight(.medium)
                    }
                    Image(systemName:"laurel.trailing")
                        .font(.system(size: 80 , weight: .black))
                    Spacer()
                }
                .foregroundStyle(
                    LinearGradient(colors: [.customGreenLight , .customGreenMedium,.customGreenDark], startPoint: .top, endPoint: .bottom )
                )
                .padding(.top , 8)
                
                VStack(spacing: 8) {
                    Text("Where can you find \nperfect hikes?")
                        .font(.title2)
                        .fontWeight(.heavy)
                    
                    
                    Text("The hike which looks gorgeous in photos but it is even better once you are actually there. The hike that you hope to do again someday. \n Find the best hikes in the app.")
                        .font(.footnote)
                        .italic()
                    
                    Text("Dust off the boots! It's time for a walk.")
                        .fontWeight(.heavy)
                        .foregroundColor(.customGreenMedium)
                }
                .multilineTextAlignment(.center)
                .padding(.bottom , 16)
                .frame(width:.infinity)
            }.listRowSeparator(.hidden)
                //          MARK - SECTION ICONS
            Section(header: Text("Alternate Icons")){
                
                ScrollView(.horizontal , showsIndicators: false){
                    HStack(spacing:12){
                        ForEach(alternateAppIcons.indices , id:\.self) { item in
                            Button{
                                Text("Button was pressed")
                                UIApplication.shared.setAlternateIconName (alternateAppIcons[item]){
                                    error in
                                    if error != nil {
                                        print("Failed to update app icon: \(String(describing: error?.localizedDescription))")
                                    }
                                    else{
                                        print("Success! You have changed the app icon")
                                    }
                                }
                            }
                            label:{
                                Image("\(alternateAppIcons[item])-Preview")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80,height: 80)
                                    .cornerRadius(16)
                            }.buttonStyle(.borderless)
                        }
                    }
                }.padding(.top,12)
                
              Text("Choose your favorite icons from the list above. ")
                    .frame(minWidth : 0, maxWidth : .infinity)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .font(.footnote)
                    .padding(.bottom , 12)
            }.listRowSeparator(.hidden)
            
                //          MARK - SECTION ABOUT
            
            Section(
                header : Text("About the App"),
                footer: HStack{
                    Spacer()
                    Text("Copyright © All rights reserved")
                    Spacer()
                        
                }.padding(.vertical ,8)
                )
            {
                
                CustomListRowView(rowLabel: "Application", rowIcon: "apps.iphone", rowContent: "Hike", rowTintColor: .blue)
                
                CustomListRowView(rowLabel: "Compatibility", rowIcon: "info.circle", rowContent: "iOS,iPadOS ", rowTintColor: .red )
                
                CustomListRowView(rowLabel: "Technology", rowIcon: "swift", rowContent: "Swift", rowTintColor: .orange)
                
                CustomListRowView(rowLabel: "Version", rowIcon: "gear", rowContent: "1.0", rowTintColor: .purple)
                
                CustomListRowView(rowLabel: "Designer", rowIcon: "paintpalette", rowContent: "Radha", rowTintColor: .pink)
                
                CustomListRowView(rowLabel: "Developer", rowIcon: "ellipsis.curlybraces", rowContent: "Dhruva", rowTintColor: .green)
                
                CustomListRowView(rowLabel: "Website", rowIcon: "globe", rowTintColor: .indigo, rowLinkLabel: "Radha-Dhruva", rowLinkDestination :"https://credo.academy" )
                
                //1. Basic Labled Content
//                LabeledContent("Application" , value: "Hike ")
                
                //2. Custom Labled Content
                
//                LabeledContent{
//                    Text("Hike")
//                        .foregroundColor(.primary)
//                        .fontWeight(.heavy )
//                }
//                label:{
//                    HStack{
//                        ZStack{
//                            RoundedRectangle(cornerRadius: 8)
//                                .frame(width: 30 ,height: 30)
//                                .foregroundColor(.blue)
//                            
//                            Image(systemName : "apps.iphone")
//                                .foregroundColor(.white)
//                                .fontWeight(.heavy )
//                        }
//                        Text("Application")
//                    }
//                }
            }
            
           
            } // :LIST
       
    }
}

#Preview {
    SettingsView()
}
