@rem ��������! ������� ���� � ����� .minecraft
@rem  ����� ����� "if %mincraftfolder%=="" � �������!
@rem ����� ���������������� ����� ����� ����
@rem ��� �������� ����������� <<<<< (����� �� ����� �������)
@echo off
@CHCP 1251
@color 0E
@title zer0 ver 1.0 by shiba#0788
echo ================================
cd %CD%
set /p minecraftfolder=< folder.txt
if "%minecraftfolder%"=="" (goto say) else (goto start)
:start
@echo off
echo ��� �� ������ �������?
echo 1. ��������
echo 2. ��������
set /p choice= 
if /i "%choice%"=="1" goto on
if /i "%choice%"=="2" goto off
goto error
:say
@echo off
echo ����� ��������� ������ ��������, �� ������ �������� ���� � ����� .minecraft � ���� folder.txt.
pause
exit/b
:on
@echo off
attrib +h %minecraftfolder%\Ares
attrib +h %minecraftfolder%\baritone
attrib +h %minecraftfolder%\nodus
attrib +h %minecraftfolder%\Impact
attrib +h %minecraftfolder%\Inertia
attrib +h %minecraftfolder%\SalHack
attrib +h %minecraftfolder%\schematics
attrib +h %minecraftfolder%\KAMIBlueConfig.json
attrib +h %minecraftfolder%\KAMIBlueCoords.json
attrib +h %minecraftfolder%\KAMIBlueLastConfig.txt
attrib +h %minecraftfolder%\KAMIBlueMacros.json
attrib +h %minecraftfolder%\KAMIBluePackets.txt
@del /f /q %appdata%\Microsoft\Windows\Recent\*.*
@del /f /q %windir%\Prefetch\*.*
echo �����!
echo ��� ����������: 
echo ����� ����� (Impact, schematica, Kami Blue, SalHack, baritone, Ares, nodus, Inertia) ��������;
echo ������� ��� ������� ���������� ���� �������� (�� ��� ��� ������������� �� ������ ��)
echo Discord: shiba#0788 ������� ������ � ������ ��������� ��� ������ � ���� ��� ��������� ������ ���������. �����! ������...
pause
exit/b
:off
@echo off
attrib -s -h %minecraftfolder%\Ares
attrib -s -h %minecraftfolder%\baritone
attrib -s -h %minecraftfolder%\nodus
attrib -s -h %minecraftfolder%\Impact
attrib -s -h %minecraftfolder%\Inertia
attrib -s -h %minecraftfolder%\SalHack
attrib -s -h %minecraftfolder%\schematics
attrib -s -h %minecraftfolder%\KAMIBlueConfig.json
attrib -s -h %minecraftfolder%\KAMIBlueCoords.json
attrib -s -h %minecraftfolder%\KAMIBlueLastConfig.txt
attrib -s -h %minecraftfolder%\KAMIBlueMacros.json
attrib -s -h %minecraftfolder%\KAMIBluePackets.txt
@del /f /q %appdata%\Microsoft\Windows\Recent\*.*
@del /f /q %windir%\Prefetch\*.*
echo �����!
echo ��� ����������: 
echo ����� ����� (Impact, schematica, Kami Blue, SalHack, baritone, Ares, nodus, Inertia) ��������� (���� ��� ����);
echo ������� ��� ������� ���������� ���� �������� (�� ��� ��� ������������� �� ������ ��).
echo Discord: shiba#0788 ������� ������ � ������ ��������� ��� ������ � ���� ��� ��������� ������ ���������. �����! ������...
pause
exit/b
:error
@echo off
echo error
pause
exit/b