import SwiftUI
import AVFoundation
import Lottie

struct AudioView: View {

    @State var isPlaying: Bool = true
    @State var isAnimated: Bool = true
    var audioViewModel: AudioViewModel
//    var animation: LottieView = LottieView(name: "star")

    var body: some View {

        VStack {
            Button {
                isAnimated.toggle()
            } label: {
                ZStack {
                    Text("CLICK ME")
                    LottieView()
                        .frame(width: 350, height: 350, alignment: .center)
                        .opacity(isAnimated ? 0 : 1)
                }
            }
            .animation(.easeInOut, value: 1)
        }
        .navigationTitle("Audio Scene")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    audioViewModel.playSound()
                    isPlaying.toggle()
                } label: {
                    isPlaying ? Image(systemName: "pause") : Image(systemName: "play")
                }
            }
        }
        .onAppear {
            audioViewModel.playSound()
        }
        .onDisappear {
            audioViewModel.player?.stop()
        }
    }
}
