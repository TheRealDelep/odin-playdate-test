package main

import "base:runtime"

import pd "../../libs/odin-playdate"

import "platform/core"
import "../game"

ctx : runtime.Context

font_path :: "/System/Fonts/Asheville-Sans-14-Bold.pft";

@(export)
eventHandler :: proc "c" (api: ^pd.Api, event: pd.System_Event, arg: u32) -> i32 {
    #partial switch event {
        case .Init: {
            ctx = pd.playdate_context_create(api)
            context = ctx

            err : cstring
            core.default_font = api.graphics.load_font(font_path, &err)

            assert(core.font != nil, "couldn't load font")

            api.system.set_update_callback(update, api)
            game.init()
        }
        case .Terminate: {
            context = ctx
            game.deinit()
            pd.playdate_context_destroy(&ctx)
        }
    }

    return 0
}

update :: proc "c" (user_data: rawptr) -> pd.Update_Result{
    context = ctx
    context.user_ptr = user_data
    game.update()

    return .Update_Display
}

// #include <stdio.h>
// #include <stdlib.h>
// 
// #include "pd_api.h"
// 
// static int update(void* userdata);
// const char* fontpath = "/System/Fonts/Asheville-Sans-14-Bold.pft";
// LCDFont* font = NULL;
// 
// #ifdef _WINDLL
// __declspec(dllexport)
// #endif
// int eventHandler(PlaydateAPI* pd, PDSystemEvent event, uint32_t arg)
// {
// 	(void)arg; // arg is currently only used for event = kEventKeyPressed
// 
// 	if ( event == kEventInit )
// 	{
// 		const char* err;
// 		font = pd->graphics->loadFont(fontpath, &err);
// 		
// 		if ( font == NULL )
// 			pd->system->error("%s:%i Couldn't load font %s: %s", __FILE__, __LINE__, fontpath, err);
// 
// 		// Note: If you set an update callback in the kEventInit handler, the system assumes the game is pure C and doesn't run any Lua code in the game
// 		pd->system->setUpdateCallback(update, pd);
// 	}
// 	
// 	return 0;
// }


// #define TEXT_WIDTH 86
// #define TEXT_HEIGHT 16
// 
// int x = (400-TEXT_WIDTH)/2;
// int y = (240-TEXT_HEIGHT)/2;
// int dx = 1;
// int dy = 2;
// 
// static int update(void* userdata)
// {
// 	PlaydateAPI* pd = userdata;
// 	
// 	pd->graphics->clear(kColorWhite);
// 	pd->graphics->setFont(font);
// 	pd->graphics->drawText("Hello World!", strlen("Hello World!"), kASCIIEncoding, x, y);
// 
// 	x += dx;
// 	y += dy;
// 	
// 	if ( x < 0 || x > LCD_COLUMNS - TEXT_WIDTH )
// 		dx = -dx;
// 	
// 	if ( y < 0 || y > LCD_ROWS - TEXT_HEIGHT )
// 		dy = -dy;
//         
// 	pd->system->drawFPS(0,0);
// 
// 	return 1;
// }


