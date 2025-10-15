@echo off
::============================================================================
:: GoldWave Activation Script (GWAS)
:: Github: https://github.com/yourusername/GoldWave-Activation-Script
::============================================================================

:: Set serials to use for registration
setlocal

:: Serial options
set User1=J9UEU5J7R
set License1=WCGH64WPK

set User2=AYCZXEBC7
set License2=WPSRDWER4

set User3=835A6RFME
set License3=VA6UGP4GL

:: Choose serial (default: Serial1)
set GWUser=%User1%
set GWLicense=%License1%

:: Select serial if /2 or /3 passed as argument
for %%A in (%*) do (
    if /i "%%A"=="/2" (
        set GWUser=%User2%
        set GWLicense=%License2%
    )
    if /i "%%A"=="/3" (
        set GWUser=%User3%
        set GWLicense=%License3%
    )
)

:: Registry path (for GoldWave 6+ default installation, adjust if needed)
set GWRegPath=HKCU\Software\GoldWave

echo:
echo Applying GoldWave registration...

reg add "%GWRegPath%" /v "UserID" /t REG_SZ /d "%GWUser%" /f
reg add "%GWRegPath%" /v "License" /t REG_SZ /d "%GWLicense%" /f

if %errorlevel%==0 (
    echo Registration details applied successfully!
    echo User ID: %GWUser%
    echo License: %GWLicense%
) else (
    echo [ERROR] Could not apply registration!
)

echo:
pause
endlocal
exit /b
