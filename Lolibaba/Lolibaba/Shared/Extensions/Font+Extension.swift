//
//  FontExtension.swift
//  Lolibaba
//
//  Created by Ilyas Bintang Prayogi on 02/08/24.
//

import SwiftUI

public extension Font {
	// Weight: 200
	static func montserratExtraLight(_ size: CGFloat) -> Font {
		return Font.custom("Montserrat-ExtraLight", size: size)
	}
	
	// Weight: 300
	static func montserratLight(_ size: CGFloat) -> Font {
		return Font.custom("Montserrat-Light", size: size)
	}
	
	// Weight: 400
	static func montserratRegular(_ size: CGFloat) -> Font {
		return Font.custom("Montserrat-Regular", size: size)
	}
	
	// Weight: 500
	static func montserratMedium(_ size: CGFloat) -> Font {
		return Font.custom("Montserrat-Medium", size: size)
	}
	
	// Weight: 600
	static func montserratSemiBold(_ size: CGFloat) -> Font {
		return Font.custom("Montserrat-SemiBold", size: size)
	}
	
	// Weight: 700
	static func montserratBold(_ size: CGFloat) -> Font {
		return Font.custom("Montserrat-Bold", size: size)
	}
	
	// Weight: 800
	static func montserratExtraBold(_ size: CGFloat) -> Font {
		return Font.custom("Montserrat-ExtraBold", size: size)
	}
	
	// Weight: 900
	static func montserratBlack(_ size: CGFloat) -> Font {
		return Font.custom("Montserrat-Black", size: size)
	}
}

public extension UIFont {
	// Weight: 200
	static func montserratExtraLight(_ size: CGFloat) -> UIFont {
		return UIFont(name: "Montserrat-ExtraLight", size: size) ?? UIFont.systemFont(ofSize: size, weight: .ultraLight)
	}
	
	// Weight: 300
	static func montserratLight(_ size: CGFloat) -> UIFont {
		return UIFont(name: "Montserrat-Light", size: size) ?? UIFont.systemFont(ofSize: size, weight: .light)
	}
	
	// Weight: 400
	static func montserratRegular(_ size: CGFloat) -> UIFont {
		return UIFont(name: "Montserrat-Regular", size: size) ?? UIFont.systemFont(ofSize: size, weight: .regular)
	}
	
	// Weight: 500
	static func montserratMedium(_ size: CGFloat) -> UIFont {
		return UIFont(name: "Montserrat-Medium", size: size) ?? UIFont.systemFont(ofSize: size, weight: .medium)
	}
	
	// Weight: 600
	static func montserratSemiBold(_ size: CGFloat) -> UIFont {
		return UIFont(name: "Montserrat-SemiBold", size: size) ?? UIFont.systemFont(ofSize: size, weight: .semibold)
	}
	
	// Weight: 700
	static func montserratBold(_ size: CGFloat) -> UIFont {
		return UIFont(name: "Montserrat-Bold", size: size) ?? UIFont.systemFont(ofSize: size, weight: .bold)
	}
	
	// Weight: 800
	static func montserratExtraBold(_ size: CGFloat) -> UIFont {
		return UIFont(name: "Montserrat-ExtraBold", size: size) ?? UIFont.systemFont(ofSize: size, weight: .heavy)
	}
	
	// Weight: 900
	static func montserratBlack(_ size: CGFloat) -> UIFont {
		return UIFont(name: "Montserrat-Black", size: size) ?? UIFont.systemFont(ofSize: size, weight: .black)
	}
}
