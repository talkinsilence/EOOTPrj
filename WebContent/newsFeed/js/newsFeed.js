$(document).ready(function () {

    var toolbar = $('#toolbar');

    $(window).scroll(function () {
        if (toolbar.offset().top !== 0) {
            if (!toolbar.hasClass('shadow')) {
                toolbar.addClass('shadow');
            }
        } else {
            toolbar.removeClass('shadow');
        }
    });

    $('.toolbar-opt').click(function () {
        $('.view-opt').toggle();
    });
 
})
