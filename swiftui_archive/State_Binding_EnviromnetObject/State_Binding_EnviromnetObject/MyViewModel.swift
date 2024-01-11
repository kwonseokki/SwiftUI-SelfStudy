//
//  MyViewModel.swift
//  State_Binding_EnviromnetObject
//
//  Created by SeokkiKwon on 12/10/23.
//

import Foundation
import Combine

// ObservableObject -> 이벤트를 전달할 수 있다.
class MyViewModel: ObservableObject {
    @Published var appTitle: String = "빡코딩의 일상"
    
}
