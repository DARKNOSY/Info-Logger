# Coded by @DARKNOSY (https://github.com/DARKNOSY/Info-Logger)
$avatarUrl = 'https://avatars.githubusercontent.com/u/109553205?v=4'
$username = "Powershell Info Logger / @DARKNOSY"

[System.Collections.ArrayList]$embedArray = @()
$messageAfter = "Don't forget to check out the code, it contains all the information you need to modify it to your needs"
# message after post request to webhook is successful
$webHookUrl = "INSERT-YOUR-WEBHOOK"
# replace "INSERT-YOUR-WEBHOOK" by your webhook url
$q = "INSERT-QUESTION-HERE:  "
# question asked (put your question instead of "INSERT-QUESTION-HERE")
$message = Read-Host -Prompt $q
$title       = $q
$description = $message
$color       = '2'

$thumbnailObject = [PSCustomObject]@{
    url = $avatarUrl
}
$embedObject = [PSCustomObject]@{
    author = [PSCustomObject]@{
        name = $username
        icon_url = $avatarUrl
    }
    title       = $title
    description = $description
    color       = $color
    thumbnail   = $thumbnailObject
}
$embedArray.Add($embedObject) | Out-Null
$payload = [PSCustomObject]@{
    embeds = $embedArray
}
Invoke-RestMethod -Uri $webHookUrl -Body ($payload | ConvertTo-Json -Depth 4) -Method Post -ContentType 'application/json'
Write-Output $messageAfter
pause
exit
# Coded by @DARKNOSY (https://github.com/DARKNOSY/Info-Logger)
