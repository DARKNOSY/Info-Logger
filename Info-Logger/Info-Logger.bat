:: Coded by @DARKNOSY (https://github.com/DARKNOSY/Info-Logger)
@echo off & cls
color 5

set message-after=Don't forget to check out the code, it contains all the information you need to modify it to your needs
::message after post request to webhook is successful
set question-asked=Your Webhook
:: put question instead of "Your Webhook"
set /p webhook="%question-asked%:  "
::if you want to set your own webhook and make it so it doesn't ask for the webhook replace "set /p webhook="WebHook:  "" by "set webhook=WEBHOOK-HERE" and replace "WEBHOOK-HERE" by your webhook link
set /p message="Message:  " 
:: the text entered is then sent to the set webhook link (you can replace the question)
set avatar_url=https://avatars.githubusercontent.com/u/109553205?v=4 
:: webhook avatar url
set name=Info Logger / @DARKNOSY
:: webhook name

curl -H "Content-Type: application/json" -d "{\"username\": \"%name%\", \"content\":\"%question-asked%:  %message%\", \"avatar_url\":\"%avatar_url%\"}" %webhook% >nul & echo %message-after%
:: send post request to the set webhook
pause
exit
