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
	
	/// Represents the current mode of the text editor
	public let editorModeManager = EditorModeManager()
	
	// MARK: How we detect regular keys and numbers
	func textView(_ textView: NSTextView, shouldChangeTextIn affectedCharRange: NSRange, replacementString: String?) -> Bool {
		let currentMode: String = editorModeManager.getCurrentMode()
		let pressedKey: String = replacementString ?? ""
		print(pressedKey)
		if currentMode == EditorModeManager.INSERT_MODE {
			return true
		}
		if currentMode == EditorModeManager.NORMAL_MODE {
			if pressedKey == "i" {
				editorModeManager.changeMode(changeModeTo: EditorModeManager.INSERT_MODE)
			}
		}
		return false
	}
	
	// MARK: How we detect escape key pressed
	override func cancelOperation(_ sender: Any?) {
		
		// Since escape was pressed, change to normal mode
		editorModeManager.changeMode(changeModeTo: EditorModeManager.NORMAL_MODE)
	}
}
