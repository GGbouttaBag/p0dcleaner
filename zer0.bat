@rem ВНИМАНИЕ! ВВЕДИТЕ ПУТЬ К ПАПКЕ .minecraft
@rem  ПОСЛЕ СТРОК "if %mincraftfolder%=="" В КАВЫЧКИ!
@rem ЧТОБЫ АВТОМАТИЗИРОВАТЬ ПОИСК ПАПКИ ИГРЫ
@rem они помечены стрелочками <<<<< (Потом их нужно удалить)
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
echo Что вы хотите сделать?
echo 1. Спрятать
echo 2. Показать
set /p choice= 
if /i "%choice%"=="1" goto on
if /i "%choice%"=="2" goto off
goto error
:say
@echo off
echo Чтобы программа начала работать, Вы должны написать путь к папке .minecraft в файл folder.txt.
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
echo Успех!
echo Что изменилось: 
echo файлы читов (Impact, schematica, Kami Blue, SalHack, baritone, Ares, nodus, Inertia) скрылись;
echo Исчезла вся история активности этих программ (То что они сущевствовали на данном ПК)
echo Discord: shiba#0788 Просьба писать в личные сообщения все ошибки и идеи для улучшения данной программы. Удачи! хацкер...
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
echo Успех!
echo Что изменилось: 
echo файлы читов (Impact, schematica, Kami Blue, SalHack, baritone, Ares, nodus, Inertia) вернулись (если они были);
echo Исчезла вся история активности этих программ (То что они сущевствовали на данном ПК).
echo Discord: shiba#0788 Просьба писать в личные сообщения все ошибки и идеи для улучшения данной программы. Удачи! хацкер...
pause
exit/b
:error
@echo off
echo error
pause
exit/b