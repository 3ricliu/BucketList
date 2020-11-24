//
//  AddAnnotationButton.swift
//  BucketList
//
//  Created by Eric Liu on 11/24/20.
//

import SwiftUI
import MapKit

struct AddAnnotationButton: View {
    @Binding var centerCoordinate: CLLocationCoordinate2D
    @Binding var locations: [CodableMKPointAnnotation]
    @Binding var selectedPlace: MKPointAnnotation?
    @Binding var showingEditScreen: Bool

    var body: some View {
        Button(action: {
            let newLocation = CodableMKPointAnnotation()
            newLocation.coordinate = self.centerCoordinate
            newLocation.title = "Example Title"
            self.locations.append(newLocation)
            self.selectedPlace = newLocation
            self.showingEditScreen = true
        }) {
            Image(systemName: "plus") // SF symbols
                .padding()
                .background(Color.black.opacity(0.75))
                .foregroundColor(.white)
                .font(.title)
                .clipShape(Circle())
                .padding(.trailing)
        }
    }
}
//
//struct AddAnnotationButton_Previews: PreviewProvider {
//    static var previews: some View {
//        AddAnnotationButton()
//    }
//}
