import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

class WatchDelegate extends WatchUi.WatchFaceDelegate {
    public function initialize() {
        WatchFaceDelegate.initialize();
    }

    public function onPowerBudgetExceeded(
        powerInfo as WatchFacePowerInfo
    ) as Void {
        System.println(
            "Average execution time: " + powerInfo.executionTimeAverage
        );
        System.println(
            "Allowed execution time: " + powerInfo.executionTimeLimit
        );
    }
}
