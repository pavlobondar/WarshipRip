//
//  ContentView.swift
//  WarshipRip
//
//  Created by Pavlo on 06.08.2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct StatisticsView: View {
    @ObservedObject var viewModel = StatisticsViewModel()
    @Environment(\.openURL) var openURL
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        Text(viewModel.statistics.statisticsDate, style: .date)
                        Text(viewModel.statistics.title)
                            .foregroundStyle(Color.accentColor)
                    }
                    .font(.title2.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Button(action: {
                        openURL(viewModel.statistics.resourceURL)
                    }, label: {
                        AsyncImage(url: viewModel.statistics.milGovUaImageURL) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 50, height: 50)
                    })
                }
                .padding(.horizontal)
                
                HStack(alignment: .bottom, spacing: 16.0) {
                    WebImage(url: viewModel.statistics.units.type.image.imageURL) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } placeholder: {
                        ProgressView()
                    }
                    .transition(.fade(duration: 0.5))
                    .frame(width: 120, height: 120)
                    
                    Spacer()
                    
                    VStack(alignment: .leading) {
                        Text(viewModel.statistics.units.type.title)
                            .font(.system(size: 19))

                        VStack(alignment: .trailing) {
                            Text(viewModel.statistics.units.value)
                                .font(.system(size: 42, weight: .heavy))
                                .lineLimit(1)
                                .minimumScaleFactor(0.7)
                                .animation(.snappy, value: viewModel.statistics.units.value)
                            
                            Text(viewModel.statistics.units.increase)
                                .font(.system(size: 32, weight: .heavy))
                                .lineLimit(1)
                                .foregroundStyle(Color.accentColor)
                                .multilineTextAlignment(.trailing)
                                .animation(.snappy, value: viewModel.statistics.units.increase)

                        }
                        .contentTransition(.numericText())
                    }
                    .offset(y: -20)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.init(top: 50.0, leading: 20.0, bottom: 20.0, trailing: 20.0))
                
                VStack(alignment: .leading) {
                    Text("Оновлена")
                        .font(.title.bold())
                        .padding(.horizontal)
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHGrid(rows: [GridItem](repeating: GridItem(.flexible()), count: 1), content: {
                            ForEach(viewModel.statistics.updatedStatistics) { statistics in
                                StatsCell(statistics: statistics)
                            }
                        })
                    }
                }
                .contentMargins(.horizontal, 20)
                
                VStack(alignment: .leading) {
                    Text("Поточна")
                        .font(.title.bold())
                    LazyVGrid(
                        columns: [GridItem](repeating: GridItem(.flexible()), count: 2),
                        content: {
                            ForEach(viewModel.statistics.warStatistics) { statistics in
                                StatsCell(statistics: statistics)
                            }
                        }
                    )
                }
                .padding(.horizontal)
                
                Text("2022-2024 - Народ України.")
                    .padding(.top)
                
                Link("WEBSPARK", destination: viewModel.statistics.websparkURL!)
                Link("russianwarship", destination: viewModel.statistics.russianwarshipURL!)
            }
            .navigationTitle("Втрати свинособак")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    HStack(spacing: 20.0) {
                        if viewModel.isLoading {
                            ProgressView()
                        }
                        
                        Image(systemName: "calendar")
                            .font(.title2)
                            .overlay {
                                DatePicker(
                                    "",
                                    selection: $viewModel.selectedDate,
                                    in: viewModel.statistics.startDate...viewModel.statistics.endDate,
                                    displayedComponents: [.date]
                                )
                                .id(viewModel.selectedDate)
                                .blendMode(.destinationOver)
                            }
                    }
                }
            }
        }
    }
}

#Preview {
    StatisticsView()
}
