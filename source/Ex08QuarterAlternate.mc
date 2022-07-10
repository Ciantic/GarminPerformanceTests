import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

var ALTERNATE as Lang.Number = -1;

class Ex08QuarterAlternate extends WatchUi.WatchFace {
    private var _buffer as BufferedBitmapReference?;
    private var _buffer2 as BufferedBitmapReference?;
    private var _buffer3 as BufferedBitmapReference?;
    private var _buffer4 as BufferedBitmapReference?;
    private var _buffer5 as BufferedBitmapReference?;

    function initialize() {
        WatchFace.initialize();
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        {
            self._buffer = Graphics.createBufferedBitmap({
                :width => dc.getWidth(),
                :height => dc.getHeight(),
            });
            var bdc = (self._buffer.get() as BufferedBitmap).getDc();
            bdc.setColor(Graphics.COLOR_BLUE, Graphics.COLOR_BLUE);
            bdc.clear();
        }

        {
            self._buffer2 = Graphics.createBufferedBitmap({
                :width => dc.getWidth(),
                :height => dc.getHeight(),
            });
            var bdc = (self._buffer2.get() as BufferedBitmap).getDc();
            bdc.setColor(Graphics.COLOR_BLUE, Graphics.COLOR_RED);
            bdc.clear();
        }

        {
            self._buffer3 = Graphics.createBufferedBitmap({
                :width => dc.getWidth(),
                :height => dc.getHeight(),
            });
            var bdc = (self._buffer3.get() as BufferedBitmap).getDc();
            bdc.setColor(Graphics.COLOR_BLUE, Graphics.COLOR_YELLOW);
            bdc.clear();
        }

        {
            self._buffer4 = Graphics.createBufferedBitmap({
                :width => dc.getWidth(),
                :height => dc.getHeight(),
            });
            var bdc = (self._buffer4.get() as BufferedBitmap).getDc();
            bdc.setColor(Graphics.COLOR_BLUE, Graphics.COLOR_GREEN);
            bdc.clear();
        }
        {
            self._buffer5 = Graphics.createBufferedBitmap({
                :width => dc.getWidth(),
                :height => dc.getHeight(),
            });
            var bdc = (self._buffer5.get() as BufferedBitmap).getDc();
            bdc.setColor(Graphics.COLOR_BLUE, Graphics.COLOR_PURPLE);
            bdc.clear();
        }
    }
    function onUpdate(dc as Dc) {}
    function onPartialUpdate(dc as Dc) {
        ALTERNATE++;
        // Top left
        if (ALTERNATE % 5 == 0) {
            dc.setClip(0, 0, dc.getWidth() / 2, dc.getHeight() / 2);
            dc.drawBitmap(0, 0, self._buffer as BufferedBitmapReference);
        } else if (ALTERNATE % 5 == 1) {
            dc.setClip(
                dc.getWidth() / 2,
                0,
                dc.getWidth() / 2,
                dc.getHeight() / 2
            );
            dc.drawBitmap(0, 0, self._buffer2 as BufferedBitmapReference);
        } else if (ALTERNATE % 5 == 2) {
            dc.setClip(
                dc.getWidth() / 2,
                dc.getWidth() / 2,
                dc.getWidth() / 2,
                dc.getHeight() / 2
            );
            dc.drawBitmap(0, 0, self._buffer3 as BufferedBitmapReference);
        } else if (ALTERNATE % 5 == 3) {
            dc.setClip(
                0,
                dc.getWidth() / 2,
                dc.getWidth() / 2,
                dc.getHeight() / 2
            );
            dc.drawBitmap(0, 0, self._buffer4 as BufferedBitmapReference);
        } else if (ALTERNATE % 5 == 4) {
            dc.setClip(
                dc.getWidth() / 4,
                dc.getWidth() / 4,
                dc.getWidth() / 2,
                dc.getHeight() / 2
            );
            dc.drawBitmap(0, 0, self._buffer5 as BufferedBitmapReference);
        }
    }
}
