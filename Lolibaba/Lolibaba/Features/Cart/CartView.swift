//
//  CartView.swift
//  Lolibaba
//
//  Created by Ilyas Bintang Prayogi on 09/08/24.
//

import SwiftUI

struct CartView: View {
	@Environment(\.dismiss) var dismiss

	@State var isAllItemChecked = false

	var body: some View {
		VStack(spacing: 0) {
			HStack(spacing: 12) {
				Button(action: { dismiss() }) {
					Image(systemName: "arrow.left")
						.resizable()
						.scaledToFit()
						.frame(width: 18, height: 18)
						.tint(.charcoalGray)
				}

				Text("Keranjang")
					.font(.montserratSemiBold(14))
					.foregroundStyle(Color.charcoalGray)

				Spacer()

				Button(action: {}) {
					Image(systemName: "heart.fill")
						.resizable()
						.scaledToFit()
						.frame(width: 18, height: 18)
						.tint(.charcoalGray)
				}
			}
			.padding(.horizontal, 20)
			.frame(height: 50)
			.background(Color.white.shadow(color: .black.opacity(0.1), radius: 1, y: 1))

			ScrollView {
				LazyVStack(spacing: 14, content: {
					ForEach(1 ... 10, id: \.self) { _ in
						CartCellView(isChecked: false)
					}
				})
				.padding(.vertical, 14)
			}

			HStack {
				CheckBoxView(isChecked: $isAllItemChecked)
					.frame(width: 16, height: 16)
					.padding(.leading, 30)

				Text("Pilih Semua")
					.font(.montserratRegular(10))
					.foregroundStyle(Color.charcoalGray)

				Spacer()

				VStack(alignment: .trailing) {
					Text("Total")
						.font(.montserratRegular(10))
						.foregroundStyle(Color.charcoalGray)

					Text("Rp100.000")
						.font(.montserratBold(14))
						.foregroundStyle(.reddishOrange)
				}

				Button(action: {}) {
					Text("Checkout")
						.font(.montserratSemiBold(14))
						.foregroundStyle(.white)
						.frame(maxHeight: .infinity)
						.padding(.trailing, 16)
						.padding(.horizontal, 10)
						.background(.reddishOrange)
					
				}
			}
			.frame(height: 50)
			.frame(maxWidth: .infinity)
			.background(Color.white)
			.clipShape(.rect)
			.shadow(radius: 1)
		}
		.toolbar(.hidden)
		.ignoresSafeArea(edges: .bottom)
	}
}

struct CartCellView: View {
	@State var isChecked = false
	@State var itemCount = 1

	var body: some View {
		HStack(alignment: .top, spacing: 10) {
			HStack(spacing: 10) {
				CheckBoxView(isChecked: $isChecked)
					.frame(width: 16, height: 16)

				Image(.bannerFashion)
					.resizable()
					.scaledToFill()
					.frame(width: 64, height: 64)
					.clipShape(.rect(cornerRadius: 6))
			}
			VStack(alignment: .leading, spacing: 7) {
				Text("Poco F6 8/256GB | 12/512GB")
					.font(.montserratMedium(12))
					.foregroundStyle(Color.charcoalGray)
					.frame(maxWidth: .infinity, alignment: .leading)
					.multilineTextAlignment(.leading)
					.lineLimit(2)

				Text("Rp100.000")
					.font(.montserratBold(12))
					.foregroundStyle(Color.charcoalGray)

				HStack {
					Button(action: {
						if itemCount > 1 {
							itemCount -= 1
						}
					}) {
						Image(systemName: "minus")
							.resizable()
							.scaledToFit()
							.foregroundStyle(Color.charcoalGray)
							.padding(5)
							.frame(width: 20, height: 20)
							.background(Color.lightGray)
					}

					TextField("", value: $itemCount, formatter: NumberFormatter())
						.multilineTextAlignment(.center)
						.keyboardType(.numberPad)
						.frame(width: 20)
						.font(.montserratRegular(12))
						.foregroundStyle(Color.charcoalGray)

					Button(action: {
						itemCount += 1
					}) {
						Image(systemName: "plus")
							.resizable()
							.scaledToFit()
							.foregroundStyle(Color.charcoalGray)
							.padding(5)
							.frame(width: 20, height: 20)
							.background(Color.lightGray)
					}
				}
				.border(Color.lightGray, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
				.clipShape(.rect(cornerRadius: 3))

				Button(action: {}) {
					HStack(spacing: 4) {
						Image(systemName: "heart")
							.resizable()
							.scaledToFit()
							.frame(width: 14, height: 14)
							.tint(.charcoalGray)

						Text("Add to wishlist")
							.font(.montserratRegular(12))
							.foregroundStyle(Color.charcoalGray)
					}
				}
			}
		}
		.padding(10)
		.frame(maxWidth: .infinity)
		.background(Color.white)
		.clipShape(.rect(cornerRadius: 6))
		.shadow(radius: 1)
		.padding(.horizontal, 20)
	}
}

#Preview {
	CartView()
}
