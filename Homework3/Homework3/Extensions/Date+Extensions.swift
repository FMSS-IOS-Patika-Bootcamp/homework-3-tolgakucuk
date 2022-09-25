//
//  Date+Extensions.swift
//  Homework3
//
//  Created by Tolga on 25.09.2022.
//

import Foundation

extension Date {
    func toString(format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
