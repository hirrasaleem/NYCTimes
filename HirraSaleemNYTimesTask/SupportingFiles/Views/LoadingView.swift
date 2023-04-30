//
//  LoadingView.swift
//  HirraSaleemNYTimesTask
//
//  Created by Apple on 29/04/2023.
//

import Foundation
import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: Color("AccentColor")))
            .scaleEffect(3)
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
