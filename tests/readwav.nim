import streams

type WavFile* = object
  data*: pointer
  size*: int
  freq*: int
  channels*: int

proc readWav*(
  path: string,
  ): WavFile =
  # load PCM data from wav file
  var f = newFileStream(open(path))
  let
    chunkID = f.readStr(4)
    chunkSize = f.readUint32()
    format = f.readStr(4)

    subchunk1ID = f.readStr(4)
    subchunk1Size = f.readUint32()
    audioFormat = f.readUint16()
    numChannels = f.readUint16()
    sampleRate = f.readUint32()
    byteRate = f.readUint32()
    blockAlign = f.readUint16()
    bitsPerSample2 = f.readUint16()

    subchunk2ID = f.readStr(4)
    subchunk2Size = f.readUint32()

    data = f.readStr(int subchunk2Size)

  assert chunkID == "RIFF"
  assert format == "WAVE"
  assert subchunk1ID == "fmt "
  assert audioFormat == 1
  assert subchunk2ID == "data"

  result.channels = int numChannels
  result.size = data.len
  result.freq = int sampleRate
  result.data = unsafeAddr data[0]
