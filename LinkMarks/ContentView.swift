//
//  ContentView.swift
//  LinkMarks
//
//  Created by dong wu on 2020/11/30.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack{
            MapView().frame(height:300)
            CircleImageView(image: Image("fengjing")).offset(y:-130).padding(.bottom,-130).frame(width: 100, height: 100)
            VStack{
                Text("Turtle Rock")
                    .font(.title)
                HStack{
                    Text("jello").font(.subheadline)
                    Spacer()
                    Text("hhh ").font(.subheadline)
                }
            }
           
        }.padding()
        Spacer()
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
