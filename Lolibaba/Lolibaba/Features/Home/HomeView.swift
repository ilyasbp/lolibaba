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
					
					VStack(spacing: 16) {
						HStack {
							CategoryView(categoryImage: .iconFashion, categoryName: "Fashion")
							CategoryView(categoryImage: .iconElectronic, categoryName: "Elektronik")
							CategoryView(categoryImage: .iconKecantikan, categoryName: "Kecantikan")
							CategoryView(categoryImage: .iconOlahraga, categoryName: "Olahraga")
							CategoryView(categoryImage: .iconMakanan, categoryName: "Makanan")
						}
						
						HStack {
							CategoryView(categoryImage: .iconFurniture, categoryName: "Furniture")
							CategoryView(categoryImage: .iconOtomotif, categoryName: "Otomotif")
							CategoryView(categoryImage: .iconGadget, categoryName: "Gadget")
							CategoryView(categoryImage: .iconMainan, categoryName: "Mainan")
							CategoryView(categoryImage: .iconKesehatan, categoryName: "Kesehatan")
						}
					}
					.padding(.horizontal, 20)
					
					VStack(alignment: .leading, spacing: 10) {
						Text("Featured Products")
							.font(.montserratSemiBold(16))
							.padding(.horizontal)
						
						LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 10) {
							ForEach(Product.sampleProducts) { product in
								NavigationLink(destination: ProductDetailView(product: product)) {
									ProductCardView(product: product)
								}
							}
						}
						.padding(.horizontal, 10)
					}
				}
				.padding(.vertical)
			}
		}
	}
}

struct CategoryView: View {
	let categoryImage: ImageResource
	let categoryName: String
	
	var body: some View {
		Button(action: {}) {
			VStack {
				Image(categoryImage)
					.resizable()
					.scaledToFit()
					.padding(.horizontal, 8)
					.padding(.bottom, 4)
				
				Text(categoryName)
					.font(.montserratRegular(10))
					.foregroundStyle(Color.charcoalGray)
			}
			.frame(maxWidth: .infinity)
		}
	}
}

struct ProductCardView: View {
	let product: Product
	
	var body: some View {
		VStack(alignment: .leading, spacing: 4) {
			let imageSize = (UIScreen.width - 30) / 2
			
			Image(.bannerFashion)
				.resizable()
				.scaledToFill()
				.frame(width: imageSize, height: imageSize)
			
			VStack(alignment: .leading, spacing: 4) {
				Text(product.name)
					.font(.montserratRegular(12))
					.foregroundStyle(Color.charcoalGray)
					.lineLimit(2, reservesSpace: true)
					.multilineTextAlignment(.leading)
				
				Text(CurrencyUtils.formatToRupiah(from: product.price))
					.font(.montserratBold(14))
					.foregroundStyle(Color.charcoalGray)
			}
			.padding(.horizontal, 6)
			
			Button(action: {}){
				Text("Tambah ke keranjang")
					.font(.montserratSemiBold(12))
					.foregroundStyle(Color.white)
					.frame(maxWidth: .infinity)
					.padding(.vertical, 8)
					.background(Color.reddishOrange)
			}
		}
		.background(Color.white)
		.cornerRadius(6)
		.shadow(radius: 1)
	}
}

// Model Data untuk Produk
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

#Preview {
	HomeView()
}
