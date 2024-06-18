import SwiftUI

struct ImageURL: View {
    var url: URL
    // Variaveis para atribuir valores ao skeleton loader
    var skeletonWidth: CGFloat?
    var skeletonHeight: CGFloat?
    var body: some View {
        AsyncImage(url: url) { phase in
            if let image = phase.image {
                // Display the loaded image
                image
                    .resizable()
                    .scaledToFill()
            } else if phase.error != nil {
                // Display a placeholder when loading failed
                Image(systemName: "questionmark.diamond")
                    .imageScale(.large)
            } else {
                // Display a placeholder while loading
                SkeletonView(width: skeletonWidth ?? 0,height: skeletonHeight ?? 0)
                    .frame(maxWidth: skeletonWidth ?? .infinity)
            }
        }
    }
}
