<#
.SYNOPSIS
    Script will re-create/re-generate go source files from .proto files by using 'protoc' app
.NOTES
    Install latest protoc:
    - Download latest release from: https://github.com/protocolbuffers/protobuf/releases
    - Extract to any folder
    - Make sure that system PATH include this folder and you could run protoc.exe from anywhere
.LINK
    https://grpc.io/
    https://grpc.io/docs/protoc-installation/
#>

$pathToProtosFolder = Resolve-Path -Path "..\cmd\api\proto" -Relative

$commandLineArguments = "--go_out=$pathToProtosFolder", '--go_opt=paths=source_relative', "--go-grpc_out=$pathToProtosFolder", '--go-grpc_opt=paths=source_relative', "--proto_path=$pathToProtosFolder", "$pathToProtosFolder\*.proto"

$startProcessArguments = @{
    NoNewWindow     = $true
    Wait            = $true
    FilePath        = 'protoc.exe'
    ArgumentList    = $commandLineArguments
}

Start-Process @startProcessArguments
