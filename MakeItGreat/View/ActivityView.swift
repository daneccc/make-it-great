import SwiftUI

struct ActivityView: View {
    var body: some View {
        NavigationStack {
            NavigationLink {
                AudioView(audioViewModel: AudioViewModel(audios: [Audio(id: UUID(), name: "CHIRPS_2", type: "WAV")]))
            } label: {
                Text("First Option")
                    .bold()
            }
            .padding()
            NavigationLink {
                AudioView(audioViewModel: AudioViewModel(audios: [Audio(id: UUID(), name: "CHIRPS_2", type: "WAV")]))
            } label: {
                Text("Second Option")
                    .bold()
            }
        }
    }
}
