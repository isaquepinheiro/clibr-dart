@echo off
cd bin
dart compile exe clibr.dart -o clibr.exe --target-os windows
echo Dart compilation completed.

7z a -tzip clibr_windows-x64.zip clibr.exe templates/* -r
echo 7-Zip compression completed for Windows.

cd ..
