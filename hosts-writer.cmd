@REM SakuraMaple Minecraft Java Edition 1.16 Series Offline Client Send Server Message Fix Tool
@REM  SSSSS  AAAAA  K   K  U   U  RRRR    AAAAA   M   M  PPPP   L       EEEEE
@REM S       A   A  K  K   U   U  R   R  A   A   MM MM  P   P  L       E
@REM  SSS    AAAAA  KKK    U   U  RRRR   AAAAA   M M M  PPPP   L       EEEE
@REM     S   A   A  K  K   U   U  R  R   A   A   M   M  P      L       E
@REM SSSS    A   A  K   K  UUUUU  R   R  A   A   M   M  P      LLLLL   EEEEE
@REM Copyright (c) 2018-2025 SakuraMaple Studio
@echo off
color 03
title Minecraft-Java-Edition-1-16-Series-Offline-Client-Send-Server-Message-Fix-Tool
@REM �ж��Ƿ��Թ���Ա�������
net session >nul 2>&1
if %errorlevel% neq 0 (
    color 04
    echo ���Թ���Ա������и�������!
    pause
    exit
)
@REM �ж��Ƿ�ΪWindows XP�������Ĳ���ϵͳ
ver | findstr "5\.1\." >nul && echo Windows XP�������Ĳ���ϵͳ**����**���ڼ��������� && pause
echo ��ǰ�û�:
whoami
echo ��ǰ����Ŀ¼: %CD%
echo.
echo **����**
echo ���Ǹ��Ƽ�ʹ��LittleSkin��MUA��У���˵ȵ�������֤��ʽ�������ߵ�¼���������!
echo ʹ�ø����������ܻᵼ��΢�������¼�����쳣!
echo �����������û�(����ʹ�������¼����)�����ʹ�ø������������ߵ�¼��������Ϣ����!
echo **ע��**
echo ��ȫ������ܻ���ֹ������༭hosts�ļ�
echo �����ڰ�ȫ���������ʱ�رշ���(���˳�)
echo ����ַ�����ʾʱѡ�������������������
pause

@REM :tpr
@REM ::��ת������-��ֵ
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
@REM ::û��ƥ��,�Ʋ�����
@REM set "ErrorCode=TeaPot" && goto tpa

@REM :tpa
@REM ::��ת������-ִ��
@REM if "%TPCode%" neq "" goto %TPCode%
@REM ::�쳣������ת
@REM if "%ErrorCode%" == "TeaPot" echo "��ת�������������ش���,����ת�����������˵���" && timeout /t 3 && goto Menu


:DataDirectoryChecker
@REM �û������ļ��м���봴��ģ��
color 06
echo ���ڼ�⵱ǰ�û�����Ŀ¼��
if exist "%userprofile%\AppData\Local\SakuraMaple\hosts_Backups\" (
    color 02
    echo ��ǰ�û�����Ŀ¼�Ѵ���!
    goto CacheDirectoryChecker
) else (
    color 04
    echo ���ڴ�����ǰ�û�����Ŀ¼��
    mkdir %userprofile%\AppData\Local\SakuraMaple\hosts_Backups\
    goto DataDirectoryCheckerLast
)
echo.

:DataDirectoryCheckerLast
@REM �û������ļ��м���봴��ģ��
if exist "%userprofile%\AppData\Local\SakuraMaple\hosts_Backups\" (
    color 02
    echo ��ǰ�û�����Ŀ¼�Ѵ���!
    goto CacheDirectoryChecker
) else (
    color 04
    echo ��������,Ŀ¼û�ܴ���,����Ȩ������!
    pause
    goto x
)

:CacheDirectoryChecker
@REM �û������ļ��м���봴��ģ��
color 06
echo ���ڼ�⵱ǰ�û�����Ŀ¼��
if exist "%userprofile%\AppData\Roaming\SakuraMaple\hosts_Backups\" (
    color 02
    echo ��ǰ�û�����Ŀ¼�Ѵ���!
    goto hostsFileChecker
) else (
    color 04
    echo ���ڴ�����ǰ�û�����Ŀ¼��
    mkdir %userprofile%\AppData\Roaming\SakuraMaple\hosts_Backups\
    goto CacheDirectoryCheckerLast
)
echo.

:CacheDirectoryCheckerLast
@REM �û������ļ��м���봴��ģ��
if exist "%userprofile%\AppData\Roaming\SakuraMaple\hosts_Backups\" (
    color 02
    echo ��ǰ�û�����Ŀ¼�Ѵ���!
    goto hostsFileChecker
) else (
    color 04
    echo ��������,Ŀ¼û�ܴ���,����Ȩ������!
    pause
    goto x
)

