/*
To run this app correctly first we need to configure the following:
1. Firebase Services
    1: firebase phone authentication
    2: firestore database
    3: Storage (for images)
    4: App Check



Other Configs Notes

when using the image_picker library in ios we have to add the following in the 
<project root>/ios/Runner/Info.plist before the dictionary ends

    <key>NSPhotoLibraryUsageDescription</key>      // gallery key
    <string>Photo library use for user profile picture</string>   // reason or specifics for gallery permission
    <key>NSCameraUsageDescription</key>            // camera key
    <string>Camera use for user profile picture</string>   // reason for camera permission
    <key>NSMicrophoneUsageDescription</key>        // mic key
    <string>Mic use while video recording</string>       // reason for mic usage
 
*/
