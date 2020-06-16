
type
  ALuint* = cuint
  ALint* = cint
  ALsizei* = cint
  ALenum* = cint
  ALfloat* = float32
  ALdouble* = float64

when defined(linux):
  {.passL: "-lopenal"}
  {.push importc.}
elif defined(windows):
  {.push cdecl, dynlib: "OpenAL32.dll", importc.}
else:
  when defined(macosx) or defined(ios):
    {.passL: "-framework OpenAL".}
  {.push importc.}

const
  # Indicate Source has relative coordinates.
  AL_SOURCE_RELATIVE* = 0x00000202

  # Directional source, inner cone angle, in degrees.
  # Range:    [0-360]
  # Default:  360
  AL_CONE_INNER_ANGLE* = 0x00001001

  # Directional source, outer cone angle, in degrees.
  # Range:    [0-360]
  # Default:  360
  AL_CONE_OUTER_ANGLE* = 0x00001002

  # Specify the pitch to be applied at source.
  # Range:   [0.5-2.0]
  # Default: 1.0
  AL_PITCH* = 0x00001003

  # Specify the current location in three dimensional space.
  # OpenAL, like OpenGL, uses a right handed coordinate system,
  # where in a frontal default view X (thumb) points right,
  # Y points up (index finger), and Z points towards the
  # viewer/camera (middle finger).
  # To switch from a left handed coordinate system, flip the
  # sign on the Z coordinate.
  # Listener position is always in the world coordinate system.
  AL_POSITION* = 0x00001004

  # Specify the current direction.
  AL_DIRECTION* = 0x00001005

  # Specify the current velocity in three dimensional space.
  AL_VELOCITY* = 0x00001006

  # Indicate whether source is looping.
  # Type: bool?
  # Range:   [AL_TRUE, AL_FALSE]
  # Default: FALSE.
  AL_LOOPING* = 0x00001007

  # Indicate the buffer to provide sound samples.
  # Type: ALuint.
  # Range: any valid Buffer id.
  AL_BUFFER* = 0x00001009

  # Indicate the gain (volume amplification) applied.
  # Type:   ALfloat.
  # Range:  ]0.0-  ]
  # A value of 1.0 means un-attenuated/unchanged.
  # Each division by 2 equals an attenuation of -6dB.
  # Each multiplicaton with 2 equals an amplification of +6dB.
  # A value of 0.0 is meaningless with respect to a logarithmic
  # scale; it is interpreted as zero volume - the channel
  # is effectively disabled.
  AL_GAIN* = 0x0000100A

  # Indicate minimum source attenuation
  # Type: ALfloat
  # Range:  [0.0 - 1.0]
  # Logarthmic
  AL_MIN_GAIN* = 0x0000100D

  # Indicate maximum source attenuation
  # Type: ALfloat
  # Range:  [0.0 - 1.0]
  # Logarthmic
  AL_MAX_GAIN* = 0x0000100E

  # Indicate listener orientation.
  # at/up
  AL_ORIENTATION* = 0x0000100F

  # Source state information.
  AL_SOURCE_STATE* = 0x00001010
  AL_INITIAL* = 0x00001011
  AL_PLAYING* = 0x00001012
  AL_PAUSED* = 0x00001013
  AL_STOPPED* = 0x00001014

  # Buffer Queue params
  AL_BUFFERS_QUEUED* = 0x00001015
  AL_BUFFERS_PROCESSED* = 0x00001016

  # Source buffer position information
  AL_SEC_OFFSET* = 0x00001024
  AL_SAMPLE_OFFSET* = 0x00001025
  AL_BYTE_OFFSET* = 0x00001026

  # Source type (Static, Streaming or undetermined)
  # Source is Static if a Buffer has been attached using AL_BUFFER
  # Source is Streaming if one or more Buffers have been attached using alSourceQueueBuffers
  # Source is undetermined when it has the NULL buffer attached
  AL_SOURCE_TYPE* = 0x00001027
  AL_STATIC* = 0x00001028
  AL_STREAMING* = 0x00001029
  AL_UNDETERMINED* = 0x00001030

  # Sound samples: format specifier.
  AL_FORMAT_MONO8* = 0x00001100
  AL_FORMAT_MONO16* = 0x00001101
  AL_FORMAT_STEREO8* = 0x00001102
  AL_FORMAT_STEREO16* = 0x00001103

  # source specific reference distance
  # Type: ALfloat
  # Range:  0.0 - +inf
  # At 0.0, no distance attenuation occurs.  Default is
  AL_REFERENCE_DISTANCE* = 0x00001020

  # source specific rolloff factor
  # Type: ALfloat
  # Range:  0.0 - +inf
  AL_ROLLOFF_FACTOR* = 0x00001021

  # Directional source, outer cone gain.
  # Default:  0.0
  # Range:    [0.0 - 1.0]
  # Logarithmic
  AL_CONE_OUTER_GAIN* = 0x00001022

  # Indicate distance above which sources are not
  # attenuated using the inverse clamped distance model.
  # Default: +inf
  # Type: ALfloat
  # Range:  0.0 - +inf
  AL_MAX_DISTANCE* = 0x00001023

  # Sound samples: frequency, in units of Hertz [Hz].
  # This is the number of samples per second. Half of the
  # sample frequency marks the maximum significant
  # frequency component.
  AL_FREQUENCY* = 0x00002001
  AL_BITS* = 0x00002002
  AL_CHANNELS* = 0x00002003
  AL_SIZE* = 0x00002004

  # Buffer state.
  # Not supported for public use (yet).
  AL_UNUSED* = 0x00002010
  AL_PENDING* = 0x00002011
  AL_PROCESSED* = 0x00002012

  # Errors: No Error.
  AL_NO_ERROR* = 0x00000000

  # Invalid Name paramater passed to AL call.
  AL_INVALID_NAME* = 0x0000A001

  # Invalid parameter passed to AL call.
  AL_INVALID_ENUM* = 0x0000A002

  # Invalid enum parameter value.
  AL_INVALID_VALUE* = 0x0000A003

  # Illegal call.
  AL_INVALID_OPERATION* = 0x0000A004

  # No mojo.
  AL_OUT_OF_MEMORY* = 0x0000A005

  # Context strings: Vendor Name.
  AL_VENDOR* = 0x0000B001
  AL_VERSION* = 0x0000B002
  AL_RENDERER* = 0x0000B003
  AL_EXTENSIONS* = 0x0000B004

  # Global tweakage.

  # Doppler scale.  Default 1.0
  AL_DOPPLER_FACTOR* = 0x0000C000

  # Tweaks speed of propagation.
  AL_DOPPLER_VELOCITY* = 0x0000C001

  # Speed of Sound in units per second
  AL_SPEED_OF_SOUND* = 0x0000C003

  # Distance models
  # used in conjunction with DistanceModel
  # implicit: NONE, which disances distance attenuation.
  AL_DISTANCE_MODEL* = 0x0000D000
  AL_INVERSE_DISTANCE* = 0x0000D001
  AL_INVERSE_DISTANCE_CLAMPED* = 0x0000D002
  AL_LINEAR_DISTANCE* = 0x0000D003
  AL_LINEAR_DISTANCE_CLAMPED* = 0x0000D004
  AL_EXPONENT_DISTANCE* = 0x0000D005
  AL_EXPONENT_DISTANCE_CLAMPED* = 0x0000D006

  # Priority
  # Apportable Extension.
  # Used to prevent dynamic throttling of this source  #
  AL_PRIORITY* = 0x0000E001
  AL_PRIORITY_SLOTS* = 0x0000E002

