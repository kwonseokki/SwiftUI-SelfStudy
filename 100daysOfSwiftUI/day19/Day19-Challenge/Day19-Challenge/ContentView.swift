//
//  ContentView.swift
//  Day19-Challenge
//
//  Created by SeokKi Kwon on 2024/01/20.
//

import SwiftUI

/**
 변환 처리앱 구현
 기능
 - 사용자는 입력 단위와 출력 단위를 선택
 - 값을 입력하고 변환 출력을 확인
 
 단위선택
 미터, 킬로미터, 피트, 야드
 
 미터, 킬로미터, 피트, 야드의 단위를 입력
 출력할 옵션을 segmentControll 구현
 반환된 결과를 보여주는 텍스트 보기
 
 소스 장치 미터 선택
 출력 장치 피트 선택
 텍스트 입력
 */

struct ContentView: View {
    let units = ["m", "km", "feet", "yard"]
    @State private var value = 0.0
    @State private var sourceUnit = "m"
    @State private var targetUnit = "km"
    
    var translatedUnit: Double {
        switch (sourceUnit, targetUnit) {
        case ("m", "km"):
            return translateUnit(source: .meters, target: .kilometers)
        case ("m", "feat"):
            return translateUnit(source: .meters, target: .feet)
        case ("m", "yard"):
            return translateUnit(source: .meters, target: .yards)
        case ("km", "m"):
            return translateUnit(source: .kilometers, target: .meters)
        case ("km", "feat"):
            return translateUnit(source: .kilometers, target: .feet)
        case ("km", "yard"):
            return translateUnit(source: .kilometers, target: .yards)
        case ("feet", "m"):
            return translateUnit(source: .feet, target: .meters)
        case ("feet", "km"):
            return translateUnit(source: .feet, target: .kilometers)
        case ("feet", "yard"):
            return translateUnit(source: .feet, target: .yards)
        case ("yard", "m"):
            return translateUnit(source: .yards, target: .meters)
        case ("yard", "km"):
            return translateUnit(source: .yards, target: .kilometers)
        case ("yard", "feet"):
            return translateUnit(source: .yards, target: .feet)
        default:
            return value
        }
    }
    
    var body: some View {
        List {
            Section {
                TextField("input unit will translate target unit", value: $value, formatter: NumberFormatter())
                    .keyboardType(.decimalPad)
            } header: {
                Text("INPUT VALUE")
            }
            
            Section {
                Picker("source units", selection: $sourceUnit) {
                    ForEach(units, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
            } header: {
                Text("SOURE UNIT")
            }
            
            Section {
                Picker("source units", selection: $targetUnit) {
                    ForEach(units, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
            } header: {
                Text("TARGET UNIT")
            }
            
            Section {
                VStack {
                    HStack {
                        Spacer()
                        Text(sourceUnit)
                            .font(.title)
                        Image(systemName: "arrowshape.right")
                        Text(targetUnit)
                            .font(.title)
                        Spacer()
                    }
                    Text("\(translatedUnit.formatted(.number)) \(targetUnit)")
                        .font(.system(size: 32, weight: .bold))
                }
            }
        }
    }
    
    func translateUnit(source: UnitLength, target: UnitLength) -> Double {
        return Measurement(value: value, unit: source).converted(to: target).value
    }
}

#Preview {
    ContentView()
}
