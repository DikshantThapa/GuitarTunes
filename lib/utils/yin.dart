double autocorrelation(List<double> magnitudeSquared, int sampleRate) {
  final int N = magnitudeSquared.length;
  final List<double> autocorrelation = List.filled(N, 0);

  for (int lag = 0; lag < N; ++lag) {
    double sum = 0.0;
    for (int i = 0; i < N - lag; ++i) {
      sum += magnitudeSquared[i] * magnitudeSquared[i + lag];
    }
    autocorrelation[lag] = sum;
  }

  final indexOfPeak = findPeakIndex(autocorrelation);

  return sampleRate / indexOfPeak;
}

int findPeakIndex(List<double> autocorrelationArray) {
  int peakIndex = 0;
  double maxValue = 0;
  for (int i = 0; i < autocorrelationArray.length; i++) {
    if (autocorrelationArray[i] > maxValue) {
      maxValue = autocorrelationArray[i];
      peakIndex = i;
    }
  }
  return peakIndex;
}
