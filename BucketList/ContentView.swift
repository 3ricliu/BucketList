//
//  ContentView.swift
//  BucketList
//
//  Created by Eric Liu on 11/19/20.
//

import SwiftUI
import LocalAuthentication
import MapKit

struct ContentView: View {
    @State private var centerCoordinate = CLLocationCoordinate2D()
    @State private var locations = [MKPointAnnotation]()
    @State private var selectedPlace: MKPointAnnotation?
    @State private var showingPlaceDetails = false

    var body: some View {
        ZStack {
            MapView(centerCoordinate: $centerCoordinate, selectedPlace: $selectedPlace, showingPlaceDetails: $showingPlaceDetails, annotations: locations)
                .edgesIgnoringSafeArea(.all)
            Circle()
                .fill(Color.blue)
                .opacity(0.3)
                .frame(width: 32, height: 32)
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        let newLocation = MKPointAnnotation()
                        newLocation.coordinate = self.centerCoordinate
                        newLocation.title = "Example Title"
                        self.locations.append(newLocation)
                    }) {
                        Image(systemName: "plus") // SF symbols
                    }
                    .padding()
                    .background(Color.black.opacity(0.75))
                    .foregroundColor(.white)
                    .font(.title)
                    .clipShape(Circle())
                    .padding(.trailing)
                }
            }
        }
        .alert(isPresented: $showingPlaceDetails) {
            Alert(
                title: Text(selectedPlace?.title ?? "Unknown"),
                message: Text(selectedPlace?.subtitle ?? "Missing Place Information"),
                primaryButton: .default(Text("Ok")),
                secondaryButton: .default(Text("Edit")) {
                // edit this place
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
