@echo off
chcp 65001
set PROTOGEN_DLL=..\Tools\Protogen\protogen.dll
set CLIENT=..\Client\Assets\_GameMain
set OUTDIR=%CLIENT%\Code\HotUpdate\Proto
set SERVER=..\SERVER

dotnet %PROTOGEN_DLL% ^
	.\Client.proto ^
	.\Server.proto ^
	.\Common.proto ^
	--csharp_out=.\Gen

if exist %CLIENT% (
	echo 复制生成Probuf cs文件到游戏工程目录
	xcopy .\Gen %OUTDIR%\Gen /e /y /s /i
) else (
	echo 没有找到游戏工程目录，取消复制cs文件
)

pause