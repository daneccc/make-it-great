import Foundation

class ActivityGridViewModel: ObservableObject {
    @Published var activities: [ActivityGridModel]
    init() {
        self.activities = [
            ActivityGridModel(name: "Escovar os Dentes", category: "Higiene",
                              doingAt: "manhã", illustration: "", startHour: "", finishHour: ""),
            ActivityGridModel(name: "Escovar os Dentes", category: "Higiene",
                              doingAt: "tarde", illustration: "", startHour: "", finishHour: ""),
            ActivityGridModel(name: "Escovar os Dentes", category: "Higiene",
                              doingAt: "noite", illustration: "", startHour: "", finishHour: ""),
            ActivityGridModel(name: "Tomar Banho", category: "Higiene",
                              doingAt: "manhã", illustration: "", startHour: "", finishHour: ""),
            ActivityGridModel(name: "Tomar Banho", category: "Higiene",
                              doingAt: "noite", illustration: "", startHour: "", finishHour: ""),
            ActivityGridModel(name: "Arrumar a Cama", category: "Organização",
                              doingAt: "manhã", illustration: "", startHour: "", finishHour: ""),
            ActivityGridModel(name: "Almoçar", category: "Alimentação",
                              doingAt: "tarde", illustration: "", startHour: "", finishHour: ""),
            ActivityGridModel(name: "Jantar", category: "Alimentação",
                              doingAt: "noite", illustration: "", startHour: "", finishHour: ""),
            ActivityGridModel(name: "Café da Manhã", category: "Alimentação",
                              doingAt: "manhã", illustration: "", startHour: "", finishHour: ""),
            ActivityGridModel(name: "Lanchar", category: "Alimentação",
                              doingAt: "tarde", illustration: "", startHour: "", finishHour: ""),
            ActivityGridModel(name: "Brincar", category: "Diversão",
                              doingAt: "manhã", illustration: "", startHour: "", finishHour: ""),
            ActivityGridModel(name: "Brincar", category: "Diversão",
                              doingAt: "noite", illustration: "", startHour: "", finishHour: ""),
            ActivityGridModel(name: "Estudar", category: "Aprendizado",
                              doingAt: "noite", illustration: "", startHour: "", finishHour: ""),
        ]
    }
}
