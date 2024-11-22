$platform = $args[0]
$platform_path = ""
$out_path = ""

$build_mode = ""
$opt = ""

if ($platform -eq "win" -or $platform -eq $null) {
    $platform_path = "src/win"
    $out_path = "out/win/game.exe"
    $build_mode = "exe"
} else {
    $platform_path = "src/pd"
    $out_path = "out/pd/lib/pdex.dll"
    $build_mode = "shared"
    $build_opt = "-default-to-nil-allocator"
}

$platform_col = "${platform_path}/platform"
odin build $platform_path -collection:platform=$platform_col -out:$out_path "-build-mode=${build_mode}" $opt

if ($platform -eq "pd") {
    pdc ./out/pd/lib ./out/pd/game.pdx
}