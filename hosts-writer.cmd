@REM Copyright (c) 2025 anjisuan608
@echo off
color 03
title Minecraft-Java-Edition-1-16-Series-Offline-Client-Send-Server-Message-Fix-Tool
@REM 判断是否以管理员身份运行
net session >nul 2>&1
if %errorlevel% neq 0 (
    color 04
    echo 请以管理员身份运行该批处理!
    pause
    exit
)
@REM 判断是否为Windows XP及其更早的操作系统
ver | findstr "5\.1\." >nul && echo Windows XP及其更早的操作系统**可能**存在兼容性问题 && pause
echo 当前用户:
whoami
echo 当前工作目录: %CD%
echo.
echo **警告**
echo 我们更推荐使用LittleSkin和MUA高校联盟等第三方认证方式代替离线登录解决该问题!
echo 使用该批处理后可能会导致微软正版登录出现异常!
echo 若您是正版用户(或有使用正版登录需求)请谨慎使用该批处理解决离线登录服务器消息问题!
echo **注意**
echo 安全软件可能会阻止批处理编辑hosts文件
echo 若存在安全软件可以暂时关闭防护(或退出)
echo 或出现防护提示时选择允许操作放行批处理
pause

@REM :tpr
@REM ::跳转管理器-赋值
@REM if "%tp%" == "" set "TPCode=" && goto tpa
@REM if "%tp%" == "DataDirectoryChecker" set "TPCode=DataDirectoryChecker" && goto tpa
@REM if "%tp%" == "CacheDirectoryChecker" set "TPCode=CacheDirectoryChecker" && goto tpa
@REM if "%tp%" == "hostsFileChecker" set "TPCode=hostsFileChecker" && goto tpa
@REM if "%tp%" == "Menu" set "TPCode=Menu" && goto tpa
@REM if "%tp%" == "Recovery" set "TPCode=Recovery" && goto tpa
@REM if "%tp%" == "Backup" set "TPCode=Backup" && goto tpa
@REM if "%tp%" == "Typer" set "TPCode=Typer" && goto tpa
@REM if "%tp%" == "Printer" set "TPCode=Printer" && goto tpa
@REM if "%tp%" == "Output" set "TPCode=Output" && goto tpa
@REM ::没有匹配,移步报错
@REM set "ErrorCode=TeaPot" && goto tpa

@REM :tpa
@REM ::跳转管理器-执行
@REM if "%TPCode%" neq "" goto %TPCode%
@REM ::异常变量跳转
@REM if "%ErrorCode%" == "TeaPot" echo "跳转管理器遇到严重错误,正在转到批处理主菜单…" && timeout /t 3 && goto Menu


:DataDirectoryChecker
@REM 用户数据文件夹检测与创建模块
color 06
echo 正在检测当前用户数据目录…
if exist "%userprofile%\AppData\Local\SakuraMaple\hosts_Backups\" (
    color 02
    echo 当前用户数据目录已存在!
    goto CacheDirectoryChecker
) else (
    color 04
    echo 正在创建当前用户数据目录…
    mkdir %userprofile%\AppData\Local\SakuraMaple\hosts_Backups\
    goto DataDirectoryCheckerLast
)
echo.

:DataDirectoryCheckerLast
@REM 用户数据文件夹检测与创建模块
if exist "%userprofile%\AppData\Local\SakuraMaple\hosts_Backups\" (
    color 02
    echo 当前用户数据目录已存在!
    goto CacheDirectoryChecker
) else (
    color 04
    echo 发生错误,目录没能创建,请检查权限问题!
    pause
    goto x
)

:CacheDirectoryChecker
@REM 用户缓存文件夹检测与创建模块
color 06
echo 正在检测当前用户缓存目录…
if exist "%userprofile%\AppData\Roaming\SakuraMaple\hosts_Backups\" (
    color 02
    echo 当前用户缓存目录已存在!
    goto hostsFileChecker
) else (
    color 04
    echo 正在创建当前用户缓存目录…
    mkdir %userprofile%\AppData\Roaming\SakuraMaple\hosts_Backups\
    goto CacheDirectoryCheckerLast
)
echo.

:CacheDirectoryCheckerLast
@REM 用户缓存文件夹检测与创建模块
if exist "%userprofile%\AppData\Roaming\SakuraMaple\hosts_Backups\" (
    color 02
    echo 当前用户缓存目录已存在!
    goto hostsFileChecker
) else (
    color 04
    echo 发生错误,目录没能创建,请检查权限问题!
    pause
    goto x
)

:hostsFileChecker
@REM hosts文件检测与创建模块
color 06
echo 正在检测hosts文件是否存在
if exist "%windir%\System32\drivers\etc\hosts" (
    echo hosts文件存在!
) else (
    echo 正在创建hosts文件…
    type nul>"%windir%\System32\drivers\etc\hosts"
    goto hostsFileCheckerLast
)
echo.

