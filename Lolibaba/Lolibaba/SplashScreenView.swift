//
//  SplashScreenView.swift
//  Lolibaba
//
//  Created by Ilyas Bintang Prayogi on 31/07/24.
//

import SwiftUI

struct SplashScreenView: View {
	@State private var isActive = false
	@State private var size = 0.8
	@State private var opacity = 0.5
	
	var body: some View {
		if isActive {
			ContentView()
		} else {
			VStack {
				Image(.lolibaba)
					.resizable()
					.scaledToFit()
					.scaleEffect(size)
					.opacity(opacity)
					.onAppear {
						withAnimation(.easeIn(duration: 1.2)) {
							self.size = 1.0
							self.opacity = 1.0
						}
					}
			}
			.frame(maxWidth: .infinity, maxHeight: .infinity)
			.background(Color.seashell)
			.onAppear {
				DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
					self.isActive = true
				}
			}
		}
	}
}

struct SplashScreenView_Previews: PreviewProvider {
	static var previews: some View {
		SplashScreenView()
	}
}
