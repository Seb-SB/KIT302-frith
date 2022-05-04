$(document).ready(function () {
    $("#signupForm").submit(function (event) {
        event.preventDefault();

        var form = $(this);
        var formData = form.serializeArray();
        var dataObj = {};

        $(formData).each(function (i, field) {
            dataObj[field.name] = field.value;
        });

        $.ajax({
            type: "post",
            url: "../api/v1/dispatcher.php/secfirm/create",
            data: "json=" + encodeURIComponent(JSON.stringify(dataObj)),
            success: function (data) {
                if (data !== "-1") {
                    window.location = "register_success.php";
                } else {
                    $("#results").html("Email already exists.");
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                $("#results").html("Error occurred.");
                console.log(jqXHR);
            }
        });
    });
});