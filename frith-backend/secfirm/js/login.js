$(document).ready(function () {
    $("#loginForm").submit(function (event) {
        event.preventDefault();

        var form = $(this);
        var formData = form.serializeArray();
        var dataObj = {};

        $(formData).each(function (i, field) {
            dataObj[field.name] = field.value;
        });

        $.ajax({
            type: "post",
            url: "../api/v1/dispatcher.php/sysadmin/login",
            data: "json=" + encodeURIComponent(JSON.stringify(dataObj)),
            success: function (data) {
                if (data !== "false") {
                    $.ajax({
                        type: "post",
                        url: "../session_engine.php",
                        data: { "action": "login", "id": data.AdministratorID, "email": dataObj["email"] },
                        success: function (data) {
                            window.location = "index.php";
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            $("#results").html("Error occurred.");
                            console.log(jqXHR);
                        }
                    });
                } else {
                    $("#results").html("Incorrect email or password.");
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                $("#results").html("Error occurred.");
                console.log(jqXHR);
            }
        });
    });
});