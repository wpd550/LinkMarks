//
//  SwiftUIView.swift
//  LinkMarks
//
//  Created by dong wu on 2020/11/30.
//

import SwiftUI

struct CircleImageView: View {
    var image:Image
    
    var body: some View {
        image.clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 10)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        CircleImageView(image:Image("fengjing"))
    }
}
