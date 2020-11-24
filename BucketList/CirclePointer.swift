//
//  CirclePointer.swift
//  BucketList
//
//  Created by Eric Liu on 11/24/20.
//

import SwiftUI

struct CirclePointer: View {
    var body: some View {
        Circle()
            .fill(Color.blue)
            .opacity(0.3)
            .frame(width: 16, height: 16)
    }
}

struct CirclePointer_Previews: PreviewProvider {
    static var previews: some View {
        CirclePointer()
    }
}
