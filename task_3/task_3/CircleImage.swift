//
//  CircleImage.swift
//  task_3
//
//  Created by YZH on 2020/12/9.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("YLN")
            .clipShape(Circle())
            .overlay(
                Circle().stroke(Color.white, lineWidth: 10))
            .shadow(radius: 10)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
