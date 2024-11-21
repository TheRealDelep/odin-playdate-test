package main

import "core:fmt"
import "platform/core"
import "../game"

main :: proc() {
    fmt.println("Hello from pd entry point")
    core.platform_hello()
    game.game_hello()
}
