//= require jquery.scrollbars
//= require jquery.jscrollpane.min
//= require imgloaded

// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
var hide = 'Check out the picture!';
var show = 'Take me back!';

$(window).load(function() {

    $('.scroller').jScrollPane();

    if($.browser && $.browser.msie)
        $('#woTitle').css('bottom', '-.75em').css('right', '-.5em');
    
    $('#minimize').click(toggleContent);
});

Desktop = {};

$(document).ready(function() {
	
		if(screen.width < 700) {
			$('#body').hide();
			$.post('/mobile/on', function() {
				document.location.href='/';	
			});
		}
		
		if($('#showMap').length)
        	$.getScript('http://maps.google.com/maps/api/js?sensor=false&callback=renderMap');


        setTimeout(function() { $('#notice, #error').fadeOut('slow'); }, 2000);
		$('#whatson')
			.css('padding-left', $('#woTitle').height())
			.click(function() { window.location = "/shows/current"; });
	
		$(window).resize(refresh);
		refresh();
        
        $('.lazy-load').each(function() {
        	var _this = $(this);
        	if(_this.is('img') && _this.data('src'))
        	{
        		_this.attr('src', _this.data('src')).one('load', function() {
        			_this.fadeIn(3000);
        		});
        	}
        });
        
        Desktop.reinitializeScroller = function(target) {
        	var scroller = target.closest('.scroller');
        	if(scroller.length && scroller.data('jsp') != null) {
	        	scroller.data('jsp').reinitialise();    	
	       	}
        };
        
        $('#showGalleryLink, #hideGalleryLink').click(function(e) {
        	e.preventDefault();
        	$('#showGallery, #showInfo, #showThumb, #mapInfo').slideToggle(function() {
				Desktop.reinitializeScroller($(this));
        	});
        });

        var viewport = $('#galleryViewport');
        var thumbs = $('#galleryThumbs');
        var backLink = $('#hideGalleryLink');
        $('#galleryThumbs').on('click', '.thumbImage', function() {
        	viewport.find('.loading').show();
        	thumbs.add(backLink).fadeOut(function() {
        		viewport.fadeIn();
        		Desktop.reinitializeScroller(viewport);
        	});
        });
        $('#galleryViewport').on('click', '.pictureWrapper', function() {
        	viewport.fadeOut(function() {
        		viewport.find('.pictureView, .pictureData').html('').hide();
        		thumbs.add(backLink).fadeIn();
        		Desktop.reinitializeScroller(viewport);
        	});
        }).on('click', '.pictureArrow[data-remote=true]', function(e) {
        	e.stopPropagation();
        	e.preventDefault();
        	viewport.find('.loading').show();
        	$.rails.handleRemote($(this));
        });

});

function renderMap() {

    var llelement = $('#latlng');
    if (llelement.length) {
        var latlng = llelement.html().split(';');
        var location = new google.maps.LatLng(latlng[0], latlng[1]);
        var map = new google.maps.Map(document.getElementById('showMap'), {
            zoom: 17,
            mapTypeId: google.maps.MapTypeId.ROADMAP,
            disableDefaultUI: true,
            mapTypeControl: false
        });
        map.setCenter(new google.maps.LatLng(location.lat() + .0002, location.lng() - .0015));

        makeMarker(location, map);
    }

}

function makeMarker(location, map) {
    var shape = {
        coord: [138,0,138,1,138,2,138,3,138,4,138,5,138,6,138,7,138,8,138,9,138,10,138,11,138,12,138,13,138,14,138,15,138,16,138,17,138,18,138,19,138,20,138,21,138,22,138,23,138,24,138,25,138,26,138,27,138,28,138,29,138,30,126,31,19,32,19,33,19,34,18,35,18,36,18,37,18,38,17,39,17,40,17,41,17,42,16,43,16,44,16,45,10,45,10,44,10,43,10,42,10,41,10,40,9,39,9,38,9,37,8,36,8,35,8,34,8,33,7,32,0,31,0,30,0,29,0,28,0,27,0,26,0,25,0,24,0,23,0,22,0,21,0,20,0,19,0,18,0,17,0,16,0,15,0,14,0,13,0,12,0,11,0,10,0,9,0,8,0,7,0,6,0,5,0,4,0,3,0,2,0,1,0,0,138,0],
        type: 'poly' };

    var imageLink;
    var clickEvent;
    var ticketLink = $('#ticketLink');
    if (ticketLink.length) {
        imageLink = '/assets/mapMarker.png';
        clickEvent = function() { window.location = ticketLink.html(); };
    }
    else
        imageLink = '/assets/mapMarker2.png';

    var image = new google.maps.MarkerImage(
          imageLink,
          new google.maps.Size(139,46),
          new google.maps.Point(0,0),
          new google.maps.Point(14,40)
    );

    var marker = new google.maps.Marker({
            position: location,
            icon: image,
            shape: shape,
            map: map
        });

    if(clickEvent)
        google.maps.event.addListener(marker, 'click', clickEvent);
}

function toggleContent() {
    $('#content, #header, #imageInfo, #whatson').fadeToggle('slow');
    var minimize = $('#minimize');
    switch(minimize.html()) {
        case hide:
            $('#menu ul li a').animate({'opacity': .3}).hover(
                function() { $(this).animate({'opacity': 1}); },
                function() { $(this).animate({'opacity': .3}); }
            );
            minimize.html(show); break;
        case show:
            $('#menu ul li a').animate({'opacity': 1}).off('mouseenter').off('mouseleave');
            minimize.html(hide); break;
    }
}

function refresh() {
    var content = $('#content');
    content.height(content.height());
}
