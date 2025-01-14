#!/usr/bin/env swift

import Foundation

let currentDirectoryURL = URL(fileURLWithPath: FileManager.default.currentDirectoryPath, isDirectory: true)
let fileURL = currentDirectoryURL.appendingPathComponent("MyFile.txt")

guard
    let fileData = FileManager.default.contents(atPath: fileURL.path),
    let originalContents = String(data: fileData, encoding: .utf8)
else { exit (1) }

print(originalContents)

let textToWrite = originalContents + "More Text…\n"

do {
    try textToWrite.write(to: fileURL, atomically: false, encoding: .utf8)
} catch {
    print(error.localizedDescription)
}
