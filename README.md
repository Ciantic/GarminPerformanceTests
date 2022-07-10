# Performance notes of Garmin drawing routines

All tests ran in simulator with FR955

## 1. Drawing full bitmap from BufferedBitmapReference:

Example view: `Ex01FullBitmapDraw` in low power mode:

Total time: 55123 \
Execution time: 862 \
Graphics time: 181 \
Display time: 54080

Fails also the low power mode cutoff

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

## 4. Drawin quarter of full bitmap with setClip

`Ex04QuarterBitmap` another finding! This takes longer than drawing half a screen of bitmap? What is going on?

Total time: 28289 \
Execution time: 1149 \
Graphics time: 100 \
Display time: 27040

## 5. Drawing quarter of quarter bitmap with drawBitmap's offset

`Ex05QuarterBitmapOffset` another finding! This takes longer than drawing quarter of a screen of bitmap, this time `drawBitmap` first and second argument are not helping!

Total time: 55198 \
Execution time: 938 \
Graphics time: 181 \
Display time: 54080

## 6. Drawing quarter of quarter bitmap with drawBitmap's offset and dc setClip

`Ex06QuaterBitmapClip` here we seem to prove that cutting your bitmaps to smaller pieces does not in fact give performance benefits. So far most convinient way to draw a quarter is 4. with just simple setClip.

Total time: 28364 \
Execution time: 1224 \
Graphics time: 100 \
Display time: 27040