:hostsFileCheckerLast
@REM hosts文件检测与创建模块
if exist "%windir%\System32\drivers\etc\hosts" (
    echo hosts文件存在!
) else (
    color 04
    echo 发生错误,目录没能创建,请检查是否以管理员身份运行
    echo 或文件夹/文件拒绝访问,如:存在安全软件阻止!
    pause
    goto x
)


:Menu
@REM 功能菜单
color 03

@REM 清除AutoRun功能
set "AutoRun=false"

echo ==================================================
echo + 键入a备份并写入(自动执行)(注:请勿重复执行!)
echo + 键入o遍历 %windir%\System32\drivers\etc\下的文件
echo + 键入p输出hosts文件内容
echo + 键入t向hosts文件写入host信息(注:请勿重复执行!)
echo + 键入b备份hosts文件
echo + 键入r从最新的备份文件还原hosts文件
echo + 键入c清空控制台(部分终端无效)
echo + 键入x退出
echo ==================================================
@REM 选项
choice /C aoptbrcx /CS
if %errorlevel% == 1 goto Auto
if %errorlevel% == 2 goto Output
if %errorlevel% == 3 goto Printer
if %errorlevel% == 4 goto Typer
if %errorlevel% == 5 goto Backup
if %errorlevel% == 6 goto Recovery
if %errorlevel% == 7 goto Cleaner
if %errorlevel% == 8 goto x
@REM 错误回收
color 06
echo ********发生错误********
goto Menu

:Auto
@REM 自动执行确认
set "AutoRun=true"
choice /C yn /CS /T 5 /D y /M "是否要自动执行?(默认5秒后执行)"
if %errorlevel% == 1 goto Run
if %errorlevel% == 2 goto ShutdownAutoRun

:Run
@REM 自动执行

:Output
@REM 遍历 %windir%\System32\drivers\etc\ 下的目录结构
dir /A %windir%\System32\drivers\etc\
@REM 判断自动化执行状态
if "%AutoRun%" == "true" (
    echo.
) else (
    goto Menu
)

:Backup
@REM 备份hosts文件模块
setlocal enabledelayedexpansion
@REM 获取日期和时间信息
@REM 处理日期格式:移除"周"
set StandardDate=%date:~0,10%
@REM 处理日期格式:处理格式,将"/"替换为"-"
set UseDate=!StandardDate:/=-!
@REM 处理时间格式:移除秒后面的小数位
set StandardTime=%time:~0,8%
@REM 处理时间格式:处理格式,将":"替换为"-"
set UseTime=!StandardTime::=-!
@REM 日期-时间: !UseDate!-!UseTime!
echo 正在备份…
copy "%windir%\System32\drivers\etc\hosts" "%userprofile%\AppData\Local\SakuraMaple\hosts_Backups\hosts_!UseDate!-!UseTime!" /Y
type "%windir%\System32\drivers\etc\hosts">"%userprofile%\AppData\Local\SakuraMaple\hosts_Backups\hosts_last"
@REM 判断自动化执行状态
if "%AutoRun%" == "true" (
    echo.
) else (
    goto Menu
)

:Typer
@REM 写入hosts文件模块
@REM 判断Local文件夹是否存在hosts备份文件
if exist "%userprofile%\AppData\Local\SakuraMaple\hosts_Backups\hosts_last" (
    goto TyperRun
) else (
    echo 没有备份hosts文件!
    echo.
    goto TyperChoice
)

:TyperRun
@REM 写入模块
echo 正在写入…
echo.>>"%windir%\System32\drivers\etc\hosts"
echo # SakuraMaple-Minecraft-Java-Edition-1-16-Series-Offline-Client-Send-Server-Message-Fix-Tool>>"%windir%\System32\drivers\etc\hosts"
echo 127.0.0.1 authserver.mojang.com>>"%windir%\System32\drivers\etc\hosts"
echo 127.0.0.1 api.mojang.com>>"%windir%\System32\drivers\etc\hosts"
echo 127.0.0.1 sessionserver.mojang.com>>"%windir%\System32\drivers\etc\hosts"
echo 127.0.0.1 api.minecraftservices.com>>"%windir%\System32\drivers\etc\hosts"
echo ::1 authserver.mojang.com>>"%windir%\System32\drivers\etc\hosts"
echo ::1 api.mojang.com>>"%windir%\System32\drivers\etc\hosts"
echo ::1 sessionserver.mojang.com>>"%windir%\System32\drivers\etc\hosts"
echo ::1 api.minecraftservices.com>>"%windir%\System32\drivers\etc\hosts"
echo # =====================================================>>"%windir%\System32\drivers\etc\hosts"
echo.
@REM 判断自动化执行状态
if "%AutoRun%" == "true" (
    echo.
) else (
    goto Menu
)

:Printer
@REM 屏显hosts文件内容模块
echo 当前hosts文件内容
type "%windir%\System32\drivers\etc\hosts"
@REM 判断自动化执行状态
if "%AutoRun%" == "true" (
    echo.
) else (
    goto Menu
)

