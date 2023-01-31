//
//  ContentView.swift
//  Flag
//
//  Created by 홍길동 on 2023/01/31.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List {
            ForEach(Region.all, id: \.title) { region in
                Section(region.title) {
                    ForEach(region.countries, id: \.name) { country in
                        CountryView(country: country) //생성자 넘겨주기
                    }
                }
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}

struct CountryView: View { //command + click , ExtractedView , rename
    let country : Country
    
    var body: some View {
        HStack {
            Image(country.file)
                .resizable()
                .frame(width: 60,height: 60)
            VStack {
                Text(country.name)
                    .font(.title)
                    .frame(maxWidth: .infinity,alignment: .leading)
                Text("\(country.name.count) million people")
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .foregroundColor(.gray)
                    .shadow(radius: 9)
            }
        }
    }
}
