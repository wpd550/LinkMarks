//
//  UserData.swift
//  LinkMarks
//
//  Created by dong wu on 2020/12/2.
//

import Combine
import SwiftUI

final class UserData: ObservableObject{
    @Published var showFavoritesOnly = false
    @Published var landmarks = landmarkData
}
