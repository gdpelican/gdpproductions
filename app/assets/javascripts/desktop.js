//= require jquery.prettyPhoto
//= require jquery.scrollbars
//= require jquery.jscrollpane.min
//= require curvycorners

// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
var hide = 'Check out the picture!';
var show = 'Take me back!';

$(window).load(function() {

    $('.scroller').jScrollPane();
    $('#image').fadeIn(5000);

    if($.browser && $.browser.msie) {
        curvyCorners({
              tl: { radius: 10 },
              tr: { radius: 10 },
              bl: { radius: 10 },
              br: { radius: 10 },
              antiAlias: true
            }, '.rounded');
        $('#woTitle').css('bottom', '-.75em').css('right', 0);
    }

    $('#minimize').html('Check out the picture!').click(toggleContent);

});

$(document).ready(function() {
	
		if(screen.width < 700) {
			$.post('/mobile/on', function() {
				document.location.reload();	
			});
		}

        setTimeout(function() { $('#notice, #error').fadeOut('slow'); }, 2000);
    	$('#whatson')
		//.height($('#woTitle').width())
		.css('padding-left', $('#woTitle').height())
		.click(function() { window.location = "/shows/current"; });

        $('#changePicture').click(changePicture);
	
		$(window).resize(refresh());
		$(window).resize();
        
        $("a[rel^='prettyPhoto']").prettyPhoto({
            theme: 'dark_rounded',
            horizontal_padding: 20,
            show_title: false,
            opacity: .25,
            social_tools: ''
        });

});

function toggleContent() {
    $('#content, #header, #imageInfo, #whatson').fadeToggle('slow');
    var minimize = $('#minimize');
    switch(minimize.html()) {
        case hide:
            $('#menu ul li a').animate({'opacity': .3}).hover(
                function() { $(this).animate({'opacity': 1}) },
                function() { $(this).animate({'opacity': .3}) }
            );
            minimize.html(show); break;
        case show:
            $('#menu ul li a').animate({'opacity': 1}).off('mouseenter').off('mouseleave');
            minimize.html(hide); break;
    }
}

function changePicture() {
    $('#image').fadeOut('5000', function() {
     $.get('/picture_data/', {mode: $('#pictureMode').html(), id: $('#image').attr('title')}, function(data) {
        $('#pictureData').html(data);
        $('#image img').bind('load', function() { $('#image').fadeIn('5000'); });
        $('#imageInfo').css('display', 'block');
        $('#minimize').html(show).click(toggleContent);
        $('#changePicture').click(changePicture);
     })});
}

function refresh() {
    var content = $('#content');
    content.height(content.height());
}
