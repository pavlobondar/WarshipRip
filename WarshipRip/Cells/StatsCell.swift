//
//  StatsCell.swift
//  WarshipRip
//
//  Created by Pavlo on 07.08.2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct StatsCell: View {
    
    var statistics: WarStatistics
    
    var body: some View {
        VStack(alignment: .leading, spacing: 26.0) {
            WebImage(url: statistics.type.image.imageURL) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
            .transition(.fade(duration: 0.5))
            .frame(width: 90, height: 50)
            
            VStack(alignment: .leading, spacing: 6.0) {
                Text(statistics.type.title)
                    .foregroundStyle(.gray)
                
                HStack(alignment: .top) {
                    Text(statistics.value)
                        .font(.system(size: 24, weight: .heavy))
                        .contentTransition(.numericText())
                        .lineLimit(2)
                    Text(statistics.increase)
                        .fontWeight(.bold)
                        .foregroundStyle(Color.accentColor)
                        .lineLimit(1)
                }
            }
            .minimumScaleFactor(0.8)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 18.0)
                .fill(Color.cardColor)
        )
    }
}
