var aboutSelectors = {
	body : 'body',
    aboutBadge : '#aboutList .aboutItem',
    aboutSelected : '#aboutList .selected',
    aboutSelectedSlider : '#aboutList .selected .slider',
    popup : '.popup',
    popupModal : '.popup-modal',
    popupOverlay : '.popup-overlay'
};

var animateParams = {};
var unanimateParams = {};

function aboutInitialize(mobile) {
    var width = $(aboutSelectors.aboutBadge).width();
    animateParams = (mobile) ? { 'width' : (width*2) + 'px' }
                             : {'width' : '45em'};
    unanimateParams = (mobile) ? { 'width' : width + 'px' }
                               : {'width' : '9em'};
    $(aboutSelectors.aboutBadge).bind('click', (mobile) ? mobileClickBadge : clickBadge); 
};

function clickBadge() {

    var faded = 0;

    $(this).addClass('selected').off('click');
    var notSelected = $(aboutSelectors.aboutBadge).not(aboutSelectors.aboutSelected)
    notSelected.fadeOut('1000',
        function() {
            faded++;
            if(faded == notSelected.length)
                $(aboutSelectors.aboutSelected).animate(animateParams,
                    function() { 
                        $(aboutSelectors.aboutSelectedSlider).slideDown('500'); 
                        $(this).on('click', unclickBadge);
                    });

        });
}

function mobileClickBadge() {
	$(this).addClass('selected');
	$('<div/>', {
		class: 'popup popup-modal',
		text: $(aboutSelectors.aboutSelectedSlider).html(),
		style: 'left: ' + ((window.innerWidth - 200) / 2) + 'px'
	}).appendTo(aboutSelectors.body);
	
	$('<div/>', {
		class: 'popup popup-overlay'
	}).appendTo(aboutSelectors.body);
	
	setTimeout(function() {
		$(aboutSelectors.popupModal).css('opacity', 1);
		$(aboutSelectors.popupOverlay).css('opacity', .4);
		$(aboutSelectors.popup).click(function() { 
			$(aboutSelectors.aboutSelected).removeClass('selected');
			$(aboutSelectors.popup).remove(); 
		});
	}, 300);
}

function unclickBadge() {
    $(this).off('click');
    $(aboutSelectors.aboutSelectedSlider).slideUp('500',
        function() { $(aboutSelectors.aboutSelected).animate(unanimateParams,
            function() { 
                $(aboutSelectors.aboutBadge).fadeIn('1000').removeClass('selected'); 
                $(this).on('click', clickBadge);
            });
        });
}