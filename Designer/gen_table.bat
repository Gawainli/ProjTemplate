@echo off
chcp 65001
set WORKSPACE=..
set LUBAN_DLL=%WORKSPACE%\Tools\Luban\Luban.dll
set CONF_ROOT=.
set CLIENT=..\Client\Assets\_GameMain
set OUTDIR=%CLIENT%\Code\HotUpdate\Data

dotnet %LUBAN_DLL% ^
    -t all ^
    -d json ^
    -c cs-simple-json ^
    --schemaPath %CONF_ROOT%\Defines\__root__.xml ^
    -x inputDataDir=%CONF_ROOT%\Datas  ^
    -x outputCodeDir=.\Gen ^
    -x outputDataDir=.\GenData

if exist %CLIENT% (
	echo 复制生成表cs文件到游戏工程目录
	xcopy .\Gen %OUTDIR%\Gen /e /y /s /i
    echo 复制生成表数据文件到游戏工程目录
	xcopy .\GenData %Client%\Data /e /y /s /i
) else (
	echo 没有找到游戏工程目录，取消复制cs文件
)
pause