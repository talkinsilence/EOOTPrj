function init() {

    //===========< Google Maps API >========================================
    var myHome = new google.maps.LatLng(37.508781, 126.951836);

    var map = new google.maps.Map(document.getElementById('map-canvas'), {
        zoom: 16,
        center: myHome,
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        panControl: false,
        streetViewControl: false,
        mapTypeControl: false,
        zoomControl: true,
        zoomControlOptions: {
            style: google.maps.ZoomControlStyle.SMALL,
            position: google.maps.ControlPosition.RIGHT_CENTER
        }
    });

    var homeMarker = { url: '../resource/images/marker-red.png' };

    var markerOptions = {
        position: myHome,
        map: map,
        icon: homeMarker,
        animation: google.maps.Animation.DROP
    };

    var marker = new google.maps.Marker(markerOptions);
    marker.setMap(map);

    var infoWindowOptions = {content: "NAMI"};
    var infoWindow = new google.maps.InfoWindow(infoWindowOptions);


    //===========< letter >==============================================
    $('.eoot-menu-letter').click(function () {
        $('.letter-write-wrapper, .letter-add-wrapper').css("display", "none");
        $('.letter, .letter-type-wrapper').fadeIn(200);
    });

    $('.btn-close, .letter-transp-bg').click(function () {
        $('.letter').fadeOut(10);
    });

    if ($('.letter-write-box').height() >= 400)
        $('.letter-write').attr("rows", "19");
    else
        $('.letter-write').attr("rows", "17");

    $('.letter-type.text').click(function () {
        $('.letter-type-wrapper').hide(10, function () {
            $('.letter-write-wrapper').fadeIn(200);
        });
    });

    $('.delete').click(function () {
        $(this).parent().remove();
    });

    $('.letter-to-list-add').click(function () {
        $('.letter-write-wrapper').css("display", "block");

        var loc = $('.letter-write-wrapper').offset();
        var wid = $('.letter-write-wrapper').width();
        $('.letter-add-wrapper').offset({ left: loc.left + wid + 70, top: loc.top });

        $('.letter-add-wrapper').fadeIn(100, 'linear');
    })
 
    $('.letter-send').click(function () {
        if ($('.letter-to-list').length == 0) 
            alert("수신인을 한 명 이상 지정해야 합니다.");
        else if(($('.letter-write').val() == ""))
            alert("편지 내용을 입력해주세요.");
        else {
            $('.letter-write-wrapper').hide(800, function () {
                alert("편지가 전송되었습니다^ㅇ^");
            });
        }
    });
}//end init

window.onload = init;

