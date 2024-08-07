//
//  Product.swift
//  Lolibaba
//
//  Created by Ilyas Bintang Prayogi on 07/08/24.
//

import Foundation

struct Product: Identifiable {
	let id = UUID()
	let name: String
	let imageName: String
	let price: Double
	
	static let sampleProducts = [
		Product(name: "Product 1oasidfi oasodf jaso dfi asoif asoi dfo asdfoi", imageName: "product1", price: 999999),
		Product(name: "Product 2", imageName: "product2", price: 79999),
		Product(name: "Product 3", imageName: "product3", price: 19.99),
		Product(name: "Product 4", imageName: "product4", price: 99.99)
	]
}
