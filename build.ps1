dotnet build -c Release

#Copy Executable and BMP to bin
Copy-Item -Path ".\src\l5xgit\Assets\l5xhelper.exe" -Destination ".\artifacts\bin\Release\Assets\l5xhelper.exe"
Copy-Item -Path ".\src\l5xgit\Assets\explode.bmp" -Destination ".\artifacts\bin\Release\Assets\explode.bmp"