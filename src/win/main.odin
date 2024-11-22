package main

import rl "vendor:raylib"

import "core:fmt"
import "platform/core"
import "../game"

main :: proc() {
    rl.InitWindow(400, 240, "Test")
    defer rl.CloseWindow() 

    game.init()
    defer game.deinit()

    for !rl.WindowShouldClose() {
        game.update(rl.GetFrameTime())
    }
}
