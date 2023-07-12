dart compile exe bin/dmfbr.dart -o bin/dmfbr.exe --target-os windows
rem dart compile exe bin/dmfbr.dart -o bin/dmfbr_win.exe --target-os windows
rem dart compile exe bin/dmfbr.dart -o bin/dmfbr_linux --target-os linux
rem dart compile exe bin/dmfbr.dart -o bin/dmfbr_macos --target-os macos

7z a -tzip bin/dmfbr_windows-x64.zip bin/dmfbr.exe bin/\*.pas -r
rem 7z a -tzip bin/dmfbr_linux-amd64.zip bin/dmfbr_linux bin/\*.pas -r
rem 7z a -tzip bin/dmfbr_macos-x64.zip bin/dmfbr_macos bin/\*.pas -r