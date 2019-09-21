//
//  EditorModeManager.swift
//  Bootleg-Vim
//
//  Created by Jorge on 9/21/19.
//  Copyright © 2019 jorgemanzo. All rights reserved.
//

import Foundation

/**
	Manages the current state of the text editor.
	Change the mode here doesnt actually disable
	or enable the editor. The `NSTextView` instance
	disables or enables editing. This object is
	used to keep track of the mode and notify
	the delegate (`ViewController`) that the mode
	was changed.
*/
class EditorModeManager {
	public static let INSERT_MODE = "-- INSERT_MODE --"
	public static let NORMAL_MODE = "-- NORMAL MODE --"
	private var currentMode: String
	weak var delegate: NotifyEditorDelegate?
	
	init() {
		currentMode = EditorModeManager.INSERT_MODE
		delegate?.onModeChange(modeWasChangedTo: currentMode)
	}
	
	public func getCurrentMode() -> String {
		return currentMode
	}
	
	/**
		Updates the current mode for the mode manager.
		Calling this method will notify the delegate
		with what the new mode is.
	
		- Parameters:
			- changeModeTo: The new mode to change to. Use modes from
	`EditorModeManager.INSERT_MODE` or `EditorModeManager.NORMAL_MODE`
	instance properties
	*/
	public func changeMode(changeModeTo newMode: String) {
		currentMode = newMode
		delegate?.onModeChange(modeWasChangedTo: currentMode)
	}
	
	
}

protocol NotifyEditorDelegate: AnyObject {
	func onModeChange(modeWasChangedTo newMode: String)
}
