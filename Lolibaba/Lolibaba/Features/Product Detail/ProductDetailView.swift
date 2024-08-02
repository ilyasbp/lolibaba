//
//  ProductDetailView.swift
//  Lolibaba
//
//  Created by Ilyas Bintang Prayogi on 02/08/24.
//

import SwiftUI

struct ProductDetailView: View {
	@Environment(\.presentationMode) var presentationMode
	let product: Product
	
	var body: some View {
		VStack {
			HStack {
				Button(action: {}) {
					Image(systemName: "arrow.backward")
						.resizable()
						.scaledToFit()
						.tint(.charcoalGray)
						.frame(width: 18, height: 18)
				}
				
				Spacer()
				
				Button(action: {}) {
					Image(systemName: "basket.fill")
						.resizable()
						.scaledToFit()
						.tint(.charcoalGray)
						.frame(width: 18, height: 18)
						.padding(4)
						.overlay(content: {
							Text("2")
								.font(.montserratRegular(10))
								.foregroundStyle(Color.white)
								.frame(width: 12, height: 12)
								.background(Color.red)
								.clipShape(.circle)
								.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
						})
				}
			}
			.padding(.horizontal, 20)
			.frame(height: 50)
			
			ScrollView {
				VStack(alignment: .leading, spacing: 16) {
					// Gambar Produk
					Image(product.imageName)
						.resizable()
						.scaledToFit()
						.frame(maxWidth: .infinity)
						.cornerRadius(10)
						.padding(.top)
					
					// Nama Produk
					Text(product.name)
						.font(.title)
						.fontWeight(.bold)
						.padding(.horizontal)
					
					// Harga Produk
					Text("$\(product.price, specifier: "%.2f")")
						.font(.title2)
						.foregroundColor(.secondary)
						.padding(.horizontal)
					
					// Deskripsi Produk
					Text("Product Description")
						.font(.headline)
						.padding(.horizontal)
					
					Text("This is a detailed description of the product. It provides all the necessary information that a customer might need, such as the features, specifications, and benefits of the product. You can also add more detailed information, such as the material, size, weight, and any other relevant details.")
						.font(.body)
						.padding(.horizontal)
					
					// Tombol Tambah ke Keranjang
					Button(action: {
						// Logika untuk menambah produk ke keranjang
						print("Add to Cart tapped")
					}) {
						Text("Add to Cart")
							.font(.headline)
							.foregroundColor(.white)
							.frame(maxWidth: .infinity)
							.padding()
							.background(Color.blue)
							.cornerRadius(10)
							.padding(.horizontal)
					}
					.padding(.top)
					
					Spacer()
				}
			}
		}
		.toolbar(.hidden)
	}
}

#Preview {
	ProductDetailView(product: Product(name: "nani", imageName: "ndi", price: 34))
}
