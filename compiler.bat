cd bin
dart compile exe clibr.dart -o clibr.exe --target-os windows
rem dart compile exe clibr.dart -o clibr_win.exe --target-os windows
rem dart compile exe clibr.dart -o clibr_linux --target-os linux
rem dart compile exe clibr.dart -o clibr_macos --target-os macos

7z a -tzip clibr_windows-x64.zip clibr.exe templates/* -r
rem 7z a -tzip clibr_linux-amd64.zip clibr_linux templates/*.pas -r
rem 7z a -tzip clibr_macos-x64.zip clibr_macos templates/*.pas -r
cd ..