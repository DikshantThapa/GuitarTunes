import glob
import librosa
import json
import os


data_directory = "data/Music/"


def preprocess_wav(file_path):
    audio, sr = librosa.load(file_path, sr=None)
    mfccs = librosa.feature.mfcc(y=audio, sr=sr, n_mfcc=20)
    mfccs_normalized = (mfccs - mfccs.mean()) / mfccs.std()    
    return mfccs_normalized.tolist()

wav_files = glob.glob(os.path.join(data_directory, "*.wav"))
for file_path in wav_files:
    filename = os.path.basename(file_path)
    
    processed_data = preprocess_wav(file_path)
    
    output_filename = os.path.splitext(filename)[0] + ".json"
    output_path = os.path.join(data_directory, output_filename)
    with open(output_path, "w") as json_file:
        json.dump(processed_data, json_file)
    
    print(f"Processed {filename} and saved as {output_filename}")
