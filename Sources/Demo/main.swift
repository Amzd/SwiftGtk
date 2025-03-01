//
//  Copyright © 2015 Tomas Linhart. All rights reserved.
//

import SwiftGtk
import Foundation

let app = Application(applicationId: "com.tomaslinhart.swiftgtk.example")
app.run { window in
    window.title = "Hello World"
    window.defaultSize = Size(width: 400, height: 400)
    window.resizable = true

    let buttonBox = ButtonBox(orientation: .vertical)

    let label = Label()
    label.selectable = true
    buttonBox.add(label)

    let slider = Scale()
    slider.minimum = 5
    slider.maximum = 10.5
    slider.value = 5.7
    buttonBox.add(slider)

    let entry = Entry(placeholder: "Test input")
    entry.changed = { entry in
        let text = entry.text
        print(text)
        entry.text = text
    }
    buttonBox.add(entry)

    let scrollable = ScrolledWindow()
    scrollable.maximumContentHeight = 100
    scrollable.minimumContentHeight = 100
    let viewport = Viewport()
    let content = Box(orientation: .vertical, spacing: 0)
    for i in 0..<20 {
        content.add(Label(text: "This is line number \(i)"))
    }
    viewport.add(content)
    scrollable.add(viewport)
    buttonBox.add(scrollable)

    let button = Button(label: "Press")
    button.label = "Press Me"
    button.clicked = { [weak label] _ in
        label?.text = "Oh, you pressed the button."

        let newWindow = Window(windowType: .topLevel)
        newWindow.title = "Just a window"
        newWindow.defaultSize = Size(width: 200, height: 200)

        let labelPressed = Label(text: "Oh, you pressed the button.")
        newWindow.add(labelPressed)

        newWindow.showAll()
    }

    buttonBox.add(button)

    let calendarButton = Button(label: "Calendar")
    calendarButton.clicked = { _ in
        let newWindow = Window(windowType: .topLevel)
        newWindow.title = "Just a window"
        newWindow.defaultSize = Size(width: 200, height: 200)

        let calendar = Calendar()
        calendar.year = 2000
        calendar.showHeading = true

        newWindow.add(calendar)

        newWindow.showAll()
    }

    buttonBox.add(calendarButton)

    let imageButton = Button(label: "Image")
    imageButton.clicked = { _ in
        let newWindow = Window(windowType: .topLevel)
        newWindow.title = "Just a window"
        newWindow.defaultSize = Size(width: 200, height: 200)

        let image = Image(path: Bundle.module.bundleURL.appendingPathComponent("GTK.png").path)

        newWindow.add(image)

        newWindow.showAll()
    }

    buttonBox.add(imageButton)

    let textView = TextView()
    textView.backspace = { _ in
        print("backspace")
    }
    textView.copyClipboard = { _ in
        print("copyClipboard")
    }
    textView.cutClipboard = { _ in
        print("cutClipboard")
    }
    textView.pasteClipboard = { _ in
        print("pasteClipboard")
    }
    textView.selectAll = { _, select in
        print(select ? "everything is selected" : "everything is unselected")
    }

    buttonBox.add(textView)

    window.add(buttonBox)
}
