//
//  TextView.swift
//  Bootleg-Vim
//
//  Created by Jorge on 9/20/19.
//  Copyright © 2019 jorgemanzo. All rights reserved.
//
import Cocoa

/**
	Subclasses NSTextView to become its own NSTextViewDelegate
	and get notified of information from the text view.
*/
class TextView: NSTextView, NSTextViewDelegate {
	
	// MARK: How we detect regular keys and numbers
	func textView(_ textView: NSTextView, shouldChangeTextIn affectedCharRange: NSRange, replacementString: String?) -> Bool {
		print(replacementString ?? "Replacement String was empty")
		return true
	}
	
	// MARK: How we detect escape key pressed
	override func cancelOperation(_ sender: Any?) {
		print(sender ?? "No sender in cancel operation, or escape key was pressed")
	}
}
