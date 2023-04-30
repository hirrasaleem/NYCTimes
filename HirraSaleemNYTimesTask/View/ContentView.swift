//
//  ContentView.swift
//  HirraSaleemNYTimesTask
//
//  Created by Hirra on 29/04/2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = ViewModel()
    @State private var isLoading = false
    @State private var isActive = false
    
    var body: some View {
            ZStack {
                VStack(alignment: .leading, spacing: 20) {
                    HeaderView()
                        .padding(.horizontal , 0)
                        .padding(.vertical , 0)
                    
                    List(viewModel.results, id: \.self) { newsItem in
                        NavigationLink(
                            destination: DetailView(article: newsItem),
                            label: {NewsView(article: newsItem)})
                    }.listStyle(.plain)
                }
                
            
            if viewModel.loading == false {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .black))
                    .scaleEffect(3)
            }
        }.onAppear{startNetWorkCall()}
            .ignoresSafeArea( edges: .all)
        
    }
    
    func startNetWorkCall() {
        isLoading = false
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            isLoading = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ActivityIndicatorView: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.1))
            ProgressView {
                Text("Loading...")
                    .font(.title2)
            }
        }.frame(width: 120, height: 120, alignment: .center)
            .background(RoundedRectangle(cornerRadius: 25).stroke(.gray,lineWidth: 2))
        
    }
}
