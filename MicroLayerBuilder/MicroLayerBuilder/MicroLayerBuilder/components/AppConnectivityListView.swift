import SwiftUI

struct AppConnectivityListView: View {
    var detectedApps: [String]
    var addLayerAction: (String) -> Void

    var body: some View {
        List(detectedApps, id: \.self) { app in
            Button(action: {
                addLayerAction(app)
            }) {
                HStack {
                    Text(app)
                        .font(.headline)
                        .foregroundColor(Color.white)
                        .padding(EdgeInsets(top: 8, leading: 15, bottom: 8, trailing: 8))
                    Spacer()
                    Image(systemName: "plus.circle.fill")
                        .foregroundColor(Color.white)
                        .padding(.trailing, 15)
                        .onHover { inside in
                            if inside {
                                NSCursor.pointingHand.set()
                            } else {
                                NSCursor.arrow.set()
                            }
                        }
                }
                .background(Color.blue.opacity(0.7))
                .cornerRadius(10)
            }
            .buttonStyle(PlainButtonStyle())
            .padding(.vertical, 5)
        }
        .frame(minHeight: 200)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(15)
    }
}
