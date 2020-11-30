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
            Text("Turtle Rock")
                .fontWeight(.black)
                .font(.title)
                .foregroundColor(Color.green)
            HStack{
                Text("jello")
                Spacer()
                Text("hhh ")
            }
        }.padding()
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
