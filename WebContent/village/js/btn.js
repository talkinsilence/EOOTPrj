window.addEventListener("load", function () {
    var eNfItem = document.querySelector(".e-oot-newsfeed-list");
    var vNfItem = document.querySelector(".village-newsfeed-list");

    eNfItem.style.top = "0px";
    vNfItem.style.top = "0px";

    var prevBtn1 = document.querySelector(".e-oot-newsfeed-prev-btn");
    var nextBtn1 = document.querySelector(".e-oot-newsfeed-next-btn");

    var prevBtn2 = document.querySelector(".village-newsfeed-prev-btn");
    var nextBtn2 = document.querySelector(".village-newsfeed-next-btn");

    prevBtn1.addEventListener("click", function () {
        var from = parseInt(eNfItem.style.top);
        var to = from - 120;

        var id = setInterval(function () {
            from -= 1;

            if (from < to)
                clearInterval(id);

            eNfItem.style.top = from + "px";            
        }, 10);
    });

    nextBtn1.addEventListener("click", function () {
        var from = parseInt(eNfItem.style.top);
        var to = from + 120;
       
        var id = setInterval(function () {
            from += 1;

            if (from > to)
                clearInterval(id);

            eNfItem.style.top = from + "px";
        }, 10);
    });

    prevBtn2.addEventListener("click", function () {
        var from = parseInt(vNfItem.style.top);
        var to = from - 120;

        var id = setInterval(function () {
            from -= 1;

            if (from < to)
                clearInterval(id);

            vNfItem.style.top = from + "px";
        }, 10);
    });

    nextBtn2.addEventListener("click", function () {
        var from = parseInt(vNfItem.style.top);
        var to = from + 120;

        var id = setInterval(function () {
            from += 1;

            if (from > to)
                clearInterval(id);

            vNfItem.style.top = from + "px";
        }, 10);
    });
});