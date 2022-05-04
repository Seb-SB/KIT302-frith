$(document).ready(function () {
    $(document).on("click", "a[data-action=logout]", function () {
        $.ajax({
            type: "post",
            url: "../session_engine.php",
            data: { "action": "logout" },
            success: function (data) {
                window.location = "login.php";
            },
            error: function (jqXHR, textStatus, errorThrown) {
                $("#results").html("Error occurred.");
                console.log(jqXHR);
            }
        });
    });
});