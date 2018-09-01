import openal, os, readwav

var
  # sound by DANMITCH3LL: https://freesound.org/people/DANMITCH3LL/sounds/232009/
  wav = readWav("tests/xylophone-sweep.wav") # read wav file using simple helper utility
  buffer = ALuint(0) # buffer is like a record of a sound
  source = ALuint(0) # source is like a record player, it can play 1 buffer at a time

# open setup and error handling
let device = alcOpenDevice(nil)
if device == nil: quit "OpenAL: failed to get default device"
let ctx = device.alcCreateContext(nil)
if ctx == nil: quit "OpenAL: failed to create context"
if not alcMakeContextCurrent(ctx): quit "OpenAL: failed to make context current"

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
if not alcCloseDevice(device): quit "OpenAL: failed to close device"
