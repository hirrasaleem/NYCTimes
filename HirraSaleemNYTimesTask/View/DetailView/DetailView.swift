//
//  DetailView.swift
//  HirraSaleemNYTimesTask
//
//  Created by Apple on 29/04/2023.
//

import SwiftUI

struct DetailView: View {

    // MARK: - Properties
    @Environment(\.openURL) var openURL

    var article: Results

    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            HStack(alignment: .center) {
                Text(article.section )
                    .bold()
                    .underline(true, color: Color("UnderlineColor"))

                if let subsection = article.subsection,
                   !subsection.isEmpty {
                    Image(systemName: "arrow.right")
                    Text(subsection)
                        .bold()
                        .underline(true, color: .red)
                }

                Spacer()
                Text(article.published )
            }
            .padding(.top)
            .foregroundColor(Color("AccentColor"))

            KeywordsListView(keywords: article.keywordsList)

            Text(article.title )
                .font(.title)
                .fontWeight(.medium)

            Text(article.abstract )
                .font(.body)

            HStack(alignment: .center) {
                Text(article.byline )
                    .foregroundColor(.secondary)
                Spacer()
                Button(action: openFullArticle) {
                    Text("Full article")
                }
            }

            MediaView(media: article.media )

            Spacer()
        }
        .navigationBarTitle("Back", displayMode: .inline)
        .padding(.horizontal)
    }

    // MARK: - Custom methods
    func openFullArticle() {
        guard let url = article.url else { return }
        openURL(url)
    }
}

// MARK: - Preview
struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(article: Results.exampleData.first!)
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}
