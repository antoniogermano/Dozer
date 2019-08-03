/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

import Cocoa
import Defaults

class NormalStatusIcon: HelperstatusIcon {
    override init() {
        super.init()
        type = .normal
    }

    override func statusIconClicked(_: AnyObject?) {
        guard let currentEvent = NSApp.currentEvent else {
            return
        }

        if currentEvent.modifierFlags.contains(.option) &&
            !currentEvent.modifierFlags.contains(.control) &&
            !currentEvent.modifierFlags.contains(.command) {
            DozerStatusIconController.shared.handleOptionClick()

            return
        }

        switch currentEvent.type {
        case .leftMouseDown:
            DozerStatusIconController.shared.toggle()
        case .rightMouseDown:
            appDelegate.preferencesWindowController.show(preferencePane: .general)
        default:
            break
        }
    }
}
