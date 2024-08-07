//
//  CategoryCellView.swift
//  Lolibaba
//
//  Created by Ilyas Bintang Prayogi on 07/08/24.
//

import SwiftUI

struct CategoryCellView: View {
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

#Preview {
	CategoryCellView(categoryImage: .iconElectronic, categoryName: "Elektronik")
}
