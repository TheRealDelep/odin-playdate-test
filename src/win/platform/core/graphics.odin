package core

import "core:fmt"
import "core:strings"
import rl "vendor:raylib"

begin_draw :: proc() {
    rl.ClearBackground(rl.WHITE)
    rl.BeginDrawing()
}

end_draw :: proc() {
    rl.EndDrawing()
}

draw_text :: proc(text: string, position: [2]i32) {
    s_width     := rl.GetScreenWidth()
    s_height    := rl.GetScreenHeight()

    center := [2]i32 { s_width / 2, s_height / 2 }

    rl.DrawText(
        strings.clone_to_cstring(text), 
        center.x + position.x, 
        center.y + position.y, 
        12, rl.BLACK
    )
}

get_text_width :: proc(text: string) -> i32 {
    return rl.MeasureText(strings.clone_to_cstring(text), 12)
}