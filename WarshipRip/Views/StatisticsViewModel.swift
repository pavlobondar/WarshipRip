//
//  StatisticsViewModel.swift
//  WarshipRip
//
//  Created by Pavlo on 06.08.2024.
//

import Foundation
import Combine

final class StatisticsViewModel: ObservableObject {
    private var cancellables: Set<AnyCancellable>
    
    @Published var statistics: GeneralStatistics
    @Published var selectedDate: Date
    @Published var isLoading: Bool = false
    
    init(statistics: GeneralStatistics = .makeDefault()) {
        self.cancellables = []
        self.statistics = statistics
        self.selectedDate = statistics.endDate
        
        fetchStatistics()
        
        $selectedDate
            .debounce(for: 0.1, scheduler: RunLoop.main)
            .map { [weak self] selectedDate in
                guard let self = self else { return false }
                return selectedDate.areDatesEqual(to: self.statistics.statisticsDate)
            }
            .filter { !$0 }
            .sink { [weak self] _ in
                self?.fetchStatistics()
            }
            .store(in: &cancellables)
    }
    
    private func fetchStatistics() {
        let date = selectedDate.toString()
        isLoading = true
        NetworkService.shared.fecthLatestStatistics(date: date)
            .receive(on: RunLoop.main)
            .sink { [weak self] completion in
                switch completion {
                case .failure(let error):
                    print("‼️ Error: \(error.localizedDescription)")
                case .finished:
                    self?.isLoading = false
                    break
                }
            } receiveValue: { [weak self] statistics in
                self?.statistics = statistics
            }
            .store(in: &cancellables)
    }
}
