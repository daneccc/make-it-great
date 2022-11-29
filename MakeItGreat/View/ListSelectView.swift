import SwiftUI

struct ListSelectView: View {
    @State var listSelectViewModel = ListSelectViewModel()

    @State var flag: Bool = false

    var body: some View {
        NavigationStack {
            List {
                ForEach(listSelectViewModel.listItems, id: \.id) { item in
                    Button {
                        item.completion.toggle()
                        flag.toggle()
                    } label: {
                        HStack {
                            Image(systemName: item.completion ? "sparkles" : "")
                            Text("\(item.activity)")
                        }
                    }
                }
            }
            .onChange(of: flag, perform: { _ in
                //
            })
            .navigationTitle("Activities")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
