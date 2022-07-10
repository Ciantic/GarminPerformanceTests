# Performance notes of Garmin drawing routines

All tests ran in simulator with FR955

## 1. Drawing full bitmap from BufferedBitmapReference:

Example view: `Ex01FullBitmapDraw` in low power mode:

```
Average execution time: 55.123001
Allowed execution time: 30.000000
```

## 2. Drawing half of bitmap BufferedBitmapReference with setClip

Example view: `Ex02HalfBitmapDrawClip` in low power mode:

Diagnostics screen says:

Total time: 28202 \
Execution time: 1062 \
Graphics time: 100 \
Display time: 27040

## 3. Drawing half of bitmap BufferedBitmapReference with drawOffsetBitmap

Notably, this renders exactly same screen as 2. but is very slow! First finding! Never use `drawOffsetBitmap`, instead use `setClip` like in previous.

Example view: `Ex03HalfBitmapDrawOffset` in low power mode:

Diagnostics screen says:

Total time: 55285 \
Execution time: 1024 \
Graphics time: 181 \
Display time: 54080
