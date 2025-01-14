#!/usr/bin/env swift

import Foundation

let process = Process()
process.executableURL = URL(fileURLWithPath: "/usr/bin/env")
process.arguments = ["ls", "-a"]

let pipe = Pipe()
process.standardOutput = pipe

do {
    try process.run()
} catch {
    print(error.localizedDescription)
}
process.waitUntilExit()

if
    let data = try pipe.fileHandleForReading.readToEnd(),
    let output = String(data: data, encoding: .utf8)
{
    print(output)
} else {
    print("No output!")
}
