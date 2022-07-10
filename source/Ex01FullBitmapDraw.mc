import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

class Ex01FullBitmapDraw extends WatchUi.WatchFace {
    private var _buffer as BufferedBitmapReference?;

    function initialize() {
        WatchFace.initialize();
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        self._buffer = Graphics.createBufferedBitmap({
            :width => dc.getWidth(),
            :height => dc.getHeight(),
        });
        var bdc = (self._buffer.get() as BufferedBitmap).getDc();
        bdc.setColor(Graphics.COLOR_BLUE, Graphics.COLOR_BLUE);
        bdc.clear();
    }
    function onUpdate(dc as Dc) {}
    function onPartialUpdate(dc as Dc) {
        var buffer = self._buffer;
        if (buffer != null) {
            dc.drawBitmap(0, 0, buffer);
        }
    }
}
