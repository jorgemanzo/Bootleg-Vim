//
//  ViewController.swift
//  Bootleg-Vim
//
//  Created by Jorge on 9/20/19.
//  Copyright © 2019 jorgemanzo. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
	@IBOutlet var textView: TextView!
	@IBOutlet var modeLabel: NSTextField!
	override func viewDidLoad() {
		super.viewDidLoad()

		// Do any additional setup after loading the view.
		textView.delegate = textView
		textView.editorModeManager.delegate = self
		
		// Set the editor into normal mode
		textView.editorModeManager.changeMode(changeModeTo: EditorModeManager.NORMAL_MODE)
	}

	override var representedObject: Any? {
		didSet {
		// Update the view, if already loaded.
		}
	}


}

extension ViewController: NotifyEditorDelegate {
	func onModeChange(modeWasChangedTo newMode: String) {
		modeLabel.stringValue = newMode
	}
}