:hostsFileChecker
@REM hosts�ļ�����봴��ģ��
color 06
echo ���ڼ��hosts�ļ��Ƿ����
if exist "%windir%\System32\drivers\etc\hosts" (
    echo hosts�ļ�����!
) else (
    echo ���ڴ���hosts�ļ���
    type nul>"%windir%\System32\drivers\etc\hosts"
    goto hostsFileCheckerLast
)
echo.

:hostsFileCheckerLast
@REM hosts�ļ�����봴��ģ��
if exist "%windir%\System32\drivers\etc\hosts" (
    echo hosts�ļ�����!
) else (
    color 04
    echo ��������,Ŀ¼û�ܴ���,�����Ƿ��Թ���Ա�������
    echo ���ļ���/�ļ��ܾ�����,��:���ڰ�ȫ�����ֹ!
    pause
    goto x
)


:Menu
@REM ���ܲ˵�
color 03

@REM ���AutoRun����
set "AutoRun=false"

echo ==================================================
echo + ����a���ݲ�д��(�Զ�ִ��)(ע:�����ظ�ִ��!)
echo + ����o���� %windir%\System32\drivers\etc\�µ��ļ�
echo + ����p���hosts�ļ�����
echo + ����t��hosts�ļ�д��host��Ϣ(ע:�����ظ�ִ��!)
echo + ����b����hosts�ļ�
echo + ����r�����µı����ļ���ԭhosts�ļ�
echo + ����c��տ���̨(�����ն���Ч)
echo + ����x�˳�
echo ==================================================
@REM ѡ��
choice /C aoptbrcx /CS
if %errorlevel% == 1 goto Auto
if %errorlevel% == 2 goto Output
if %errorlevel% == 3 goto Printer
if %errorlevel% == 4 goto Typer
if %errorlevel% == 5 goto Backup
if %errorlevel% == 6 goto Recovery
if %errorlevel% == 7 goto Cleaner
if %errorlevel% == 8 goto x
@REM �������
color 06
echo ********��������********
goto Menu

:Auto
@REM �Զ�ִ��ȷ��
set "AutoRun=true"
choice /C yn /CS /T 5 /D y /M "�Ƿ�Ҫ�Զ�ִ��?(Ĭ��5���ִ��)"
if %errorlevel% == 1 goto Run
if %errorlevel% == 2 goto ShutdownAutoRun

:Run
@REM �Զ�ִ��

:Output
@REM ���� %windir%\System32\drivers\etc\ �µ�Ŀ¼�ṹ
dir /A %windir%\System32\drivers\etc\
@REM �ж��Զ���ִ��״̬
if "%AutoRun%" == "true" (
    echo.
) else (
    goto Menu
)

:Backup
@REM ����hosts�ļ�ģ��
setlocal enabledelayedexpansion
@REM ��ȡ���ں�ʱ����Ϣ
@REM �������ڸ�ʽ:�Ƴ�"��"
set StandardDate=%date:~0,10%
@REM �������ڸ�ʽ:�����ʽ,��"/"�滻Ϊ"-"
set UseDate=!StandardDate:/=-!
@REM ����ʱ���ʽ:�Ƴ�������С��λ
set StandardTime=%time:~0,8%
@REM ����ʱ���ʽ:�����ʽ,��":"�滻Ϊ"-"
set UseTime=!StandardTime::=-!
@REM ����-ʱ��: !UseDate!-!UseTime!
echo ���ڱ��ݡ�
copy "%windir%\System32\drivers\etc\hosts" "%userprofile%\AppData\Local\SakuraMaple\hosts_Backups\hosts_!UseDate!-!UseTime!" /Y
type "%windir%\System32\drivers\etc\hosts">"%userprofile%\AppData\Local\SakuraMaple\hosts_Backups\hosts_last"
@REM �ж��Զ���ִ��״̬
if "%AutoRun%" == "true" (
    echo.
) else (
    goto Menu
)

:Typer
@REM д��hosts�ļ�ģ��
@REM �ж�Local�ļ����Ƿ����hosts�����ļ�
if exist "%userprofile%\AppData\Local\SakuraMaple\hosts_Backups\hosts_last" (
    goto TyperRun
) else (
    echo û�б���hosts�ļ�!
    echo.
    goto TyperChoice
)

:TyperRun
@REM д��ģ��
echo ����д�롭
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
@REM �ж��Զ���ִ��״̬
if "%AutoRun%" == "true" (
    echo.
) else (
    goto Menu
)

:Printer
@REM ����hosts�ļ�����ģ��
echo ��ǰhosts�ļ�����
type "%windir%\System32\drivers\etc\hosts"
@REM �ж��Զ���ִ��״̬
if "%AutoRun%" == "true" (
    echo.
) else (
    goto Menu
)

:ShutdownAutoRun
@REM �ر��Զ�ִ��
set "AutoRun=false"
goto Menu

