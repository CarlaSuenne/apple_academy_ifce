//
//  Teste.swift
//  BoJogar
//
//  Created by found on 02/05/24.
//

import Foundation
import SwiftUI


struct EventCardView: View {
    @State private var userEventsRepo = UserEventsRepo(userId: "1")
    
    var body: some View {
        
        VStack(spacing: 12) {
            
            ForEach(userEventsRepo.events, id: \.id) { event in // Iterate over items
                EventCard(event: event) // Render each item using ListItemView
            }
        }
        .padding()
        .task {
            await userEventsRepo.getUserEvents()
        }
        .onAppear {
            // Schedule a timer to refresh every 2.5 seconds
            let timer = Timer.scheduledTimer(withTimeInterval: 10, repeats: true) { _ in
                Task {
                    await userEventsRepo.getUserEvents()
                }
            }
            // Invalidate the timer when the view disappears
            _ = timer
        }
    }

}

struct EventCard: View {
    let event: EventCardModel
    
    var body: some View {
        HStack {
            ImageURL(url: URL(string: event.imageURL)!,
                     width: 124,
                     heigth: 124)
            
            VStack(alignment: .leading) {
                Text(event.title)
                Text(event.description)
                    .font(.caption)
                    .foregroundStyle(.gray)
                Spacer()
            }
            .padding(12)
            
            Spacer()
        }
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 2, y: 3.0)
    }
}