# Renderer State management
proc alEnable*(capability: ALenum)
proc alDisable*(capability: ALenum)
proc alIsEnabled*(capability: ALenum): bool

# State retrieval
proc alGetString*(param: ALenum): cstring
proc alGetBooleanv*(param: ALenum; data: ptr bool)
proc alGetIntegerv*(param: ALenum; data: ptr ALint)
proc alGetFloatv*(param: ALenum; data: ptr ALfloat)
proc alGetDoublev*(param: ALenum; data: ptr ALdouble)
proc alGetBoolean*(param: ALenum): bool
proc alGetInteger*(param: ALenum): ALint
proc alGetFloat*(param: ALenum): ALfloat
proc alGetDouble*(param: ALenum): ALdouble

# Error support.
# Obtain the most recent error generated in the AL state machine.
proc alGetError*(): ALenum

# Extension support.
# Query for the presence of an extension, and obtain any appropriate
# function pointers and enum values.
proc alIsExtensionPresent*(extname: cstring): bool
proc alGetProcAddress*(fname: cstring): pointer
proc alGetEnumValue*(ename: cstring): ALenum

# LISTENER
# Listener represents the location and orientation of the
# 'user' in 3D-space.
# Properties include: -
# Gain         AL_GAIN         ALfloat
# Position     AL_POSITION     ALfloat[3]
# Velocity     AL_VELOCITY     ALfloat[3]
# Orientation  AL_ORIENTATION  ALfloat[6] (Forward then Up vectors)

