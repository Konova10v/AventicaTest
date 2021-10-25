//
//  HKBiologicalSex.swift
//  AventicaTest
//
//  Created by Кирилл Коновалов on 24.10.2021.
//

import HealthKit

extension HKBiologicalSex {
    var stringRepresentation: String {
        switch self {
        case .notSet:
            return "Не указан"
        case .female:
            return "Женский"
        case .male:
            return "Мужской"
        case .other:
            return "Другой"
        @unknown default:
            return ""
        }
    }
}
