package core

import "core:strings"
import pd "../../../../libs/odin-playdate"

CENTER_X :: 200
CENTER_Y :: 120

default_font : ^pd.Font

begin_draw :: proc() {
    api := cast(^pd.Api)context.user_ptr
    api.graphics.clear({.})
}

end_draw :: proc() {

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
