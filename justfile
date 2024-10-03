set windows-shell := ['nu', '-n', '-c']
set dotenv-load

default *args:
    just publish {{args}}
    just run

build *args:
    just build-client {{args}}
    just build-server {{args}}

build-server *args:
    dotnet build ./projects/altv/CnR.Server/CnR.Server.csproj {{args}}

build-client *args:
    dotnet build ./projects/altv/CnR.Client/CnR.Client.csproj {{args}}

publish *args:
    just publish-client {{args}}
    just publish-server {{args}}

publish-server *args:
    dotnet publish ./projects/altv/CnR.Server/CnR.Server.csproj {{args}}

publish-client *args:
    dotnet publish ./projects/altv/CnR.Client/CnR.Client.csproj {{args}}

run:
    ./altv-server.exe

[windows]
update: update-server update-modules update-data

[windows]
update-server:
    curl https://cdn.alt-mp.com/server/release/x64_win32/altv-crash-handler.exe -o altv-crash-handler.exe
    curl https://cdn.alt-mp.com/server/release/x64_win32/altv-server.exe -o altv-server.exe
    curl https://cdn.alt-mp.com/coreclr-module/release/x64_win32/AltV.Net.Host.dll -o AltV.Net.Host.dll
    curl https://cdn.alt-mp.com/coreclr-module/release/x64_win32/AltV.Net.Host.runtimeconfig.json -o AltV.Net.Host.runtimeconfig.json

[windows]
update-modules:
    mkdir modules
    curl https://cdn.alt-mp.com/coreclr-module/release/x64_win32/modules/csharp-module.dll -o modules/csharp-module.dll

[windows]
update-data:
    mkdir data
    curl https://cdn.alt-mp.com/data/release/data/vehmodels.bin -o data/vehmodels.bin
    curl https://cdn.alt-mp.com/data/release/data/vehmods.bin -o data/vehmods.bin
    curl https://cdn.alt-mp.com/data/release/data/clothes.bin -o data/clothes.bin
    curl https://cdn.alt-mp.com/data/release/data/pedmodels.bin -o data/pedmodels.bin
    curl https://cdn.alt-mp.com/data/release/data/rpfdata.bin  -o data/rpfdata.bin 
    curl https://cdn.alt-mp.com/data/release/data/weaponmodels.bin -o data/weaponmodels.bin