# Set Listener parameters
proc alListenerf*(param: ALenum; value: ALfloat)
proc alListener3f*(param: ALenum; value1: ALfloat; value2: ALfloat; value3: ALfloat)
proc alListenerfv*(param: ALenum; values: ptr ALfloat)
proc alListeneri*(param: ALenum; value: ALint)
proc alListener3i*(param: ALenum; value1: ALint; value2: ALint; value3: ALint)
proc alListeneriv*(param: ALenum; values: ptr ALint)

# Get Listener parameters
proc alGetListenerf*(param: ALenum; value: ptr ALfloat)
proc alGetListener3f*(param: ALenum; value1: ptr ALfloat; value2: ptr ALfloat; value3: ptr ALfloat)
proc alGetListenerfv*(param: ALenum; values: ptr ALfloat)
proc alGetListeneri*(param: ALenum; value: ptr ALint)
proc alGetListener3i*(param: ALenum; value1: ptr ALint; value2: ptr ALint; value3: ptr ALint)
proc alGetListeneriv*(param: ALenum; values: ptr ALint)

# SOURCE
# Sources represent individual sound objects in 3D-space.
# Sources take the PCM data provided in the specified Buffer,
# apply Source-specific modifications, and then
# submit them to be mixed according to spatial arrangement etc.
# Properties include: -
# Gain                              AL_GAIN                 ALfloat
# Min Gain                          AL_MIN_GAIN             ALfloat
# Max Gain                          AL_MAX_GAIN             ALfloat
# Position                          AL_POSITION             ALfloat[3]
# Velocity                          AL_VELOCITY             ALfloat[3]
# Direction                         AL_DIRECTION            ALfloat[3]
# Head Relative Mode                AL_SOURCE_RELATIVE      ALint (AL_TRUE or AL_FALSE)
# Reference Distance                AL_REFERENCE_DISTANCE   ALfloat
# Max Distance                      AL_MAX_DISTANCE         ALfloat
# RollOff Factor                    AL_ROLLOFF_FACTOR       ALfloat
# Inner Angle                       AL_CONE_INNER_ANGLE     ALint or ALfloat
# Outer Angle                       AL_CONE_OUTER_ANGLE     ALint or ALfloat
# Cone Outer Gain                   AL_CONE_OUTER_GAIN      ALint or ALfloat
# Pitch                             AL_PITCH                ALfloat
# Looping                           AL_LOOPING              ALint (AL_TRUE or AL_FALSE)
# MS Offset                         AL_MSEC_OFFSET          ALint or ALfloat
# Byte Offset                       AL_BYTE_OFFSET          ALint or ALfloat
# Sample Offset                     AL_SAMPLE_OFFSET        ALint or ALfloat
# Attached Buffer                   AL_BUFFER               ALint
# State (Query only)                AL_SOURCE_STATE         ALint
# Buffers Queued (Query only)       AL_BUFFERS_QUEUED       ALint
# Buffers Processed (Query only)    AL_BUFFERS_PROCESSED    ALint

# Create Source objects
proc alGenSources*(n: ALsizei; sources: ptr ALuint)

# Delete Source objects
proc alDeleteSources*(n: ALsizei; sources: ptr ALuint)

# Verify a handle is a valid Source
proc alIsSource*(sid: ALuint): bool

# Set Source parameters
proc alSourcef*(sid: ALuint; param: ALenum; value: ALfloat)
proc alSource3f*(sid: ALuint; param: ALenum; value1: ALfloat; value2: ALfloat; value3: ALfloat)
proc alSourcefv*(sid: ALuint; param: ALenum; values: ptr ALfloat)
proc alSourcei*(sid: ALuint; param: ALenum; value: ALint)
proc alSource3i*(sid: ALuint; param: ALenum; value1: ALint; value2: ALint; value3: ALint)
proc alSourceiv*(sid: ALuint; param: ALenum; values: ptr ALint)

