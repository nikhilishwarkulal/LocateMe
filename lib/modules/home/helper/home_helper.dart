mixin HomeHelper {
  double convertSizeToDraggableSheetValue(
      {required double height, required double screenHeight}) {
    const maxSheetValue = 1;

    ///Below is the logic
    ///[screenHeight]  =  [maxSheetValue]
    ///[height]        =  [?]
    ///
    ///[height] * [maxSheetValue] / [screenHeight]
    return height * maxSheetValue / screenHeight;
  }

  /// [getMinSizeDraggableSheetValue] this is where draggable sheet will not
  /// be seen
  double getMinSizeDraggableSheetValue(double screenHeight) {
    return convertSizeToDraggableSheetValue(
        height: 0, screenHeight: screenHeight);
  }

  /// [getMinSizeDraggableSheetValue] this is where draggable sheet will go to
  /// the top touching the appbar.
  double getMaxSizeDraggableSheetValue(double screenHeight, double topPadding) {
    return convertSizeToDraggableSheetValue(
        height: screenHeight - 56 - topPadding, screenHeight: screenHeight);
  }

  /// [getStepSizeLowDraggableSheetValue] will make the draggable sheet
  /// to it lowest form
  double getStepSizeLowDraggableSheetValue(
      double screenHeight, double bottomPadding) {
    final val = convertSizeToDraggableSheetValue(
        height: 182 + bottomPadding, screenHeight: screenHeight);
    if (val > 0.8) return 0.8;
    return val;
  }

  /// [getStepSizeLowDraggableSheetValue] will make the draggable sheet
  /// to it second lowest form
  double getStepSizeMidDraggableSheetValue(
      double screenHeight, double bottomPadding) {
    final val = convertSizeToDraggableSheetValue(
        height: 300 + bottomPadding, screenHeight: screenHeight);
    if (val > 0.8) return 0.8;
    return val;
  }

  /// [getStepSizeLowDraggableSheetValue] will make the draggable sheet
  /// go to 80% of the screen
  double getStepSizeHighDraggableSheetValue(double screenHeight) {
    return 0.8;
  }
}
