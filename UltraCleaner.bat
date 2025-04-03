@echo off
:: Enabling Unicode Support
chcp 65001 >nul

:: Setting title and color
Title Ultimate System Cleaner
color 0A

:: Jump to the main section, skipping the subroutine definitions
goto :main

:define_dot_animation
for /l %%i in (1,1,3) do (
    <nul set /p "=." & timeout /t 1 >nul
)
echo.
exit /b

:main
:: ASCII Art Header
cls
echo *******************************************
echo *                                         *
echo *    ULTIMATE SYSTEM CLEANER 2025        *
echo *                                         *
echo *******************************************
echo.
echo Cleaning process will start now...
call :define_dot_animation

:: Cleaning Temp Folder
echo Cleaning Temporary Files...
del /s /f /q %temp%\*.* >nul 2>&1
rd /s /q %temp% >nul 2>&1
mkdir %temp%
echo Done!
call :define_dot_animation

:: Cleaning Prefetch
echo Cleaning Prefetch Files...
del /s /f /q C:\Windows\Prefetch\*.* >nul 2>&1
echo Done!
call :define_dot_animation

:: Cleaning Windows Temp Folder
echo Cleaning Windows Temp Folder...
del /s /f /q C:\Windows\Temp\*.* >nul 2>&1
rd /s /q C:\Windows\Temp >nul 2>&1
mkdir C:\Windows\Temp
echo Done!
call :define_dot_animation

:: Cleaning Recycle Bin
echo Emptying Recycle Bin...
PowerShell.exe -NoProfile -Command "Clear-RecycleBin -Force" >nul 2>&1
echo Done!
call :define_dot_animation

:: Cleaning DNS Cache
echo Flushing DNS Cache...
ipconfig /flushdns >nul 2>&1
echo Done!
call :define_dot_animation

:: Cleaning System Logs
echo Cleaning Windows Log Files...
del /s /f /q C:\Windows\System32\winevt\Logs\*.* >nul 2>&1
echo Done!
call :define_dot_animation

:: Defragmenting System Drive (Optional)
echo Defragmenting the System Drive (C:)...
defrag C: /O >nul 2>&1
echo Done!
call :define_dot_animation

:: Display Completion Message
cls
echo *******************************************
echo *                                         *
echo *     CLEANING COMPLETE SUCCESSFULLY!     *
echo *                                         *
echo *******************************************
echo.
pause
exit
