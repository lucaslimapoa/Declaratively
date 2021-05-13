//
//  ContentView.swift
//  Declaratively-Example
//
//  Created by Lucas Lima on 13.05.21.
//

import Foundation
import Declaratively

struct ContentView: View {
    var body: Text {
        Text("This is a red text")
            .foregroundColor(.red)
            .pading()
        
//        VStack(alignment: .center) {
//            Text("This is a red text")
//                .foregroundColor(.red)
//                .pading()
//
//            Text("This is a bold text")
//                .bold()
//
//            Text("This is an italic text")
//                .italic()
//
//            Text("This is a bold and green text")
//                .foregroundColor(.green)
//                .bold()
//
//            Text(
//                """
//                Lorem ipsum dolor sit amet, consectetur adipiscing elit.
//                Vivamus vitae sapien euismod risus rhoncus feugiat feugiat nec nibh.
//                Suspendisse ac odio dui. Morbi id massa vehicula, congue mauris non, ultrices ipsum.
//                """
//            )
//            .foregroundColor(.magenta)
//            .bold()
//
//            Spacer()
//
//            HStack {
//                Text("Left text")
//                    .foregroundColor(.green)
//
//                Spacer()
//
//                Text("Right text")
//                    .foregroundColor(.yellow)
//            }
//        }
    }
}
