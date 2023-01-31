//
//  CountryDetailView.swift
//  Flag
//
//  Created by 홍길동 on 2023/01/31.
//

import SwiftUI

struct CountryDetailView: View {
    let country : Country //소문자 : 변수 , 대문자 : 타입
    var body: some View {
        List {
            Image(country.file)
                .resizable()
                .frame(width: 200,height: 200)
            Text(country.name)
            Text("\(country.name.count) million people")
            Text("안녕하세요")
        }
        .navigationTitle(country.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CountryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView { //예시 추가
            CountryDetailView(country: Region.all[1].countries[6])
        }
        NavigationView {
            CountryDetailView(country: Region.all[0].countries[6])
        }
    }
}
