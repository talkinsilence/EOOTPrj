$(document).ready(function () {
    $(".content").click(function () {
        if ($(this).css("word-break") == "normal") {
            $(this).stop()
                   .animate({ height: "474px" }, 600)
                   .css("word-break", "break-all");
        }

        else {
            $(this).stop()
                   .animate({ height: "22px" }, 500, function () {
                       $(this).css("word-break", "inherit");
                   });
        }
    });
});