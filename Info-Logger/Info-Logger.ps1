$webHookUrl = 'https://discord.com/api/webhooks/1093954706415550494/4JI72f4bKrTiSVLHekTK7JWGNyQ3amHMr8a3MAPm3jwYdf4sIMJBKkxLkoCvKxYmX_tI'

#Create embed array
[System.Collections.ArrayList]$embedArray = @()

#Store embed values
$title       = 'Embed Title'
$description = 'Embed Description'
$color       = '1'

#Create thumbnail object
$thumbUrl = 'https://static1.squarespace.com/static/5644323de4b07810c0b6db7b/t/5aa44874e4966bde3633b69c/1520715914043/webhook_resized.png' 
$thumbnailObject = [PSCustomObject]@{

    url = $thumbUrl

}

#Create embed object, also adding thumbnail
$embedObject = [PSCustomObject]@{

    title       = $title
    description = $description
    color       = $color
    thumbnail   = $thumbnailObject

}

#Add embed object to array
$embedArray.Add($embedObject) | Out-Null

#Create the payload
$payload = [PSCustomObject]@{

    embeds = $embedArray

}

#Send over payload, converting it to JSON
Invoke-RestMethod -Uri $webHookUrl -Body ($payload | ConvertTo-Json -Depth 4) -Method Post -ContentType 'application/json'