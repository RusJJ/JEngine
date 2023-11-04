$NDKPath = Get-Content $PSScriptRoot/NDKPath.txt
Write-Output "NDK located at: $NDKPath"

$buildScript = "$NDKPath/build/ndk-build"
if (-not ($PSVersionTable.PSEdition -eq "Core")) {
    $buildScript += ".cmd"
}

Write-Output "[BUILD] Starting NDK..."

Write-Output "[BUILD] JEngine:"
& $buildScript NDK_PROJECT_PATH=$PSScriptRoot APP_BUILD_SCRIPT=$PSScriptRoot/src/Android.mk NDK_APPLICATION_MK=$PSScriptRoot/src/Application.mk NDK_DEBUG=0 -j12

Write-Output "[BUILD] JoltPhysics:"
& $buildScript NDK_PROJECT_PATH=$PSScriptRoot APP_BUILD_SCRIPT=$PSScriptRoot/thirdparty/Android.Jolt.mk NDK_APPLICATION_MK=$PSScriptRoot/thirdparty/Application.Jolt.mk NDK_DEBUG=0 -j12

Write-Output "[BUILD] Compilation is done!"

Exit $LASTEXITCODE