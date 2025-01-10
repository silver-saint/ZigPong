//  Simple DirectMedia Layer
//  Copyright (C) 1997-2025 Sam Lantinga <slouken@libsdl.org>
//
//  This software is provided 'as-is', without any express or implied
//  warranty.  In no event will the authors be held liable for any damages
//  arising from the use of this software.
//
//  Permission is granted to anyone to use this software for any purpose,
//  including commercial applications, and to alter it and redistribute it
//  freely, subject to the following restrictions:
//
//  1. The origin of this software must not be misrepresented; you must not
//     claim that you wrote the original software. If you use this software
//     in a product, an acknowledgment in the product documentation would be
//     appreciated but is not required.
//  2. Altered source versions must be plainly marked as such, and must not be
//     misrepresented as being the original software.
//  3. This notice may not be removed or altered from any source distribution.
//

// As of version 0.5, SDL is loaded dynamically into the application */
//
//  \name SDL_INIT_*
//
//  These are the flags which may be passed to SDL_Init().  You should
//  specify the subsystems which you will be using in your application.
//
// @{
pub const SDL_INIT_TIMER: u32 = 0x00000001;
pub const SDL_INIT_AUDIO: u32 = 0x00000010;
pub const SDL_INIT_VIDEO: u32 = 0x00000020;
pub const SDL_INIT_HAPTIC: u32 = 0x00001000;
pub const SDL_INIT_JOYSTICK: u32 = 0x00000200;
pub const SDL_INIT_GAMECONTROLLER: u32 = 0x00002000;
pub const SDL_INIT_EVENTS: u32 = 0x00004000;
pub const SDL_INIT_SENSOR: u32 = 0x00008000;
pub const SDL_INIT_NOPARACHUTE: u32 = 0x00100000;
pub const SDL_INIT_EVERYTHING: u32 = (SDL_INIT_TIMER ^ SDL_INIT_AUDIO ^ SDL_INIT_VIDEO ^ SDL_INIT_EVENTS ^ SDL_INIT_JOYSTICK ^ SDL_INIT_HAPTIC ^ SDL_INIT_GAMECONTROLLER ^ SDL_INIT_SENSOR);

// {@}

///*
/// Initialize the SDL library.
///
/// SDL_Init() simply forwards to calling SDL_InitSubSystem(). Therefore, the
/// two may be used interchangeably. Though for readability of your code
/// SDL_InitSubSystem() might be preferred.
///
/// The file I/O (for example: SDL_RWFromFile) and threading (SDL_CreateThread)
/// subsystems are initialized by default. Message boxes
/// (SDL_ShowSimpleMessageBox) also attempt to work without initializing the
/// video subsystem, in hopes of being useful in showing an error dialog when
/// SDL_Init fails. You must specifically initialize other subsystems if you
/// use them in your application.
///
/// Logging (such as SDL_Log) works without initialization, too.
///
/// `flags` may be any of the following OR'd together:
///
/// - `SDL_INIT_TIMER`: timer subsystem
/// - `SDL_INIT_AUDIO`: audio subsystem
/// - `SDL_INIT_VIDEO`: video subsystem; automatically initializes the events
///   subsystem
/// - `SDL_INIT_JOYSTICK`: joystick subsystem; automatically initializes the
///   events subsystem
/// - `SDL_INIT_HAPTIC`: haptic (force feedback) subsystem
/// - `SDL_INIT_GAMECONTROLLER`: controller subsystem; automatically
///   initializes the joystick subsystem
/// - `SDL_INIT_EVENTS`: events subsystem
/// - `SDL_INIT_EVERYTHING`: all of the above subsystems
/// - `SDL_INIT_NOPARACHUTE`: compatibility; this flag is ignored
///
/// Subsystem initialization is ref-counted, you must call SDL_QuitSubSystem()
/// for each SDL_InitSubSystem() to correctly shutdown a subsystem manually (or
/// call SDL_Quit() to force shutdown). If a subsystem is already loaded then
/// this call will increase the ref-count and return.
///
/// \param flags subsystem initialization flags
/// \returns 0 on success or a negative error code on failure; call
///          SDL_GetError() for more information.
///
/// \since This function is available since SDL 2.0.0.
///
/// \sa SDL_InitSubSystem
/// \sa SDL_Quit
/// \sa SDL_SetMainReady
/// \sa SDL_WasInit
///
pub extern fn SDL_Init(flags: u32) i32;
////
/// Compatibility function to initialize the SDL library.
///
/// In SDL2, this function and SDL_Init() are interchangeable.
///
///  flags any of the flags used by SDL_Init(); see SDL_Init for details.
/// returns 0 on success or a negative error code on failure; call
///          SDL_GetError() for more information.
///
/// since This function is available since SDL 2.0.0.
///
///  SDL_Init
///  SDL_Quit
/// SDL_QuitSubSystem
////

pub extern fn SDL_InitSubSystem(flags: u32) i32;
///
///* Shut down specific SDL subsystems.
///*
///* If you start a subsystem using a call to that subsystem's init function
///* (for example SDL_VideoInit()) instead of SDL_Init() or SDL_InitSubSystem(),
///* SDL_QuitSubSystem() and SDL_WasInit() will not work. You will need to use
///* that subsystem's quit function (SDL_VideoQuit()) directly instead. But
///* generally, you should not be using those functions directly anyhow; use
///* SDL_Init() instead.
///*
///* You still need to call SDL_Quit() even if you close all open subsystems
///* with SDL_QuitSubSystem().
///*
///*  flags any of the flags used by SDL_Init(); see SDL_Init for details.
///*
///* since This function is available since SDL 2.0.0.
///*
///*  SDL_InitSubSystem
///* SDL_Quit
///*/
pub extern fn SDL_QuitSubSystem(flags: u32) void;
///* Get a mask of the specified subsystems which are currently initialized.
///*
///* flags any of the flags used by SDL_Init(); see SDL_Init for details.
///* returns a mask of all initialized subsystems if `flags` is 0, otherwise it
///*          returns the initialization status of the specified subsystems.
///*
///*          The return value does not include SDL_INIT_NOPARACHUTE.
///*
///* since This function is available since SDL 2.0.0.
///*
///*  SDL_Init
///*  SDL_InitSubSystem
///*/
pub extern fn SDL_WasInit(flags: u32) u32;
///
///* Clean up all initialized subsystems.
///*
///* You should call this function even if you have already shutdown each
///* initialized subsystem with SDL_QuitSubSystem(). It is safe to call this
///* function even in the case of errors in initialization.
///*
///* If you start a subsystem using a call to that subsystem's init function
///* (for example SDL_VideoInit()) instead of SDL_Init() or SDL_InitSubSystem(),
///* then you must use that subsystem's quit function (SDL_VideoQuit()) to shut
///* it down before calling SDL_Quit(). But generally, you should not be using
///* those functions directly anyhow; use SDL_Init() instead.
///*
///* You can use this function with atexit() to ensure that it is run when your
///* application is shutdown, but it is not wise to do this from a library or
///* other dynamically loaded code.
///*
///* since This function is available since SDL 2.0.0.
///*
///*  SDL_Init
///* SDL_QuitSubSystem
///*/
pub extern fn SDL_Quit(void) void;
