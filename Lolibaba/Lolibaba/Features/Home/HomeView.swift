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
		NavigationStack {
			VStack {
				HStack {
					Spacer()
					
					NavigationLink(destination: CartView()) {
						Image(systemName: "cart")
							.resizable()
							.scaledToFit()
							.foregroundStyle(Color.reddishOrange)
							.frame(width: 24, height: 24)
					}
				}
				.frame(height: 50)
				.padding(.horizontal, 20)
				.background(Color.white.shadow(color: Color.black.opacity(0.1), radius: 1, y: 1))
				
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
								CategoryCellView(categoryImage: .iconFashion, categoryName: "Fashion")
								CategoryCellView(categoryImage: .iconElectronic, categoryName: "Elektronik")
								CategoryCellView(categoryImage: .iconKecantikan, categoryName: "Kecantikan")
								CategoryCellView(categoryImage: .iconOlahraga, categoryName: "Olahraga")
								CategoryCellView(categoryImage: .iconMakanan, categoryName: "Makanan")
							}
							
							HStack {
								CategoryCellView(categoryImage: .iconFurniture, categoryName: "Furniture")
								CategoryCellView(categoryImage: .iconOtomotif, categoryName: "Otomotif")
								CategoryCellView(categoryImage: .iconGadget, categoryName: "Gadget")
								CategoryCellView(categoryImage: .iconMainan, categoryName: "Mainan")
								CategoryCellView(categoryImage: .iconKesehatan, categoryName: "Kesehatan")
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
										ProductCellView(product: product)
									}
								}
							}
							.padding(.horizontal, 8)
						}
					}
				}
			}
		}
	}
}

#Preview {
	HomeView()
}
