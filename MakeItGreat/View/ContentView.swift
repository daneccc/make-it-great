import SwiftUI

struct ContentView: View {
    @StateObject var dayPlanner = DayPlanner()
    var body: some View {
        let currentDate = Date()
        VStack {
            HStack {
                Text(dayPlanner.currentDate.monthYYYY())
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
                HStack {
                    Image(systemName: "calendar")
                    Image(systemName: "tray.fill")
                    Image(systemName: "gear")
                }
                .font(.title)
            }
            .padding()
            let mondayOfTheCurrentDate = dayPlanner.startDayOfWeek(from: dayPlanner.currentDate)
            SwipeableStack(dayPlanner.startDateOfWeeksInAYear(), jumpTo: mondayOfTheCurrentDate) { (date, pos) in
                WeekView(of: date, viewPosition: pos)
            }
            .frame(maxHeight: 100)
            SwipeableStack([1, 2, 3], jumpTo: 2) { (_, _) in
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.yellow)
                    .ignoresSafeArea()
            }
        }
        .environmentObject(dayPlanner)
    }
}

// generic types
struct SwipeableStack<WhateverTypeOfData: Hashable, Content>: View where Content: View {
    var whateverData: [WhateverTypeOfData] = []
    let content: (WhateverTypeOfData, ViewPosition) -> Content
    var jumpTo: WhateverTypeOfData?
    init(_ data: [WhateverTypeOfData], jumpTo: WhateverTypeOfData? = nil, @ViewBuilder content: @escaping (WhateverTypeOfData, ViewPosition) -> Content) {
        self.whateverData = data
        self.content = content
        if let jumpTo {
            self.jumpTo = jumpTo
        }
    }
    @State private var dataIndex = 0
    @State private var dragged = CGSize.zero
    var previousExist: Bool {
        return (dataIndex-1) >= 0
    }
    var nextExist: Bool {
        return dataIndex < whateverData.count - 1
    }
    var body: some View {
        GeometryReader { geo in
            let frameWidth = geo.size.width

            HStack(spacing: 0) {
                if previousExist {
                    content(whateverData[dataIndex - 1], .previousView) // previous
                        .frame(width: geo.size.width)
//                        .background(.green)
                        .offset(x: previousExist ? -frameWidth : 0)
                }
                content(whateverData[dataIndex], .centerView) // current
                    .frame(width: geo.size.width)
//                    .background(.yellow)
                    .offset(x: previousExist ? -frameWidth : 0)
                if nextExist {
                    content(whateverData[dataIndex + 1], .nextView) // next
                        .frame(width: geo.size.width)
//                        .background(.red)
                        .offset(x: previousExist ? -frameWidth : 0)
                }
            }
            .onAppear {
                if let jumpTo {
                    if let pos = whateverData.firstIndex(of: jumpTo) {
                        dataIndex = pos
                    }
                }
            }
            .offset(x: dragged.width)
            .gesture(DragGesture()
                .onChanged { value in
                    dragged.width = value.translation.width
                }
                .onEnded { value in
                    var indexOffset = 0
                    withAnimation(.easeInOut(duration: 0.3)) {
                        dragged = CGSize.zero
                        if value.predictedEndTranslation.width < -frameWidth/2 && nextExist {
                            dragged.width = -frameWidth
                            indexOffset = 1 // next
                        }
                        if value.predictedEndTranslation.width > frameWidth/2 && previousExist {
                            dragged.width = frameWidth
                            indexOffset = -1 // previous
                        }
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        dataIndex += indexOffset
                        dragged = CGSize.zero
                    }
                }
            )
        }
    }
}

enum ViewPosition {
    case centerView
    case previousView
    case nextView
}

struct WeekView: View {
    @EnvironmentObject var dayplanner: DayPlanner
    let date: Date
    let week = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    var viewPosition = ViewPosition.centerView
    init(of date: Date, viewPosition: ViewPosition) {
        self.date = date
        self.viewPosition = viewPosition
    }
    var body: some View {
        let datesInAWeek = dayplanner.datesInAWeek(from: date)
        HStack {
            Spacer()
            ForEach(datesInAWeek.indices, id:\.self) { date in
                let dateWeek = datesInAWeek[date]
                VStack {
                    Text(week[date])
                        .padding(.bottom, 5)
                    Text(dateWeek.dayNum())
                        .fontWeight(.bold)
                        .foregroundColor(dayplanner.isCurrent(dateWeek) ? Color.white : Color.black)
                        .background(
                            ZStack{
                                if dayplanner.isCurrent(dateWeek) {
                                    Circle()
                                        .fill(.blue)
                                        .frame(width: 40, height: 40)
                                        
                                }
                            })
                }
                .onTapGesture {
                    dayplanner.setCurrentDate(to: dateWeek)
                }
                Spacer()
            }
        }
        .onChange(of: date) { dateAux in
            if viewPosition == .centerView {
                dayplanner.setCurrentDate(to: dateAux)
            }
            // print("change of date in \(dateAux) \(viewPosition)")
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CreateButton: View {
    @State private var isPresented = true
    var body: some View {
        Button(action: {
            self.isPresented.toggle()
        }) {
            ZStack {
                Circle()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.green)
                Image(systemName: "plus")
                    .imageScale(.large)
                    .foregroundColor(.white)
            }
        }
        .padding()
        .sheet(isPresented: $isPresented) {
            CreateView()
        }
    }
}
