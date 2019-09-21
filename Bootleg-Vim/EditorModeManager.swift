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
	Used by `TextView` to keep track of what mode it
	is in.

	On changing mode, uses a `NotifyEditorDelegate`
	to send a message to a delegate (usually a View
	Controller) of the change.
*/
class EditorModeManager {
	public static let INSERT_MODE = "-- INSERT_MODE --"
	public static let NORMAL_MODE = "-- NORMAL MODE --"
	private var currentMode: String
	weak var delegate: NotifyEditorDelegate?
	
	init() {
		// Editor should start in normal mode
		currentMode = EditorModeManager.NORMAL_MODE
		delegate?.onModeChange(modeWasChangedTo: currentMode)
	}
	
	/**
	* Gets the current mode that the editor is in.
	*/
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

/**
	Whenever `NotifyEditorManager` changes the current
	mode of the editor, `onModeChange(modeWasChangedTo:)`
	is called with the current mode the editor is in.
*/
protocol NotifyEditorDelegate: AnyObject {
	/**
		This method is called whenever the mode is changed
		in the `EditorModeManager`.
	
		Implement this method to know when the editor has
		changed its mode.
	
		- Parameters:
			- modeWasChangedTo: The new mode the editor
		was changed to. It takes the value of eiter
		`EditorModeManager.INSERT_MODE` or `EditorModeManager.NORMAL_MODE`
		Strings.
	*/
	func onModeChange(modeWasChangedTo newMode: String)
}
