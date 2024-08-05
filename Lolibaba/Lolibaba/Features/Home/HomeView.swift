//
//  HomeView.swift
//  Lolibaba
//
//  Created by Ilyas Bintang Prayogi on 02/08/24.
//

import SwiftUI

struct HomeView: View {
	@State private var bannerIndex = 0
	private let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
	private let images: [Image] = [
		Image(.bannerKemerdekaan),
		Image(.bannerSepatu),
		Image(.bannerFashion),
		Image(.bannerLiburan),
		Image(.bannerElektronik),
		Image(.bannerSandal)
	]
	
	var body: some View {
		NavigationView {
			ScrollView {
				VStack(alignment: .leading, spacing: 20) {
					TabView(selection: $bannerIndex) {
						ForEach(0 ..< images.count, id: \.self) { index in
							images[index]
								.resizable()
								.scaledToFill()
								.tag(index)
						}
					}
					.frame(height: 200)
					.tabViewStyle(.page)
					.onReceive(timer) { _ in
						if (bannerIndex + 1) % images.count == 0 {
							bannerIndex = (bannerIndex + 1) % images.count
						}
						else {
							withAnimation {
								bannerIndex = (bannerIndex + 1) % images.count
							}
						}
					}
					
					// Kategori Produk
					Text("Categories")
						.font(.title2)
						.fontWeight(.bold)
						.padding(.horizontal)
					
					ScrollView(.horizontal, showsIndicators: false) {
						HStack(spacing: 15) {
							CategoryView(imageName: "category1", categoryName: "Clothing")
							CategoryView(imageName: "category2", categoryName: "Electronics")
							CategoryView(imageName: "category3", categoryName: "Accessories")
						}
						.padding(.horizontal)
					}
					
					// Produk Unggulan
					Text("Featured Products")
						.font(.title2)
						.fontWeight(.bold)
						.padding(.horizontal)
					
					LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
						ForEach(Product.sampleProducts) { product in
							NavigationLink(destination: ProductDetailView(product: product)) {
								ProductCardView(product: product)
							}
						}
					}
					.padding(.horizontal)
				}
				.padding(.vertical)
			}
		}
	}
}

struct CategoryView: View {
	let imageName: String
	let categoryName: String
	
	var body: some View {
		VStack {
			Image(imageName)
				.resizable()
				.scaledToFit()
				.frame(width: 100, height: 100)
				.cornerRadius(10)
			Text(categoryName)
				.font(.caption)
		}
		.frame(width: 100)
	}
}

struct ProductCardView: View {
	let product: Product
	
	var body: some View {
		VStack(alignment: .leading) {
			Image(product.imageName)
				.resizable()
				.scaledToFit()
				.frame(height: 150)
				.cornerRadius(10)
			Text(product.name)
				.font(.headline)
			Text("$\(product.price, specifier: "%.2f")")
				.font(.subheadline)
				.foregroundColor(.secondary)
		}
		.padding()
		.background(Color.white)
		.cornerRadius(10)
		.shadow(radius: 5)
	}
}

// Model Data untuk Produk
struct Product: Identifiable {
	let id = UUID()
	let name: String
	let imageName: String
	let price: Double
	
	static let sampleProducts = [
		Product(name: "Product 1", imageName: "product1", price: 29.99),
		Product(name: "Product 2", imageName: "product2", price: 49.99),
		Product(name: "Product 3", imageName: "product3", price: 19.99),
		Product(name: "Product 4", imageName: "product4", price: 99.99)
	]
}

#Preview {
	HomeView()
}
