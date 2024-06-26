import face_recognition
import cv2
import numpy as np

#   1. Process each video frame at 1/4 resolution (though still display it at full resolution)
#   2. Only detect faces in every other frame of video.


# Get a reference to webcam #0 (the default one)
cap = cv2.VideoCapture(0)

# Load a sample picture and learn how to recognize it.
obamaImage = face_recognition.load_image_file("obama.jpg")
obamaFaceCode = face_recognition.face_encodings(obamaImage)[0]

# Load a second sample picture and learn how to recognize it.
bidenImage = face_recognition.load_image_file("biden.jpg")
bidenFaceCode = face_recognition.face_encodings(bidenImage)[0]

# Create arrays of known face encodings and their names
knownFaceCode = [
    obamaFaceCode,
    bidenFaceCode
]
knownFaceNames = [
    "Barack Obama",
    "Joe Biden"
]

# Initialize some variables
faceLoc = []
faceCode = []
faceNames = []
process_this_frame = True

while True:
    # Grab a single frame of video
    ret, frame = cap.read()

    # Only process every other frame of video to save time
    if process_this_frame:
        # Resize frame of video to 1/4 size for faster face recognition processing
        small_frame = cv2.resize(frame, (0, 0), fx=0.25, fy=0.25)

        # Convert the image from BGR color (which OpenCV uses) to RGB color (which face_recognition uses)
        rgb_small_frame = small_frame[:, :, ::-1]
        
        # Find all the faces and face encodings in the current frame of video
        faceLoc = face_recognition.face_locations(rgb_small_frame)
        faceCode = face_recognition.face_encodings(rgb_small_frame, faceLoc)

        faceNames = []
        for face_encoding in faceCode:
            # See if the face is a match for the known face(s)
            matches = face_recognition.compare_faces(knownFaceCode, face_encoding)
            name = "Unknown"

            # # If a match was found in known_face_encodings, just use the first one.
            # if True in matches:
            #     first_match_index = matches.index(True)
            #     name = known_face_names[first_match_index]

            # Or instead, use the known face with the smallest distance to the new face
            face_distances = face_recognition.face_distance(knownFaceCode, face_encoding)
            best_match_index = np.argmin(face_distances)
            if matches[best_match_index]:
                name = knownFaceNames[best_match_index]

            faceNames.append(name)

    process_this_frame = not process_this_frame


    # Display the results
    for (top, right, bottom, left), name in zip(faceLoc, faceNames):
        # Scale back up face locations since the frame we detected in was scaled to 1/4 size
        top *= 4
        right *= 4
        bottom *= 4
        left *= 4

        # Draw a box around the face
        cv2.rectangle(frame, (left, top), (right, bottom), (0, 0, 255), 2)

        # Draw a label with a name below the face
        cv2.rectangle(frame, (left, bottom - 35), (right, bottom), (0, 0, 255), cv2.FILLED)
        font = cv2.FONT_HERSHEY_DUPLEX
        cv2.putText(frame, name, (left + 6, bottom - 6), font, 1.0, (255, 255, 255), 1)

    # Display the resulting image
    cv2.imshow('Video', frame)

    # Hit 'q' on the keyboard to quit!
    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

# Release handle to the webcam
cap.release()
cv2.destroyAllWindows()