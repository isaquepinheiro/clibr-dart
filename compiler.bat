cd bin
dart compile exe dmfbr.dart -o dmfbr.exe --target-os windows
rem dart compile exe dmfbr.dart -o dmfbr_win.exe --target-os windows
rem dart compile exe dmfbr.dart -o dmfbr_linux --target-os linux
rem dart compile exe dmfbr.dart -o dmfbr_macos --target-os macos

7z a -tzip dmfbr_windows-x64.zip dmfbr.exe templates/* -r
rem 7z a -tzip dmfbr_linux-amd64.zip dmfbr_linux templates/*.pas -r
rem 7z a -tzip dmfbr_macos-x64.zip dmfbr_macos templates/*.pas -r
cd ..