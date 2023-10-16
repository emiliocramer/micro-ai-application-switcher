import SwiftUI

struct AppConnectivityListView: View {
    var detectedApps: [AppDetails]
    var addLayerAction: (String) -> Void
    
    let columns: [GridItem] = Array(repeating: .init(.adaptive(minimum: 150, maximum: 150), spacing: 10), count: 1)

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(detectedApps, id: \.name) { app in
                    Button(action: {
                        addLayerAction(app.name)
                    }) {
                        VStack {
                            Image(nsImage: app.icon ?? NSImage())
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 50)
                            Text(app.name)
                                .font(.headline)
                                .foregroundColor(Color.white)
                                .padding(.top, 5)
                        }
                        .padding()
                        .background(Color.blue.opacity(0.7))
                        .cornerRadius(15)
                        .onHover { inside in
                            if inside {
                                NSCursor.pointingHand.set()
                            } else {
                                NSCursor.arrow.set()
                            }
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .padding(10)
            .background(Color.gray.opacity(0.1))
            .cornerRadius(15)
        }
        .frame(minHeight: 200)
        .cornerRadius(15)

    }
}
