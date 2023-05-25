double calculateSmoothedGaugeValue(double detectedPitch, double standardPitch,
    double previousSmoothedValue, double smoothingFactor) {
  // Calculate the difference between the detected pitch and the standard pitch
  double pitchDifference = detectedPitch - standardPitch;

  // Map the pitch difference to the range -10 to 10
  double gaugeValue = (pitchDifference / standardPitch) * 10;

  // Apply exponential smoothing
  double smoothedValue = (smoothingFactor * gaugeValue) +
      ((1 - smoothingFactor) * previousSmoothedValue);

  return smoothedValue;
}
