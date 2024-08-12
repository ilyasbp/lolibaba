//
//  CheckBoxView.swift
//  Lolibaba
//
//  Created by Ilyas Bintang Prayogi on 09/08/24.
//

import SwiftUI

struct CheckBoxView: View {
	@Binding var isChecked: Bool

	var body: some View {
		Button(action: { isChecked.toggle() }) {
			Image(systemName: isChecked ? "checkmark.square.fill" : "square")
				.resizable()
				.scaledToFit()
				.tint(isChecked ? .blue : .charcoalGray)
		}
	}
}

#Preview {
	CheckBoxPreview()
}

struct CheckBoxPreview: View {
	@State private var isChecked = false

	var body: some View {
		CheckBoxView(isChecked: $isChecked)
	}
}
