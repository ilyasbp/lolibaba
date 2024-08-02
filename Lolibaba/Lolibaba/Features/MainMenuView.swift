//
//  MainMenuView.swift
//  Lolibaba
//
//  Created by Ilyas Bintang Prayogi on 31/07/24.
//

import SwiftUI

struct MainMenuView: View {
	@State private var selectedTab: Int = 0

	init() {
		UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.montserratRegular(12)], for: .normal)
		UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.montserratRegular(12)], for: .selected)
	}

	var body: some View {
		VStack {
			TabView(selection: $selectedTab) {
				HomeView()
					.tabItem {
						Image(systemName: "house.fill")
						Text("Home")
					}
					.tag(0)

				CategoriesView()
					.tabItem {
						Image(systemName: "list.bullet")
						Text("Categories")
					}
					.tag(1)

				OrdersView()
					.tabItem {
						Image(systemName: "bag.fill")
						Text("Orders")
					}
					.tag(3)

				ProfileView()
					.tabItem {
						Image(systemName: "person.fill")
						Text("Profile")
					}
					.tag(4)
			}
			.font(.custom("Montserrat-Black", size: 30))
			.tint(Color.reddishOrange)
		}

		.background(Color.seashell)
	}
}

struct CategoriesView: View {
	var body: some View {
		Color.black
	}
}

struct SearchView: View {
	var body: some View {
		Color.green
	}
}

struct OrdersView: View {
	var body: some View {
		Color.red
	}
}

struct ProfileView: View {
	var body: some View {
		Color.yellow
	}
}

#Preview {
	MainMenuView()
}
