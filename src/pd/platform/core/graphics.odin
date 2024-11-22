package core

import "core:strings"
import pd "../../../../libs/odin-playdate"

CENTER_X :: 200
CENTER_Y :: 120

default_font : ^pd.Font

begin_draw :: proc() {
    api := cast(^pd.Api)context.user_ptr
    api.graphics.clear({solid = .White})
}

end_draw :: proc() { }

get_text_width :: proc(text: string) -> i32 {
    api := cast(^pd.Api)context.user_ptr

    return api.graphics.get_text_width(
        default_font, 
        cstring(raw_data(text)),
        len(text),
        .ASCII,
        0
    )
}

draw_text :: proc(text: string, pos: [2]i32) {
    api := cast(^pd.Api)context.user_ptr
    api.graphics.set_font(default_font)

    api.graphics.draw_text(
        cstring(raw_data(text)), 
        len(text), 
        .ASCII, 
        CENTER_X + pos.x,
        CENTER_Y + pos.y
    )
}