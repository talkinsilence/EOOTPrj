window.onload = function () {

    //-----------------상세보기---------------------
    $("img").click(function () {
        $(".dv-mask").fadeIn(400);
        $("body").css("overflow","hidden");
        var mainImgSrc = $(this).attr("src");
        $(".dv-media-box-img").attr("src", mainImgSrc);
    });

    $(".dv-btn-close").click(function () {
        $(".dv-mask").fadeOut(10);
        $(".dv-content").animate({ height: "22px" }, 500, function () {
            $(this).css("word-break", "inherit");
        });
        $("body").css("overflow", "inherit");
    });

    //------------------등록-------------------------
    $(".upload").click(function () {
        $(".ma-mask").fadeIn(400);
    });

    $(".ma-btn-close").click(function () {
        $(".ma-mask").fadeOut(10);
    });

    //------------------메인--------------------------
    $(".folder").click(function () {
        if ($(".folder-list-wrapper").is(":hidden")) {
            $(".folder-list-wrapper").slideDown("fast");
        }
        else {
            $(".folder-list-wrapper").hide();
        }
    });

    $(".dv-content").click(function () {
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

};