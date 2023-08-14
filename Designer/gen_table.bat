set WORKSPACE=..
set LUBAN_DLL=%WORKSPACE%\Tools\Luban\Luban.dll
set CONF_ROOT=.
set CLIENT=..\Client

dotnet %LUBAN_DLL% ^
    -t all ^
    -d json ^
    -c cs-simple-json ^
    --schemaPath %CONF_ROOT%\Defines\__root__.xml ^
    -x inputDataDir=%CONF_ROOT%\Datas  ^
    -x outputCodeDir=%CLIENT%\Assets\_GameMain\Code\HotUpdate\Data\Gen^
    -x outputDataDir=%CLIENT%\Assets\_GameMain\Data
pause