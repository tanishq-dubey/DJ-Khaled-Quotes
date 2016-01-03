//
//  AppDelegate.swift
//  DJ Khaled Quotes
//
//  Created by Tanishq Dubey on 1/2/16.
//  Copyright © 2016 TDApps. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate, NSMenuDelegate {
    
    var quotes = ["Another One.",
                  "Congratulations. You played yourself",
                   "Ride wid me",
                   "Smh they get mad when u have joy.",
                   "I can deal with everything. I got the answer for anything. This DJ Khaled.",
                   "I didn’t want to be an artist in the same place I worked. You could always have people that might feel like you would do something more for yourself.",
                    "When I made ‘Hold You Down,’ I was thinking Barry Gordy, Quincy Jones. I was saying to myself, ‘If they was in the studio, what was they thinking.’ So I started thinking DJ Khaled, but inspired by the greats.",
                    "My fans expect me to be greater and keep being great.",
                    "The key to more success is coco butter.",
                    "Those that weather the storm r the great ones.",
                    "They don’t want you to win. They don’t want you to have the No. 1 record in the country. They don’t want you get healthy. They don’t want you to exercise. And they don’t want you to have that view.",
                    "I wanted to see what Jay Z was looking through his window, if he even had a window.",
                    "I can deal with everything. I got the answer for   anything. This DJ Khaled.",
                    "I changed… a lot."]

    @IBOutlet weak var window: NSWindow!
    
    let statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(-2)
    
    let popover = NSPopover()

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        if let button = statusItem.button {
            
            button.action = Selector("printQuote:")
            button.title = "DJ"
            let menu = NSMenu()
            menu.delegate = self
            menu.addItem(NSMenuItem(title: "Quit Quotes", action: Selector("terminate:"), keyEquivalent: "q"))
            
            statusItem.menu = menu
        }
        
    }
    
    func menuWillOpen(menu: NSMenu) {
        printQuote()
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }
    
    func printQuote() {
        let randomIndex = Int(arc4random_uniform(UInt32(quotes.count)))
        let quoteText = quotes[randomIndex]
        
        let notification = NSUserNotification()
        notification.title = quoteText
        notification.informativeText = "This text has been copied to your clipboard"
        notification.soundName = NSUserNotificationDefaultSoundName
        let pasteboard = NSPasteboard.generalPasteboard()
        pasteboard.clearContents()
        pasteboard.setString(quoteText, forType: NSPasteboardTypeString)
        NSUserNotificationCenter.defaultUserNotificationCenter().deliverNotification(notification)
    }


}

