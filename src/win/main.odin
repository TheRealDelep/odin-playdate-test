package main

import "core:fmt"
import "platform/core"
import "../game"

main :: proc() {
    fmt.println("Hello from windaube entry point")
    core.platform_hello() 
    game.game_hello()
}
