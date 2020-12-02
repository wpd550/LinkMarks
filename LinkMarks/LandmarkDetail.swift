//
//  ContentView.swift
//  LinkMarks
//
//  Created by dong wu on 2020/11/30.
//

import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var userData: UserData
    var landmarK:Landmark
    
    var landmarkIndex:Int{
        userData.landmarks.firstIndex(where: { $0.id == landmarK.id})!
    }
    
    var body: some View {
        VStack{
            MapView(coordinate: landmarK.locationCoordinate).frame(height:300)
            CircleImageView(image:landmarK.image ).offset(y:-130).padding(.bottom,-130).frame(width: 100, height: 100)
            
            
            VStack(alignment:.leading){
                HStack{
                    Text(landmarK.name)
                        .font(.title)
                    Button(action: {
                        self.userData.landmarks[self.landmarkIndex].isFavorite.toggle()
                    }){
                        if self.userData.landmarks[self.landmarkIndex].isFavorite {
                            Image(systemName: "star.fill")
                                .foregroundColor(Color.yellow)
                        } else {
                            Image(systemName: "star")
                                .foregroundColor(Color.gray)
                        }
                    }
                }
                
            
                HStack{
                    Text(landmarK.park).font(.subheadline)
                    Spacer()
                    Text(landmarK.state).font(.subheadline)
                }
            }.padding()
            Spacer()
           
        }.navigationBarTitle(Text(landmarK.name),displayMode: .inline)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmarK: landmarkData[0]).environmentObject(UserData())
    }
}
