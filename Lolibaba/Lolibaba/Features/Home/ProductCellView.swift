//
//  ProductCellView.swift
//  Lolibaba
//
//  Created by Ilyas Bintang Prayogi on 07/08/24.
//

import SwiftUI

struct ProductCellView: View {
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
					
				HStack(spacing: 4) {
					Image(systemName: "star.fill")
						.resizable()
						.scaledToFit()
						.frame(width: 11, height: 11)
						.tint(.yellow)
						
					Text("5.0 | 24 terjual")
						.font(.montserratRegular(12))
						.foregroundStyle(Color.gray)
						
					Text("")
						.font(.montserratRegular(12))
						.foregroundStyle(Color.gray)
				}
					
				HStack(spacing: 4) {
					Image(systemName: "location.circle.fill")
						.resizable()
						.scaledToFit()
						.tint(.mint)
						.frame(width: 11, height: 11)
						
					Text("Kota Kediri")
						.font(.montserratRegular(12))
						.foregroundStyle(Color.gray)
				}
			}
			.padding(.horizontal, 5)
				
			Button(action: {}) {
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

#Preview {
	ProductCellView(product: Product(name: "Product 4", imageName: "product4", price: 99.99))
}
