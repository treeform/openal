when defined(windows):
  {.push cdecl, dynlib: "OpenAL32.dll", importc.}
else:
  {.push importc.}

const
  ALCAPI* = true
  ALCAPIENTRY* = true
  ALC_INVALID* = 0
  ALC_VERSION_0_1* = 1

type
  ALCchar* = char
  ALCbyte* = cchar
  ALCubyte* = cuchar
  ALCshort* = cshort
  ALCushort* = cushort
  ALCint* = cint
  ALCuint* = cuint
  ALCsizei* = cint
  ALCenum* = cint
  ALCfloat* = cfloat
  ALCdouble* = cdouble

  ALCdevice* = pointer
  ALCcontext* = pointer

const

  # Boolean False.
  ALC_FALSE* = 0

  # Boolean True.
  ALC_TRUE* = 1

  # followed by <int> Hz
  ALC_FREQUENCY* = 0x00001007

  # followed by <int> Hz
  ALC_REFRESH* = 0x00001008

  # followed by AL_TRUE, AL_FALSE
  ALC_SYNC* = 0x00001009

  # followed by <int> Num of requested Mono (3D) Sources
  ALC_MONO_SOURCES* = 0x00001010

  # followed by <int> Num of requested Stereo Sources
  ALC_STEREO_SOURCES* = 0x00001011

  # errors

  # No error
  ALC_NO_ERROR* = ALC_FALSE

  # No device
  ALC_INVALID_DEVICE* = 0x0000A001

  # invalid context ID
  ALC_INVALID_CONTEXT* = 0x0000A002

  # bad enum
  ALC_INVALID_ENUM* = 0x0000A003

  # bad value
  ALC_INVALID_VALUE* = 0x0000A004

  # Out of memory.
  ALC_OUT_OF_MEMORY* = 0x0000A005

  # The Specifier string for default device
  ALC_DEFAULT_DEVICE_SPECIFIER* = 0x00001004
  ALC_DEVICE_SPECIFIER* = 0x00001005
  ALC_EXTENSIONS* = 0x00001006
  ALC_MAJOR_VERSION* = 0x00001000
  ALC_MINOR_VERSION* = 0x00001001
  ALC_ATTRIBUTES_SIZE* = 0x00001002
  ALC_ALL_ATTRIBUTES* = 0x00001003

  # Capture extension
  ALC_CAPTURE_DEVICE_SPECIFIER* = 0x00000310
  ALC_CAPTURE_DEFAULT_DEVICE_SPECIFIER* = 0x00000311
  ALC_CAPTURE_SAMPLES* = 0x00000312

# Context Management
proc alcCreateContext*(device: ALCdevice; attrlist: ptr ALCint): ALCcontext
proc alcMakeContextCurrent*(context: ALCcontext): bool
proc alcProcessContext*(context: ALCcontext)
proc alcSuspendContext*(context: ALCcontext)
proc alcDestroyContext*(context: ALCcontext)
proc alcGetCurrentContext*(): ALCcontext
proc alcGetContextsDevice*(context: ALCcontext): ALCdevice

# Device Management
proc alcOpenDevice*(devicename: cstring): ALCdevice
proc alcCloseDevice*(device: ALCdevice): bool

# Error support.

# Obtain the most recent Context error
proc alcGetError*(device: ALCdevice): ALCenum

# Extension support.
# Query for the presence of an extension, and obtain any appropriate
# function pointers and enum values.
proc alcIsExtensionPresent*(device: ALCdevice; extname: cstring): bool
proc alcGetProcAddress*(device: ALCdevice; funcname: cstring): pointer
proc alcGetEnumValue*(device: ALCdevice; enumname: cstring): ALCenum

# Query functions
proc alcGetString*(device: ALCdevice; param: ALCenum): cstring
proc alcGetIntegerv*(device: ALCdevice; param: ALCenum; size: ALCsizei; data: ptr ALCint)

# Capture functions
proc alcCaptureOpenDevice*(devicename: cstring; frequency: ALCuint; format: ALCenum; buffersize: ALCsizei): ALCdevice
proc alcCaptureCloseDevice*(device: ALCdevice): bool
proc alcCaptureStart*(device: ALCdevice)
proc alcCaptureStop*(device: ALCdevice)
proc alcCaptureSamples*(device: ALCdevice; buffer: pointer; samples: ALCsizei)

{.pop.}
