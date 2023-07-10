dart compile exe bin/dmfbr.dart -o bin/dmfbr.exe --target-os windows
dart compile exe bin/dmfbr.dart -o bin/dmfbr_win.exe --target-os windows
dart compile exe bin/dmfbr.dart -o bin/dmfbr_linux --target-os linux
dart compile exe bin/dmfbr.dart -o bin/dmfbr_macos --target-os macos

7z a -tzip bin/dmfbr_windows-x64.zip bin/dmfbr_win.exe bin/templates\* -r
7z a -tzip bin/dmfbr_linux-amd64.zip bin/dmfbr_linux bin/templates\* -r
7z a -tzip bin/dmfbr_macos-x64.zip bin/dmfbr_macos bin/templates\* -r