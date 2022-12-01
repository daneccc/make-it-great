import SwiftUI

struct ContentView: View {
    @ObservedObject var dayPlanner = DayPlanner()
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
            WeekView()
            Spacer()
        }
    }
}

struct WeekView: View {
    let week = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
    var body: some View {
        HStack {
            Spacer()
            ForEach(week, id:\.self) { date in
                Text(date)
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
