//
//  KeysView.swift
//  Notifications
//
//  Created by azusa on 2021/11/4.
//

import SwiftUI

struct KeysView: View {
    @State var keys: [APIKey] = [
        .init(value: "892173".md5),
        .init(value: "12389".md5),
        .init(value: "439058".md5),
        .init(value: "12738".md5),
    ]
    
    var body: some View {
        Form {
            Section {
                ForEach(keys) { key in
                    NavigationLink {
                        
                    } label: {
                        Text(key.value)
                    }
                }
            } header: {
                
            }
        }.navigationTitle("Keys")
    }
}

struct KeysView_Previews: PreviewProvider {
    static var previews: some View {
        KeysView()
    }
}