:ShutdownAutoRun
@REM 关闭自动执行
set "AutoRun=false"
goto Menu

:TyperChoice
@REM 未检测到备份hosts文件时的写入选项
echo 没有备份hosts文件,是否继续写入?
echo 键入 y 继续写入(危险)
echo 键入 b 前往备份
echo 键入 n 返回主菜单
choice /C ybn /CS
if %errorlevel% == 1 goto TyperRun
if %errorlevel% == 2 goto Backup
if %errorlevel% == 3 goto Menu

@REM 错误回收
color 06
echo ********发生错误,即将返回主菜单********
goto Menu

:Recovery
@REM 还原hosts文件模块

:RecoveryOnLocal
@REM 判断Local文件夹下的备份文件是否存在
if exist "%userprofile%\AppData\Local\SakuraMaple\hosts_Backups\hosts_last" (
    echo hosts备份文件存在^!
    set "RecoveryFile=Local"
    goto RecoveryRun
) else (
    goto RecoveryOnRoaming
)

:RecoveryOnRoaming
@REM 判断Roaming文件夹下的备份文件是否存在
if exist "%userprofile%\AppData\Roaming\SakuraMaple\hosts_Backups\hosts_last" (
    echo hosts备份文件存在^!
    set "RecoveryFile=Roaming"
    goto RecoveryRun
) else (
    goto RecoveryForget
)

:RecoveryRun
@REM 判断备份文件位置
if "%RecoveryFile%"=="Local" set "RecoveryText=数据" && goto RecoveryRunnerChoice
if "%RecoveryFile%"=="Roaming" set "RecoveryText=缓存" && goto RecoveryRunnerChoice
set "RecoveryText=未知(可能失败)"

:RecoveryRunnerChoice
@REM 还原选项
echo 是否要使用 %RecoveryText% 的备份文件还原hosts?(不可逆!)
echo 键入 Y 开始还原,键入 N 取消还原,键入 m 查看其它选项
choice /C ynm /CS
if %errorlevel% == 1 goto RecoveryRunner
if %errorlevel% == 2 goto Menu
if %errorlevel% == 3 goto RecoveryModify

@REM 错误回收
color 06
echo ********发生错误,即将返回主菜单********
goto Menu

:RecoveryModify
@REM 更改用于还原的文件的所在位置
echo 当前使用的是%RecoveryText%的备份文件还原hosts
echo 若要使用Local文件夹下的备份(默认备份),请键入 L
echo 若要使用Roaming文件夹下的备份,请键入 R
echo 更多位位置请键入 m
choice /C lrm /CS
if %errorlevel% == 1 set "RecoveryFile=Local" && goto RecoveryFileModifyCheck
if %errorlevel% == 2 set "RecoveryFile=Roaming" && goto RecoveryFileModifyCheck
if %errorlevel% == 3 set "RecoveryFile=" && goto RecoveryForget

@REM 错误回收
color 06
echo ********发生错误,即将返回主菜单********
goto Menu

:RecoveryFileModifyCheck
@REM 检查更改后的文件夹下备份文件是否存在
if exist "%userprofile%\AppData\%RecoveryFile%\SakuraMaple\hosts_Backups\hosts_last" (
    echo hosts备份文件存在!
    goto RecoveryRun
) else (
    goto RecoveryForget
)

:RecoveryForget
@REM 找不到备份文件选项
if "%RecoveryFile%" == "" (
    echo 手动配置:
    echo 键入 s 切换位置
) else (
    echo 没有找到hosts备份文件
    echo 请尝试切换位置^(键入 s ^)或
)
echo 手动放入"hosts"文件到 "%userprofile%\AppData\Roaming\SakuraMaple\hosts_Backups\" (键入 o 打开文件夹[实验性])
echo 并命名为"hosts_last"(注:没有扩展名!)(注:打开文件夹功能仅支持有图形化的Windows或Windows Server操作系统[实验性])
echo 键入 r 重新检测
choice /C sor /CS
if %errorlevel% == 1 goto RecoveryModify
if %errorlevel% == 2 (
    start explorer.exe "%userprofile%\AppData\Roaming\SakuraMaple\hosts_Backups\"
    goto RecoveryForget
)
if %errorlevel% == 3 set "RecoveryFile=Roaming" && goto RecoveryFileModifyCheck

@REM 错误回收
color 06
echo ********发生错误,即将返回主菜单********
goto Menu

:RecoveryRunner
@REM 写入模块
type "%userprofile%\AppData\%RecoveryFile%\SakuraMaple\hosts_Backups\hosts_last">"%windir%\System32\drivers\etc\hosts"
echo.
echo 当前hosts文件内容:
type "%windir%\System32\drivers\etc\hosts"
pause
goto Menu

:Cleaner
@REM 清屏模块
cls
goto Menu

:x
@REM 退出
timeout /t 8
exit
