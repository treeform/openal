# Nim OpenAL wrapper

![OpenAL Logo](https://upload.wikimedia.org/wikipedia/en/thumb/2/28/OpenAL_logo.png/200px-OpenAL_logo.png)

An OpenAL wrapper for nim. OpenAL is a cross platform way to play sounds.

It works on:
* Windows
* macOS
* Linux

Its great for games because it can play sounds in 3d and apply effects to them.

Great reference on how to use openAL:

https://github.com/kcat/openal-soft/wiki/Programmer's-Guide

Small example on how to use this nim library:

```nim

import openal, streams, os, readwav

var
  # sound by DANMITCH3LL: https://freesound.org/people/DANMITCH3LL/sounds/232009/
  wav = readWav("xylophone-sweep.wav") # read wav file using simple helper utility
  buffer = ALuint(0) # buffer is like a record of a sound
  source = ALuint(0) # source is like a recprd player, it can play 1 buffer at a time

# open setup and error handling
let device = alcOpenDevice(nil)
if device == nil: quit "failed to get default device"
let ctx = device.alcCreateContext(nil)
if ctx == nil: quit "failed to create context"
if not alcMakeContextCurrent(ctx): quit "failed to make current"

# setup buffer
alGenBuffers(ALsizei 1, addr buffer)
alBufferData(buffer, AL_FORMAT_MONO16, wav.data, ALsizei wav.size, ALsizei wav.freq)

# setup source
alGenSources(ALsizei 1, addr source)
alSourcei(source, AL_BUFFER, Alint buffer)
alSourcePlay(source)

# wait for sound to finish playing
sleep(2500)

# taredown and error handling
alDeleteSources(1, addr source)
alDeleteBuffers(1, addr buffer)
alcDestroyContext(ctx)
if not alcCloseDevice(device): quit "failed to close device"

```