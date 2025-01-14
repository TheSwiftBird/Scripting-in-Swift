#!/usr/bin/env swift

import Foundation

func call(_ command: String, arguments: [String] = []) throws -> String? {
    let process = Process()
    process.executableURL = URL(fileURLWithPath: "/usr/bin/env")
    process.arguments = [command] + arguments
    
    let pipe = Pipe()
    process.standardOutput = pipe
    
    try process.run()
    process.waitUntilExit()
    
    if
        let data = try pipe.fileHandleForReading.readToEnd(),
        let output = String(data: data, encoding: .utf8)
    {
        return output
    } else {
        return nil
    }
}

let arguments = CommandLine.arguments.dropFirst()
let contents = try! (call("ls", arguments: Array(arguments)))
print("Contents: \(contents ?? "<nothing>")")
