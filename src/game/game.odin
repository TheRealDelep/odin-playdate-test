package game

import "core:fmt"

import pl "platform:core"

text :: "Hello from odin!"
text_speed :f32 : 64

text_pos : [2]f32
text_dir : [2]f32

init :: proc() {
    text_pos = {0, 0}
    text_dir = {1, 1}
}

deinit :: proc() {}

update :: proc(dt: f32) {
    text_w := pl.get_text_width(text)
    text_h :: 12

    text_pos += text_dir * (text_speed * dt)

    if text_pos.x < -200 || text_pos.x > f32(200 - text_w) {
        text_dir.x = -text_dir.x 
    }

    if text_pos.y < -120 || text_pos.y > (120 - 12) {
        text_dir.y = -text_dir.y
    }

    pl.begin_draw()
    pl.draw_text(text, {i32(text_pos.x), i32(text_pos.y)})
    pl.end_draw()
}
