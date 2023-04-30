//
//  NewsView.swift
//  HirraSaleemNYTimesTask
//
//  Created by Hirra on 29/04/2023.
//

import SwiftUI

struct NewsView: View {
    
    var article: Results
    var body: some View {
        
        HStack {
                Circle()
                    .frame(width: 50, height: 50, alignment: .leading)
                    .foregroundColor(.gray)
                    .padding(.horizontal , 5).padding(.leading , 5)
            
            LazyVStack(alignment: .leading, spacing: 10) {
                Text(article.byline)
                    .foregroundColor(.black)
                    .font(.system(size: 16))
                    .fontWeight(.regular)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                
                Text(article.abstract)
                    .foregroundColor(.gray)
                    .font(.system(size: 12))
                    .fontWeight(.regular).lineLimit(1)
                HStack {
                    Text(article.type)
                        .foregroundColor(.gray)
                        .font(.system(size: 12))
                        .fontWeight(.regular).lineLimit(1)
                    
                    Spacer()
                    
                    Label(article.published, systemImage: "calendar")
                        .lineLimit(1)
                        .font(.system(size: 10))
                }
                
            }.padding(.horizontal , 10)
            
        }
    }
}
