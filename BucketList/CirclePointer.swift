//
//  CirclePointer.swift
//  BucketList
//
//  Created by Eric Liu on 11/24/20.
//

import SwiftUI
import MapKit

struct CirclePointer: View {
    @Binding var showingPlaceDetails: Bool
    @Binding var selectedPlace: MKPointAnnotation?
    @Binding var showingEditScreen: Bool

    var body: some View {
        Circle()
            .fill(Color.blue)
            .opacity(0.3)
            .frame(width: 16, height: 16)
            .alert(isPresented: $showingPlaceDetails) {
                Alert(
                    title: Text(selectedPlace?.title ?? "Unknown"),
                    message: Text(selectedPlace?.subtitle ?? "Missing Place Information"),
                    primaryButton: .default(Text("Ok")),
                    secondaryButton: .default(Text("Edit")) {
                    self.showingEditScreen = true
                })
            }
    }
}
//
//struct CirclePointer_Previews: PreviewProvider {
//    static var previews: some View {
//        CirclePointer()
//    }
//}
