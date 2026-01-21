param([string]$acd)
#Get Path and File name from input File path
$lastIndex = $acd.LastIndexOf('\')
$path = $acd.Substring(0, $lastIndex)
$file = $acd.Substring($lastIndex + 1)

#Create Paths for Temp files and Output
$temp = "$path\temp_$file"
$templ5x = "$temp.l5x"
$outputdir = "$path\plc"

#Create Temp file for Running Commands on
Copy-Item -Path $acd -Destination $temp

#Create Temp L5X File
C:\Build\ra-logix-designer-vcs-custom-tools-cr\artifacts\bin\Release\\l5xgit.exe acd2l5x --acd "$temp" --l5x "$templ5x"

#Explode L5X file to Output Directory
C:\Build\ra-logix-designer-vcs-custom-tools-cr\artifacts\bin\Release\\l5xgit.exe explode --force --l5x "$templ5x" --dir $outputdir

#Cleanup Temp File
Remove-Item -Path $temp
Remove-Item -Path $templ5x