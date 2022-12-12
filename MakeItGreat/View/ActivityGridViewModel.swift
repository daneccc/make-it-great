import Foundation

class ActivityGridViewModel: ObservableObject {
    @Published var activities: [ActivityGridModel]
    init() {
        self.activities = [
            ActivityGridModel(name: "Escovar os Dentes", category: "Higiene",
                              doingAt: "manhã", startHour: "", finishHour: ""),
            ActivityGridModel(name: "Escovar os Dentes", category: "Higiene",
                              doingAt: "tarde", startHour: "", finishHour: ""),
            ActivityGridModel(name: "Escovar os Dentes", category: "Higiene",
                              doingAt: "noite", startHour: "", finishHour: ""),
            ActivityGridModel(name: "Tomar Banho", category: "Higiene",
                              doingAt: "manhã", startHour: "", finishHour: ""),
            ActivityGridModel(name: "Tomar Banho", category: "Higiene",
                              doingAt: "noite", startHour: "", finishHour: ""),
            ActivityGridModel(name: "Arrumar a Cama", category: "Organização",
                              doingAt: "manhã", startHour: "", finishHour: ""),
            ActivityGridModel(name: "Ajudar nas Tarefas", category: "Organização",
                              doingAt: "tarde", startHour: "", finishHour: ""),
            ActivityGridModel(name: "Lição de Casa", category: "Organização",
                              doingAt: "noite", startHour: "", finishHour: ""),
            ActivityGridModel(name: "Almoçar", category: "Alimentação",
                              doingAt: "tarde", startHour: "", finishHour: ""),
            ActivityGridModel(name: "Jantar", category: "Alimentação",
                              doingAt: "noite", startHour: "", finishHour: ""),
            ActivityGridModel(name: "Café da Manhã", category: "Alimentação",
                              doingAt: "manhã", startHour: "", finishHour: ""),
            ActivityGridModel(name: "Lanchar", category: "Alimentação",
                              doingAt: "tarde", startHour: "", finishHour: ""),
            ActivityGridModel(name: "Brincar", category: "Diversão",
                              doingAt: "manhã", startHour: "", finishHour: ""),
            ActivityGridModel(name: "Brincar", category: "Diversão",
                              doingAt: "noite", startHour: "", finishHour: ""),
            ActivityGridModel(name: "Jogar", category: "Diversão",
                              doingAt: "tarde", startHour: "", finishHour: ""),
            ActivityGridModel(name: "Estudar", category: "Aprendizado",
                              doingAt: "noite", startHour: "", finishHour: ""),
            ActivityGridModel(name: "Aprender Algo Novo", category: "Aprendizado",
                              doingAt: "manhã", startHour: "", finishHour: ""),
            ActivityGridModel(name: "Ler", category: "Aprendizado",
                              doingAt: "tarde", startHour: "", finishHour: "")
        ]
    }
}
