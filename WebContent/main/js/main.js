﻿$(document).ready(function () {

    $('.btn-up').click(function () {
        $('.alarms-wrapper').animate({
            top: "-=30"
        }, 200)
    });

    $('.btn-down').click(function () {
        $('.alarms-wrapper').animate({
            top: "+=30"
        }, 200)
    });

    $('.profile-family-members').mouseover(function () {
        var divLoc = $(this).offset();
        var left = divLoc.left + 26;
        var top = divLoc.top + 35;
        $('.info-wrapper').css({
            "opacity": "1",
            "visibility": "visible",
            "left": left,
            "top": top
        }).show();
    });
    $('.profile-family-members').mouseout(function () {
        $('.info-wrapper').hide();
    });

    $('.info-wrapper').mouseover(function () {
        $(this).show();
    });
})