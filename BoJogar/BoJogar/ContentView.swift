//
//  ContentView.swift
//  BoJogar
//
//  Created by found on 07/05/24.
//

import Foundation
import SwiftUI

struct ContentView: View {
    
    var body: some View {
       
        TabView {
            Group {
                NavigationStack {
                    UserView()
                }
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                
                NavigationStack {
                    NearbyEventsView()
                }
                .tabItem {
                    Label("Eventos", systemImage: "sportscourt")
                        
                }
                PlaceLookUpView()
                    .tabItem {
                        Label("Read", systemImage: "house")
                    }
            }
            .toolbarBackground(.white, for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
        }
        .accentColor(.primaryOrange)
        
        
    }
    
}

#Preview {
    ContentView()
        .environmentObject(LocationManager())
}
