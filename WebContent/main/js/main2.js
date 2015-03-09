$(document).ready(function () {
    
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

})