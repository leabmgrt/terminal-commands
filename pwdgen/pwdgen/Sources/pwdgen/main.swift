//
//  main.swift
//  pwdgen
//
//  Created by Adrian Baumgart on 26.02.21.
//

import Foundation
import ArgumentParser
#if canImport(Cocoa)
import Cocoa
#endif

struct Command: ParsableCommand {
    @Option(name: NameSpecification.shortAndLong, help: "Length of the string") var length: Int
    @Argument(help: "\"pwd\", \"pin\", \"crypt\" or \"aaa\"") var type: Type
    @Option(name: [NameSpecification.Element.long, .customShort("s")], help: "Custom charset") var charset: String?
    @Flag(name: .shortAndLong, help: "Copy the string") var copy: Bool = false
    @Flag(name: .shortAndLong, help: "Don't show the password") var dontShow: Bool = false
    func run() {
        var usingCharset = ""
        if charset != nil {
            usingCharset = charset!
        }
        else {
            usingCharset = type.charset()
        }
        
        let password = randomString(length: length, charset: usingCharset)
        if !dontShow {
            print(password)
        }
        if copy {
            #if canImport(Cocoa)
            let pasteBoard = NSPasteboard.general
            pasteBoard.clearContents()
            pasteBoard.setString(password, forType: .string)
            #else
            print("Copying is not supported on this OS")
            #endif
        }
    }
}

Command.main()

enum Type: String, ExpressibleByArgument {
    init?(argument: String) {
        self = Type.init(rawValue: argument)!
    }
    
    func charset() -> String {
        switch self {
        case .password:
            return "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%&*()_-+={[]}|:;<,>.?/"
        case .pin:
            return "0123456789"
        case .crypt:
            return "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!\"#$&'()*+,-./:;<=>?@[\\]^_`{|}~"
        case .aaa:
            return "aäàáâæãåāAÄÀÁÂÆÃÅĀ"
        }
    }
    
    case password = "pwd"
    case pin = "pin"
    case crypt = "crypt"
    case aaa = "aaa"
}

func randomString(length: Int, charset: String) -> String {
  let letters = charset
  return String((0..<length).map{ _ in letters.randomElement()! })
}