:TyperChoice
@REM δ��⵽����hosts�ļ�ʱ��д��ѡ��
echo û�б���hosts�ļ�,�Ƿ����д��?
echo ���� y ����д��(Σ��)
echo ���� b ǰ������
echo ���� n �������˵�
choice /C ybn /CS
if %errorlevel% == 1 goto TyperRun
if %errorlevel% == 2 goto Backup
if %errorlevel% == 3 goto Menu

@REM �������
color 06
echo ********��������,�����������˵�********
goto Menu

:Recovery
@REM ��ԭhosts�ļ�ģ��

:RecoveryOnLocal
@REM �ж�Local�ļ����µı����ļ��Ƿ����
if exist "%userprofile%\AppData\Local\SakuraMaple\hosts_Backups\hosts_last" (
    echo hosts�����ļ�����^!
    set "RecoveryFile=Local"
    goto RecoveryRun
) else (
    goto RecoveryOnRoaming
)

:RecoveryOnRoaming
@REM �ж�Roaming�ļ����µı����ļ��Ƿ����
if exist "%userprofile%\AppData\Roaming\SakuraMaple\hosts_Backups\hosts_last" (
    echo hosts�����ļ�����^!
    set "RecoveryFile=Roaming"
    goto RecoveryRun
) else (
    goto RecoveryForget
)

:RecoveryRun
@REM �жϱ����ļ�λ��
if "%RecoveryFile%"=="Local" set "RecoveryText=����" && goto RecoveryRunnerChoice
if "%RecoveryFile%"=="Roaming" set "RecoveryText=����" && goto RecoveryRunnerChoice
set "RecoveryText=δ֪(����ʧ��)"

:RecoveryRunnerChoice
@REM ��ԭѡ��
echo �Ƿ�Ҫʹ�� %RecoveryText% �ı����ļ���ԭhosts?(������!)
echo ���� Y ��ʼ��ԭ,���� N ȡ����ԭ,���� m �鿴����ѡ��
choice /C ynm /CS
if %errorlevel% == 1 goto RecoveryRunner
if %errorlevel% == 2 goto Menu
if %errorlevel% == 3 goto RecoveryModify

@REM �������
color 06
echo ********��������,�����������˵�********
goto Menu

:RecoveryModify
@REM �������ڻ�ԭ���ļ�������λ��
echo ��ǰʹ�õ���%RecoveryText%�ı����ļ���ԭhosts
echo ��Ҫʹ��Local�ļ����µı���(Ĭ�ϱ���),����� L
echo ��Ҫʹ��Roaming�ļ����µı���,����� R
echo ����λλ������� m
choice /C lrm /CS
if %errorlevel% == 1 set "RecoveryFile=Local" && goto RecoveryFileModifyCheck
if %errorlevel% == 2 set "RecoveryFile=Roaming" && goto RecoveryFileModifyCheck
if %errorlevel% == 3 set "RecoveryFile=" && goto RecoveryForget

@REM �������
color 06
echo ********��������,�����������˵�********
goto Menu

:RecoveryFileModifyCheck
@REM �����ĺ���ļ����±����ļ��Ƿ����
if exist "%userprofile%\AppData\%RecoveryFile%\SakuraMaple\hosts_Backups\hosts_last" (
    echo hosts�����ļ�����!
    goto RecoveryRun
) else (
    goto RecoveryForget
)

:RecoveryForget
@REM �Ҳ��������ļ�ѡ��
if "%RecoveryFile%" == "" (
    echo �ֶ�����:
    echo ���� s �л�λ��
) else (
    echo û���ҵ�hosts�����ļ�
    echo �볢���л�λ��^(���� s ^)��
)
echo �ֶ�����"hosts"�ļ��� "%userprofile%\AppData\Roaming\SakuraMaple\hosts_Backups\" (���� o ���ļ���[ʵ����])
echo ������Ϊ"hosts_last"(ע:û����չ��!)(ע:���ļ��й��ܽ�֧����ͼ�λ���Windows��Windows Server����ϵͳ[ʵ����])
echo ���� r ���¼��
choice /C sor /CS
if %errorlevel% == 1 goto RecoveryModify
if %errorlevel% == 2 (
    start explorer.exe "%userprofile%\AppData\Roaming\SakuraMaple\hosts_Backups\"
    goto RecoveryForget
)
if %errorlevel% == 3 set "RecoveryFile=Roaming" && goto RecoveryFileModifyCheck

@REM �������
color 06
echo ********��������,�����������˵�********
goto Menu

:RecoveryRunner
@REM д��ģ��
type "%userprofile%\AppData\%RecoveryFile%\SakuraMaple\hosts_Backups\hosts_last">"%windir%\System32\drivers\etc\hosts"
echo.
echo ��ǰhosts�ļ�����:
type "%windir%\System32\drivers\etc\hosts"
pause
goto Menu

:Cleaner
@REM ����ģ��
cls
goto Menu

:x
@REM �˳�
timeout /t 8
exit