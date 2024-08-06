//
//  CurrencyUtils.swift
//  Lolibaba
//
//  Created by Ilyas Bintang Prayogi on 06/08/24.
//

import Foundation

enum CurrencyUtils {
	static func formatToRupiah(from value: Any) -> String {
		let number: Double?
		
		if let intValue = value as? Int {
			number = Double(intValue)
		} else if let doubleValue = value as? Double {
			number = doubleValue
		} else if let stringValue = value as? String {
			number = Double(stringValue)
		} else {
			return ""
		}
		
		guard let validNumber = number else {
			return ""
		}
		
		let formatter = NumberFormatter()
		formatter.numberStyle = .currency
		formatter.locale = Locale(identifier: "id_ID")
		formatter.currencySymbol = "Rp"
		formatter.maximumFractionDigits = 0
		
		if let formattedString = formatter.string(from: NSNumber(value: validNumber)) {
			return formattedString
		} else {
			return ""
		}
	}
}
