//
//  ProfileDataStore.swift
//  AventicaTest
//
//  Created by Кирилл Коновалов on 24.10.2021.
//

import HealthKit

class ProfileViewModel: ObservableObject {
    private let userHealthProfile = UserHealthProfile()
    
    @Published var birthday = ""
    @Published var age: String = ""
    @Published var typeBlood: String = ""
    @Published var biologicalSex: String = ""
    @Published var health: String = ""
    @Published var weight: String = ""
    
    func getAgeSexAndBloodType() throws -> (age: Int,
                                            biologicalSex: HKBiologicalSex,
                                            bloodType: HKBloodType) {
        let healthKitStore = HKHealthStore()
        
        do {
            let birthdayComponents = try healthKitStore.dateOfBirthComponents()
            let biologicalSex = try healthKitStore.biologicalSex()
            let bloodType = try healthKitStore.bloodType()
            
            let today = Date()
            let calendar = Calendar.current
            let todayDateComponents = calendar.dateComponents([.year], from: today)
            let thisYear = todayDateComponents.year!
            
            birthday = String("\(birthdayComponents.day ?? 0).\(birthdayComponents.month ?? 00).\(birthdayComponents.year ?? 0000)")
            
            let age = thisYear - birthdayComponents.year!
            
            let unwrappedBiologicalSex = biologicalSex.biologicalSex
            let unwrappedBloodType = bloodType.bloodType
            
            return (age, unwrappedBiologicalSex, unwrappedBloodType)
        }
    }
    
    func getMostRecentSample(for sampleType: HKSampleType,
                             completion: @escaping (HKQuantitySample?, Error?) -> Swift.Void) {
        let mostRecentPredicate = HKQuery.predicateForSamples(withStart: Date.distantPast,
                                                              end: Date(),
                                                              options: .strictEndDate)
        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)
        let limit = 1
        let sampleQuery = HKSampleQuery(sampleType: sampleType,
                                        predicate: mostRecentPredicate,
                                        limit: limit,
                                        sortDescriptors: [sortDescriptor]) { (query, samples, error) in
        
            DispatchQueue.main.async {
                guard let samples = samples,
                      let mostRecentSample = samples.first as? HKQuantitySample else {
                          completion(nil, error)
                          return
                      }
                completion(mostRecentSample, nil)
            }
        }
        HKHealthStore().execute(sampleQuery)
    }
    
    func loadAndDisplayAgeSexAndBloodType() {
        do {
          let userAgeSexAndBloodType = try getAgeSexAndBloodType()
          userHealthProfile.age = userAgeSexAndBloodType.age
          userHealthProfile.biologicalSex = userAgeSexAndBloodType.biologicalSex
          userHealthProfile.bloodType = userAgeSexAndBloodType.bloodType
            
            if let age = userHealthProfile.age {
                self.age = String(age)
            }

            if let biologicalSex = userHealthProfile.biologicalSex {
                self.biologicalSex = biologicalSex.stringRepresentation
            }

            if let bloodType = userHealthProfile.bloodType {
                self.typeBlood = bloodType.stringRepresentation
            }
            
        } catch let error {
            NSLog(error.localizedDescription)
        }
    }
    
    func loadHeight() {
        guard let heightSampleType = HKSampleType.quantityType(forIdentifier: .height) else { return }
            
        getMostRecentSample(for: heightSampleType) { (sample, error) in
            guard let sample = sample else { return }
            let heightInMeters = sample.quantity.doubleValue(for: HKUnit.meter())
            self.userHealthProfile.heightInMeters = heightInMeters
            if let health = self.userHealthProfile.heightInMeters {
                self.health = String(health)
            }
        }
    }
    
    func loadWeight() {
        guard let weightSampleType = HKSampleType.quantityType(forIdentifier: .bodyMass) else { return }
            
        getMostRecentSample(for: weightSampleType) { (sample, error) in
            guard let sample = sample else { return }
            let weightInKilograms = sample.quantity.doubleValue(for: HKUnit.gramUnit(with: .kilo))
            self.userHealthProfile.weightInKilograms = weightInKilograms
            if let width = self.userHealthProfile.weightInKilograms {
                self.weight = String(width)
            }
        }
    }
}
