package game

import pl "platform:core"
import "core:fmt"

game_hello :: proc() {
    pl.platform_hello()
    fmt.println("Hello from game")
}
