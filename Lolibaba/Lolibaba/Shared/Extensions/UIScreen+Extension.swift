//
//  UIScreen+Extension.swift
//  Lolibaba
//
//  Created by Ilyas Bintang Prayogi on 06/08/24.
//

import UIKit

extension UIWindow {
	static var current: UIWindow? {
		for scene in UIApplication.shared.connectedScenes {
			guard let windowScene = scene as? UIWindowScene else { continue }
			for window in windowScene.windows {
				if window.isKeyWindow { return window }
			}
		}
		return nil
	}
}

extension UIScreen {
	static var current: UIScreen? {
		UIWindow.current?.screen
	}
	
	static var width: CGFloat {
		UIWindow.current?.bounds.width ?? 390
	}
}
