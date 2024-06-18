
import Foundation
import SwiftUI


// ListView.swift
struct LocationsView: View {
    @State private var locations:[LocationModel] = []
    @State private var selectedLocal: LocationModel?
    
    var body: some View {
        NavigationStack{
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(locations) { local in
                        Button {
                            selectedLocal = local
                        } label: {
                            LocalCard(local: local)
                        }
                    }
                }
                .padding(.vertical, 5)
            }
            .navigationDestination(item: $selectedLocal, destination: { location in
                EventsPerLocal(location: location)
            })
            .navigationTitle("Início")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
            .task{
                await getLocations()
            }
            
        }
    }
    
    
    func getLocations() async{
        let url = URL(string: "\(API_BASE_URL)/locals_with_events")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("true", forHTTPHeaderField: "ngrok-skip-browser-warning")
        do {
            let (data, _) = try await URLSession.shared.data(for:request)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let decodedData = try decoder.decode([LocationModel].self, from: data)
            self.locations = decodedData
        } catch {
            print(error.localizedDescription)
        }
        
    }
}
