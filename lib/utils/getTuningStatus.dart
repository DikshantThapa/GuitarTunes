String getTuningStatus(double smoothedGaugeValue) {
  if (smoothedGaugeValue >= -0.5 && smoothedGaugeValue <= 0.5) {
    return "Tuned";
  } else if (smoothedGaugeValue < -1) {
    return "Tuned Low";
  } else {
    return "Tuned High";
  }
}
