#!/usr/bin/env swift

func sayHello(to name: String) {
    print("Hello \(name)!")
}

print("What's your name?")

let name = readLine()!

sayHello(to: name)