# Get Source parameters
proc alGetSourcef*(sid: ALuint; param: ALenum; value: ptr ALfloat)
proc alGetSource3f*(sid: ALuint; param: ALenum; value1: ptr ALfloat; value2: ptr ALfloat; value3: ptr ALfloat)
proc alGetSourcefv*(sid: ALuint; param: ALenum; values: ptr ALfloat)
proc alGetSourcei*(sid: ALuint; param: ALenum; value: ptr ALint)
proc alGetSource3i*(sid: ALuint; param: ALenum; value1: ptr ALint; value2: ptr ALint; value3: ptr ALint)
proc alGetSourceiv*(sid: ALuint; param: ALenum; values: ptr ALint)

# Source vector based playback calls
# Play, replay, or resume (if paused) a list of Sources
proc alSourcePlayv*(ns: ALsizei; sids: ptr ALuint)

# Stop a list of Sources
proc alSourceStopv*(ns: ALsizei; sids: ptr ALuint)

# Rewind a list of Sources
proc alSourceRewindv*(ns: ALsizei; sids: ptr ALuint)

# Pause a list of Sources
proc alSourcePausev*(ns: ALsizei; sids: ptr ALuint)

# Source based playback calls
# Play, replay, or resume a Source
proc alSourcePlay*(sid: ALuint)

# Stop a Source
proc alSourceStop*(sid: ALuint)

# Rewind a Source (set playback postiton to beginning)
proc alSourceRewind*(sid: ALuint)

# Pause a Source
proc alSourcePause*(sid: ALuint)

# Source Queuing
proc alSourceQueueBuffers*(sid: ALuint; numEntries: ALsizei; bids: ptr ALuint)
proc alSourceUnqueueBuffers*(sid: ALuint; numEntries: ALsizei; bids: ptr ALuint)

# BUFFER
# Buffer objects are storage space for sample data.
# Buffers are referred to by Sources. One Buffer can be used
# by multiple Sources.
# Properties include: -
# Frequency (Query only)    AL_FREQUENCY      ALint
# Size (Query only)         AL_SIZE           ALint
# Bits (Query only)         AL_BITS           ALint
# Channels (Query only)     AL_CHANNELS       ALint

# Create Buffer objects
proc alGenBuffers*(n: ALsizei; buffers: ptr ALuint)

# Delete Buffer objects
proc alDeleteBuffers*(n: ALsizei; buffers: ptr ALuint)

# Verify a handle is a valid Buffer
proc alIsBuffer*(bid: ALuint): bool

# Specify the data to be copied into a buffer
proc alBufferData*(bid: ALuint; format: ALenum; data: pointer; size: ALsizei; freq: ALsizei)

# Set Buffer parameters
proc alBufferf*(bid: ALuint; param: ALenum; value: ALfloat)
proc alBuffer3f*(bid: ALuint; param: ALenum; value1: ALfloat; value2: ALfloat; value3: ALfloat)
proc alBufferfv*(bid: ALuint; param: ALenum; values: ptr ALfloat)
proc alBufferi*(bid: ALuint; param: ALenum; value: ALint)
proc alBuffer3i*(bid: ALuint; param: ALenum; value1: ALint; value2: ALint; value3: ALint)
proc alBufferiv*(bid: ALuint; param: ALenum; values: ptr ALint)

# Get Buffer parameters
proc alGetBufferf*(bid: ALuint; param: ALenum; value: ptr ALfloat)
proc alGetBuffer3f*(bid: ALuint; param: ALenum; value1: ptr ALfloat; value2: ptr ALfloat; value3: ptr ALfloat)
proc alGetBufferfv*(bid: ALuint; param: ALenum; values: ptr ALfloat)
proc alGetBufferi*(bid: ALuint; param: ALenum; value: ptr ALint)
proc alGetBuffer3i*(bid: ALuint; param: ALenum; value1: ptr ALint; value2: ptr ALint; value3: ptr ALint)
proc alGetBufferiv*(bid: ALuint; param: ALenum; values: ptr ALint)

# Global Parameters
proc alDopplerFactor*(value: ALfloat)
proc alDopplerVelocity*(value: ALfloat)
proc alSpeedOfSound*(value: ALfloat)
proc alDistanceModel*(distanceModel: ALenum)


{.pop.}

include openal/alc
