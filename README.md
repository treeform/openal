# Nim OpenAL wrapper

![OpenAL Logo](https://upload.wikimedia.org/wikipedia/en/thumb/2/28/OpenAL_logo.png/200px-OpenAL_logo.png)

`nimble install openal`

![Github Actions](https://github.com/treeform/openal/workflows/Github%20Actions/badge.svg)

[API reference](https://treeform.github.io/openal)

This library has no dependencies other than the Nim standard library.

## About

An OpenAL wrapper for nim. OpenAL is a cross platform way to play sounds.

OpenAL works on:
* Windows
* macOS
* Linux

Its great for games because it can play sounds in 3d and apply effects to them.

Great reference on how to use openAL:

https://github.com/kcat/openal-soft/wiki/Programmer's-Guide

Small example on how to use this nim library:

```nim

import openal, os, readwav

var
  # sound by DANMITCH3LL: https://freesound.org/people/DANMITCH3LL/sounds/232009/
  wav = readWav("xylophone-sweep.wav") # read wav file using simple helper utility
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

```
# API: openal

```nim
import openal
```

## **type** ALuint


```nim
ALuint = cuint
```

## **type** ALint


```nim
ALint = cint
```

## **type** ALsizei


```nim
ALsizei = cint
```

## **type** ALenum


```nim
ALenum = cint
```

## **type** ALfloat


```nim
ALfloat = float32
```

## **type** ALdouble


```nim
ALdouble = float64
```

## **const** AL_SOURCE_RELATIVE


```nim
AL_SOURCE_RELATIVE = 0x00000202
```

## **const** AL_CONE_INNER_ANGLE


```nim
AL_CONE_INNER_ANGLE = 0x00001001
```

## **const** AL_CONE_OUTER_ANGLE


```nim
AL_CONE_OUTER_ANGLE = 0x00001002
```

## **const** AL_PITCH


```nim
AL_PITCH = 0x00001003
```

## **const** AL_POSITION


```nim
AL_POSITION = 0x00001004
```

## **const** AL_DIRECTION


```nim
AL_DIRECTION = 0x00001005
```

## **const** AL_VELOCITY


```nim
AL_VELOCITY = 0x00001006
```

## **const** AL_LOOPING


```nim
AL_LOOPING = 0x00001007
```

## **const** AL_BUFFER


```nim
AL_BUFFER = 0x00001009
```

## **const** AL_GAIN


```nim
AL_GAIN = 0x0000100A
```

## **const** AL_MIN_GAIN


```nim
AL_MIN_GAIN = 0x0000100D
```

## **const** AL_MAX_GAIN


```nim
AL_MAX_GAIN = 0x0000100E
```

## **const** AL_ORIENTATION


```nim
AL_ORIENTATION = 0x0000100F
```

## **const** AL_SOURCE_STATE


```nim
AL_SOURCE_STATE = 0x00001010
```

## **const** AL_INITIAL


```nim
AL_INITIAL = 0x00001011
```

## **const** AL_PLAYING


```nim
AL_PLAYING = 0x00001012
```

## **const** AL_PAUSED


```nim
AL_PAUSED = 0x00001013
```

## **const** AL_STOPPED


```nim
AL_STOPPED = 0x00001014
```

## **const** AL_BUFFERS_QUEUED


```nim
AL_BUFFERS_QUEUED = 0x00001015
```

## **const** AL_BUFFERS_PROCESSED


```nim
AL_BUFFERS_PROCESSED = 0x00001016
```

## **const** AL_SEC_OFFSET


```nim
AL_SEC_OFFSET = 0x00001024
```

## **const** AL_SAMPLE_OFFSET


```nim
AL_SAMPLE_OFFSET = 0x00001025
```

## **const** AL_BYTE_OFFSET


```nim
AL_BYTE_OFFSET = 0x00001026
```

## **const** AL_SOURCE_TYPE


```nim
AL_SOURCE_TYPE = 0x00001027
```

## **const** AL_STATIC


```nim
AL_STATIC = 0x00001028
```

## **const** AL_STREAMING


```nim
AL_STREAMING = 0x00001029
```

## **const** AL_UNDETERMINED


```nim
AL_UNDETERMINED = 0x00001030
```

## **const** AL_FORMAT_MONO8


```nim
AL_FORMAT_MONO8 = 0x00001100
```

## **const** AL_FORMAT_MONO16


```nim
AL_FORMAT_MONO16 = 0x00001101
```

## **const** AL_FORMAT_STEREO8


```nim
AL_FORMAT_STEREO8 = 0x00001102
```

## **const** AL_FORMAT_STEREO16


```nim
AL_FORMAT_STEREO16 = 0x00001103
```

## **const** AL_REFERENCE_DISTANCE


```nim
AL_REFERENCE_DISTANCE = 0x00001020
```

## **const** AL_ROLLOFF_FACTOR


```nim
AL_ROLLOFF_FACTOR = 0x00001021
```

## **const** AL_CONE_OUTER_GAIN


```nim
AL_CONE_OUTER_GAIN = 0x00001022
```

## **const** AL_MAX_DISTANCE


```nim
AL_MAX_DISTANCE = 0x00001023
```

## **const** AL_FREQUENCY


```nim
AL_FREQUENCY = 0x00002001
```

## **const** AL_BITS


```nim
AL_BITS = 0x00002002
```

## **const** AL_CHANNELS


```nim
AL_CHANNELS = 0x00002003
```

## **const** AL_SIZE


```nim
AL_SIZE = 0x00002004
```

## **const** AL_UNUSED


```nim
AL_UNUSED = 0x00002010
```

## **const** AL_PENDING


```nim
AL_PENDING = 0x00002011
```

## **const** AL_PROCESSED


```nim
AL_PROCESSED = 0x00002012
```

## **const** AL_NO_ERROR


```nim
AL_NO_ERROR = false
```

## **const** AL_INVALID_NAME


```nim
AL_INVALID_NAME = 0x0000A001
```

## **const** AL_INVALID_ENUM


```nim
AL_INVALID_ENUM = 0x0000A002
```

## **const** AL_INVALID_VALUE


```nim
AL_INVALID_VALUE = 0x0000A003
```

## **const** AL_INVALID_OPERATION


```nim
AL_INVALID_OPERATION = 0x0000A004
```

## **const** AL_OUT_OF_MEMORY


```nim
AL_OUT_OF_MEMORY = 0x0000A005
```

## **const** AL_VENDOR


```nim
AL_VENDOR = 0x0000B001
```

## **const** AL_VERSION


```nim
AL_VERSION = 0x0000B002
```

## **const** AL_RENDERER


```nim
AL_RENDERER = 0x0000B003
```

## **const** AL_EXTENSIONS


```nim
AL_EXTENSIONS = 0x0000B004
```

## **const** AL_DOPPLER_FACTOR


```nim
AL_DOPPLER_FACTOR = 0x0000C000
```

## **const** AL_DOPPLER_VELOCITY


```nim
AL_DOPPLER_VELOCITY = 0x0000C001
```

## **const** AL_SPEED_OF_SOUND


```nim
AL_SPEED_OF_SOUND = 0x0000C003
```

## **const** AL_DISTANCE_MODEL


```nim
AL_DISTANCE_MODEL = 0x0000D000
```

## **const** AL_INVERSE_DISTANCE


```nim
AL_INVERSE_DISTANCE = 0x0000D001
```

## **const** AL_INVERSE_DISTANCE_CLAMPED


```nim
AL_INVERSE_DISTANCE_CLAMPED = 0x0000D002
```

## **const** AL_LINEAR_DISTANCE


```nim
AL_LINEAR_DISTANCE = 0x0000D003
```

## **const** AL_LINEAR_DISTANCE_CLAMPED


```nim
AL_LINEAR_DISTANCE_CLAMPED = 0x0000D004
```

## **const** AL_EXPONENT_DISTANCE


```nim
AL_EXPONENT_DISTANCE = 0x0000D005
```

## **const** AL_EXPONENT_DISTANCE_CLAMPED


```nim
AL_EXPONENT_DISTANCE_CLAMPED = 0x0000D006
```

## **const** AL_PRIORITY


```nim
AL_PRIORITY = 0x0000E001
```

## **const** AL_PRIORITY_SLOTS


```nim
AL_PRIORITY_SLOTS = 0x0000E002
```

## **proc** alEnable


```nim
proc alEnable(capability: ALenum) {.cdecl, importc.}
```

## **proc** alDisable


```nim
proc alDisable(capability: ALenum) {.cdecl, importc.}
```

## **proc** alIsEnabled


```nim
proc alIsEnabled(capability: ALenum): bool {.cdecl, importc.}
```

## **proc** alGetString


```nim
proc alGetString(param: ALenum): ptr char {.cdecl, importc.}
```

## **proc** alGetBooleanv


```nim
proc alGetBooleanv(param: ALenum; data: ptr bool) {.cdecl, importc.}
```

## **proc** alGetIntegerv


```nim
proc alGetIntegerv(param: ALenum; data: ptr ALint) {.cdecl, importc.}
```

## **proc** alGetFloatv


```nim
proc alGetFloatv(param: ALenum; data: ptr ALfloat) {.cdecl, importc.}
```

## **proc** alGetDoublev


```nim
proc alGetDoublev(param: ALenum; data: ptr ALdouble) {.cdecl, importc.}
```

## **proc** alGetBoolean


```nim
proc alGetBoolean(param: ALenum): bool {.cdecl, importc.}
```

## **proc** alGetInteger


```nim
proc alGetInteger(param: ALenum): ALint {.cdecl, importc.}
```

## **proc** alGetFloat


```nim
proc alGetFloat(param: ALenum): ALfloat {.cdecl, importc.}
```

## **proc** alGetDouble


```nim
proc alGetDouble(param: ALenum): ALdouble {.cdecl, importc.}
```

## **proc** alGetError


```nim
proc alGetError(): ALenum {.cdecl, importc.}
```

## **proc** alIsExtensionPresent


```nim
proc alIsExtensionPresent(extname: ptr char): bool {.cdecl, importc.}
```

## **proc** alGetProcAddress


```nim
proc alGetProcAddress(fname: ptr char): pointer {.cdecl, importc.}
```

## **proc** alGetEnumValue


```nim
proc alGetEnumValue(ename: ptr char): ALenum {.cdecl, importc.}
```

## **proc** alListenerf


```nim
proc alListenerf(param: ALenum; value: ALfloat) {.cdecl, importc.}
```

## **proc** alListener3f


```nim
proc alListener3f(param: ALenum; value1: ALfloat; value2: ALfloat; value3: ALfloat) {.cdecl, importc.}
```

## **proc** alListenerfv


```nim
proc alListenerfv(param: ALenum; values: ptr ALfloat) {.cdecl, importc.}
```

## **proc** alListeneri


```nim
proc alListeneri(param: ALenum; value: ALint) {.cdecl, importc.}
```

## **proc** alListener3i


```nim
proc alListener3i(param: ALenum; value1: ALint; value2: ALint; value3: ALint) {.cdecl, importc.}
```

## **proc** alListeneriv


```nim
proc alListeneriv(param: ALenum; values: ptr ALint) {.cdecl, importc.}
```

## **proc** alGetListenerf


```nim
proc alGetListenerf(param: ALenum; value: ptr ALfloat) {.cdecl, importc.}
```

## **proc** alGetListener3f


```nim
proc alGetListener3f(param: ALenum; value1: ptr ALfloat; value2: ptr ALfloat;
                    value3: ptr ALfloat) {.cdecl, importc.}
```

## **proc** alGetListenerfv


```nim
proc alGetListenerfv(param: ALenum; values: ptr ALfloat) {.cdecl, importc.}
```

## **proc** alGetListeneri


```nim
proc alGetListeneri(param: ALenum; value: ptr ALint) {.cdecl, importc.}
```

## **proc** alGetListener3i


```nim
proc alGetListener3i(param: ALenum; value1: ptr ALint; value2: ptr ALint;
                    value3: ptr ALint) {.cdecl, importc.}
```

## **proc** alGetListeneriv


```nim
proc alGetListeneriv(param: ALenum; values: ptr ALint) {.cdecl, importc.}
```

## **proc** alGenSources


```nim
proc alGenSources(n: ALsizei; sources: ptr ALuint) {.cdecl, importc.}
```

## **proc** alDeleteSources


```nim
proc alDeleteSources(n: ALsizei; sources: ptr ALuint) {.cdecl, importc.}
```

## **proc** alIsSource


```nim
proc alIsSource(sid: ALuint): bool {.cdecl, importc.}
```

## **proc** alSourcef


```nim
proc alSourcef(sid: ALuint; param: ALenum; value: ALfloat) {.cdecl, importc.}
```

## **proc** alSource3f


```nim
proc alSource3f(sid: ALuint; param: ALenum; value1: ALfloat; value2: ALfloat;
               value3: ALfloat) {.cdecl, importc.}
```

## **proc** alSourcefv


```nim
proc alSourcefv(sid: ALuint; param: ALenum; values: ptr ALfloat) {.cdecl, importc.}
```

## **proc** alSourcei


```nim
proc alSourcei(sid: ALuint; param: ALenum; value: ALint) {.cdecl, importc.}
```

## **proc** alSource3i


```nim
proc alSource3i(sid: ALuint; param: ALenum; value1: ALint; value2: ALint; value3: ALint) {.cdecl, importc.}
```

## **proc** alSourceiv


```nim
proc alSourceiv(sid: ALuint; param: ALenum; values: ptr ALint) {.cdecl, importc.}
```

## **proc** alGetSourcef


```nim
proc alGetSourcef(sid: ALuint; param: ALenum; value: ptr ALfloat) {.cdecl, importc.}
```

## **proc** alGetSource3f


```nim
proc alGetSource3f(sid: ALuint; param: ALenum; value1: ptr ALfloat; value2: ptr ALfloat;
                  value3: ptr ALfloat) {.cdecl, importc.}
```

## **proc** alGetSourcefv


```nim
proc alGetSourcefv(sid: ALuint; param: ALenum; values: ptr ALfloat) {.cdecl, importc.}
```

## **proc** alGetSourcei


```nim
proc alGetSourcei(sid: ALuint; param: ALenum; value: ptr ALint) {.cdecl, importc.}
```

## **proc** alGetSource3i


```nim
proc alGetSource3i(sid: ALuint; param: ALenum; value1: ptr ALint; value2: ptr ALint;
                  value3: ptr ALint) {.cdecl, importc.}
```

## **proc** alGetSourceiv


```nim
proc alGetSourceiv(sid: ALuint; param: ALenum; values: ptr ALint) {.cdecl, importc.}
```

## **proc** alSourcePlayv


```nim
proc alSourcePlayv(ns: ALsizei; sids: ptr ALuint) {.cdecl, importc.}
```

## **proc** alSourceStopv


```nim
proc alSourceStopv(ns: ALsizei; sids: ptr ALuint) {.cdecl, importc.}
```

## **proc** alSourceRewindv


```nim
proc alSourceRewindv(ns: ALsizei; sids: ptr ALuint) {.cdecl, importc.}
```

## **proc** alSourcePausev


```nim
proc alSourcePausev(ns: ALsizei; sids: ptr ALuint) {.cdecl, importc.}
```

## **proc** alSourcePlay


```nim
proc alSourcePlay(sid: ALuint) {.cdecl, importc.}
```

## **proc** alSourceStop


```nim
proc alSourceStop(sid: ALuint) {.cdecl, importc.}
```

## **proc** alSourceRewind


```nim
proc alSourceRewind(sid: ALuint) {.cdecl, importc.}
```

## **proc** alSourcePause


```nim
proc alSourcePause(sid: ALuint) {.cdecl, importc.}
```

## **proc** alSourceQueueBuffers


```nim
proc alSourceQueueBuffers(sid: ALuint; numEntries: ALsizei; bids: ptr ALuint) {.cdecl, importc.}
```

## **proc** alSourceUnqueueBuffers


```nim
proc alSourceUnqueueBuffers(sid: ALuint; numEntries: ALsizei; bids: ptr ALuint) {.cdecl, importc.}
```

## **proc** alGenBuffers


```nim
proc alGenBuffers(n: ALsizei; buffers: ptr ALuint) {.cdecl, importc.}
```

## **proc** alDeleteBuffers


```nim
proc alDeleteBuffers(n: ALsizei; buffers: ptr ALuint) {.cdecl, importc.}
```

## **proc** alIsBuffer


```nim
proc alIsBuffer(bid: ALuint): bool {.cdecl, importc.}
```

## **proc** alBufferData


```nim
proc alBufferData(bid: ALuint; format: ALenum; data: pointer; size: ALsizei;
                 freq: ALsizei) {.cdecl, importc.}
```

## **proc** alBufferf


```nim
proc alBufferf(bid: ALuint; param: ALenum; value: ALfloat) {.cdecl, importc.}
```

## **proc** alBuffer3f


```nim
proc alBuffer3f(bid: ALuint; param: ALenum; value1: ALfloat; value2: ALfloat;
               value3: ALfloat) {.cdecl, importc.}
```

## **proc** alBufferfv


```nim
proc alBufferfv(bid: ALuint; param: ALenum; values: ptr ALfloat) {.cdecl, importc.}
```

## **proc** alBufferi


```nim
proc alBufferi(bid: ALuint; param: ALenum; value: ALint) {.cdecl, importc.}
```

## **proc** alBuffer3i


```nim
proc alBuffer3i(bid: ALuint; param: ALenum; value1: ALint; value2: ALint; value3: ALint) {.cdecl, importc.}
```

## **proc** alBufferiv


```nim
proc alBufferiv(bid: ALuint; param: ALenum; values: ptr ALint) {.cdecl, importc.}
```

## **proc** alGetBufferf


```nim
proc alGetBufferf(bid: ALuint; param: ALenum; value: ptr ALfloat) {.cdecl, importc.}
```

## **proc** alGetBuffer3f


```nim
proc alGetBuffer3f(bid: ALuint; param: ALenum; value1: ptr ALfloat; value2: ptr ALfloat;
                  value3: ptr ALfloat) {.cdecl, importc.}
```

## **proc** alGetBufferfv


```nim
proc alGetBufferfv(bid: ALuint; param: ALenum; values: ptr ALfloat) {.cdecl, importc.}
```

## **proc** alGetBufferi


```nim
proc alGetBufferi(bid: ALuint; param: ALenum; value: ptr ALint) {.cdecl, importc.}
```

## **proc** alGetBuffer3i


```nim
proc alGetBuffer3i(bid: ALuint; param: ALenum; value1: ptr ALint; value2: ptr ALint;
                  value3: ptr ALint) {.cdecl, importc.}
```

## **proc** alGetBufferiv


```nim
proc alGetBufferiv(bid: ALuint; param: ALenum; values: ptr ALint) {.cdecl, importc.}
```

## **proc** alDopplerFactor


```nim
proc alDopplerFactor(value: ALfloat) {.cdecl, importc.}
```

## **proc** alDopplerVelocity


```nim
proc alDopplerVelocity(value: ALfloat) {.cdecl, importc.}
```

## **proc** alSpeedOfSound


```nim
proc alSpeedOfSound(value: ALfloat) {.cdecl, importc.}
```

## **proc** alDistanceModel


```nim
proc alDistanceModel(distanceModel: ALenum) {.cdecl, importc.}
```

## **const** ALCAPI


```nim
ALCAPI = true
```

## **const** ALCAPIENTRY


```nim
ALCAPIENTRY = true
```

## **const** ALC_INVALID


```nim
ALC_INVALID = 0
```

## **const** ALC_VERSION_0_1


```nim
ALC_VERSION_0_1 = 1
```

## **type** ALCchar


```nim
ALCchar = char
```

## **type** ALCbyte


```nim
ALCbyte = cchar
```

## **type** ALCubyte


```nim
ALCubyte = cuchar
```

## **type** ALCshort


```nim
ALCshort = cshort
```

## **type** ALCushort


```nim
ALCushort = cushort
```

## **type** ALCint


```nim
ALCint = cint
```

## **type** ALCuint


```nim
ALCuint = cuint
```

## **type** ALCsizei


```nim
ALCsizei = cint
```

## **type** ALCenum


```nim
ALCenum = cint
```

## **type** ALCfloat


```nim
ALCfloat = cfloat
```

## **type** ALCdouble


```nim
ALCdouble = cdouble
```

## **type** ALCdevice


```nim
ALCdevice = pointer
```

## **type** ALCcontext


```nim
ALCcontext = pointer
```

## **const** ALC_FALSE


```nim
ALC_FALSE = 0
```

## **const** ALC_TRUE


```nim
ALC_TRUE = 1
```

## **const** ALC_FREQUENCY


```nim
ALC_FREQUENCY = 0x00001007
```

## **const** ALC_REFRESH


```nim
ALC_REFRESH = 0x00001008
```

## **const** ALC_SYNC


```nim
ALC_SYNC = 0x00001009
```

## **const** ALC_MONO_SOURCES


```nim
ALC_MONO_SOURCES = 0x00001010
```

## **const** ALC_STEREO_SOURCES


```nim
ALC_STEREO_SOURCES = 0x00001011
```

## **const** ALC_NO_ERROR


```nim
ALC_NO_ERROR = 0
```

## **const** ALC_INVALID_DEVICE


```nim
ALC_INVALID_DEVICE = 0x0000A001
```

## **const** ALC_INVALID_CONTEXT


```nim
ALC_INVALID_CONTEXT = 0x0000A002
```

## **const** ALC_INVALID_ENUM


```nim
ALC_INVALID_ENUM = 0x0000A003
```

## **const** ALC_INVALID_VALUE


```nim
ALC_INVALID_VALUE = 0x0000A004
```

## **const** ALC_OUT_OF_MEMORY


```nim
ALC_OUT_OF_MEMORY = 0x0000A005
```

## **const** ALC_DEFAULT_DEVICE_SPECIFIER


```nim
ALC_DEFAULT_DEVICE_SPECIFIER = 0x00001004
```

## **const** ALC_DEVICE_SPECIFIER


```nim
ALC_DEVICE_SPECIFIER = 0x00001005
```

## **const** ALC_EXTENSIONS


```nim
ALC_EXTENSIONS = 0x00001006
```

## **const** ALC_MAJOR_VERSION


```nim
ALC_MAJOR_VERSION = 0x00001000
```

## **const** ALC_MINOR_VERSION


```nim
ALC_MINOR_VERSION = 0x00001001
```

## **const** ALC_ATTRIBUTES_SIZE


```nim
ALC_ATTRIBUTES_SIZE = 0x00001002
```

## **const** ALC_ALL_ATTRIBUTES


```nim
ALC_ALL_ATTRIBUTES = 0x00001003
```

## **const** ALC_CAPTURE_DEVICE_SPECIFIER


```nim
ALC_CAPTURE_DEVICE_SPECIFIER = 0x00000310
```

## **const** ALC_CAPTURE_DEFAULT_DEVICE_SPECIFIER


```nim
ALC_CAPTURE_DEFAULT_DEVICE_SPECIFIER = 0x00000311
```

## **const** ALC_CAPTURE_SAMPLES


```nim
ALC_CAPTURE_SAMPLES = 0x00000312
```

## **proc** alcCreateContext


```nim
proc alcCreateContext(device: ALCdevice; attrlist: ptr ALCint): ALCcontext {.cdecl, importc.}
```

## **proc** alcMakeContextCurrent


```nim
proc alcMakeContextCurrent(context: ALCcontext): bool {.cdecl, importc.}
```

## **proc** alcProcessContext


```nim
proc alcProcessContext(context: ALCcontext) {.cdecl, importc.}
```

## **proc** alcSuspendContext


```nim
proc alcSuspendContext(context: ALCcontext) {.cdecl, importc.}
```

## **proc** alcDestroyContext


```nim
proc alcDestroyContext(context: ALCcontext) {.cdecl, importc.}
```

## **proc** alcGetCurrentContext


```nim
proc alcGetCurrentContext(): ALCcontext {.cdecl, importc.}
```

## **proc** alcGetContextsDevice


```nim
proc alcGetContextsDevice(context: ALCcontext): ALCdevice {.cdecl, importc.}
```

## **proc** alcOpenDevice


```nim
proc alcOpenDevice(devicename: ptr ALCchar): ALCdevice {.cdecl, importc.}
```

## **proc** alcCloseDevice


```nim
proc alcCloseDevice(device: ALCdevice): bool {.cdecl, importc.}
```

## **proc** alcGetError


```nim
proc alcGetError(device: ALCdevice): ALCenum {.cdecl, importc.}
```

## **proc** alcIsExtensionPresent


```nim
proc alcIsExtensionPresent(device: ALCdevice; extname: ptr ALCchar): bool {.cdecl, importc.}
```

## **proc** alcGetProcAddress


```nim
proc alcGetProcAddress(device: ALCdevice; funcname: ptr ALCchar): pointer {.cdecl, importc.}
```

## **proc** alcGetEnumValue


```nim
proc alcGetEnumValue(device: ALCdevice; enumname: ptr ALCchar): ALCenum {.cdecl, importc.}
```

## **proc** alcGetString


```nim
proc alcGetString(device: ALCdevice; param: ALCenum): ptr ALCchar {.cdecl, importc.}
```

## **proc** alcGetIntegerv


```nim
proc alcGetIntegerv(device: ALCdevice; param: ALCenum; size: ALCsizei; data: ptr ALCint) {.cdecl, importc.}
```

## **proc** alcCaptureOpenDevice


```nim
proc alcCaptureOpenDevice(devicename: ptr ALCchar; frequency: ALCuint;
                         format: ALCenum; buffersize: ALCsizei): ALCdevice {.cdecl, importc.}
```

## **proc** alcCaptureCloseDevice


```nim
proc alcCaptureCloseDevice(device: ALCdevice): bool {.cdecl, importc.}
```

## **proc** alcCaptureStart


```nim
proc alcCaptureStart(device: ALCdevice) {.cdecl, importc.}
```

## **proc** alcCaptureStop


```nim
proc alcCaptureStop(device: ALCdevice) {.cdecl, importc.}
```

## **proc** alcCaptureSamples


```nim
proc alcCaptureSamples(device: ALCdevice; buffer: pointer; samples: ALCsizei) {.cdecl, importc.}
```
