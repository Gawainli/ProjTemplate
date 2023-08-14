@echo off
chcp 65001
set CLIENT=..\Client\Assets
set OUTDIR=%CLIENT%\Code\HotUpdate\Proto\Gen
set SERVER=..\SERVER
set PROTOGEN_DLL=..\Tools\Protogen\protogen.dll

dotnet %PROTOGEN_DLL% ^
	.\Client.proto ^
	.\Server.proto ^
	.\Common.proto ^
	--csharp_out=.\Gen

if exist %CLIENT% (
	echo 复制生成cs文件到游戏工程目录
	xcopy .\Gen %OUTDIR% /e /y /s /i
) else (
	echo 没有找到游戏工程目录，取消复制cs文件
)

pause