//
//  HKBloodType.swift
//  AventicaTest
//
//  Created by Кирилл Коновалов on 24.10.2021.
//

import HealthKit

extension HKBloodType {
    var stringRepresentation: String {
        switch self {
        case .notSet:
            return "Не указан"
        case .aPositive:
            return "A+"
        case .aNegative:
            return "A-"
        case .bPositive:
            return "B+"
        case .bNegative:
            return "B-"
        case .abPositive:
            return "AB+"
        case .abNegative:
            return "AB-"
        case .oPositive:
            return "O+"
        case .oNegative:
            return "O-"
        @unknown default:
            return ""
        }
    }
}
