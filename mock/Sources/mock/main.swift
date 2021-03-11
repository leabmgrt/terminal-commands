//
//  main.swift
//  mock
//
//  Created by Adrian Baumgart on 10.03.21.
//

import Foundation
import ArgumentParser
#if canImport(Cocoa)
import Cocoa
#endif

struct Command: ParsableCommand {
    @Option(name: NameSpecification.shortAndLong, help: "Text to mock") var text: String
    @Flag(name: .shortAndLong, help: "Copy the string") var copy: Bool = false
    
    func run() {
        
        var newString = ""
        let lowercasedText = text.lowercased()
        
        var currentMockState: MockState = .uppercase
        
        for char in lowercasedText {
            if String(char) != " " {
                newString.append(currentMockState == MockState.lowercase ? String(char).uppercased() : String(char))
                currentMockState = currentMockState == MockState.lowercase ? .uppercase : .lowercase
            }
            else {
                newString.append(char)
            }
        }
        print(newString)
        if copy {
            #if canImport(Cocoa)
            let pasteboard = NSPasteboard.general
            pasteboard.clearContents()
            pasteboard.setString(newString, forType: .string)
            #else
            print("Copying is not supported on this OS")
            #endif
        }
    }
}

Command.main()

enum MockState {
    case lowercase, uppercase
}
