$platform = $args[0]
$platform_path = ""
$out_path = ""

if ($platform -eq "win" -or $platform -eq $null) {
    $platform_path = "src/win"
    $out_path = "out/win"
} else {
    $platform_path = "src/pd"
    $out_path = "out/pd"
}

#echo "Building platform lib"
#odin build "$(platform_path)/platform" -build-mode=static -out:${out_path}/platform.lib
#
#if (!$?) {
#    echo failed to build platform lib
#    return
#}
#
#echo "Building game lib"
#odin build ./src/game -build-mode=static -out:"${out_path}/game.lib"
#
#if (!$?) {
#    echo failed to build game lib
#    return
#}
#
#echo "Building executable"
#odin build $platform_plat -out:"${out_path}/game.exe" 

$platform_col = "${platform_path}/platform"

odin build $platform_path -collection:platform=$platform_col -out:"${out_path}/game.exe"
