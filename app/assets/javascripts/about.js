var selectors = {
    aboutBadge : '#aboutList .aboutItem',
    aboutSelected : '#aboutList .selected',
    aboutSelectedSlider : '#aboutList .selected .slider'
};

var animateParams = {};
var unanimateParams = {};

function aboutInitialize(mobile) {
    var width = $(selectors.aboutBadge).width();
    animateParams = (mobile) ? { 'width' : (width*2) + 'px' }
                             : {'width' : '45em'};
    unanimateParams = (mobile) ? { 'width' : width + 'px' }
                               : {'width' : '9em'};
    $(selectors.aboutBadge).bind('click', clickBadge); 
};

function clickBadge() {

    var faded = 0;

    $(this).addClass('selected').off('click');
    var notSelected = $(selectors.aboutBadge).not(selectors.aboutSelected)
    notSelected.fadeOut('1000',
        function() {
            faded++;
            if(faded == notSelected.length)
                $(selectors.aboutSelected).animate(animateParams,
                    function() { 
                        $(selectors.aboutSelectedSlider).slideDown('500'); 
                        $(this).on('click', unclickBadge);
                    });

        });
}

function unclickBadge() {
    $(this).off('click');
    $(selectors.aboutSelectedSlider).slideUp('500',
        function() { $(selectors.aboutSelected).animate(unanimateParams,
            function() { 
                $(selectors.aboutBadge).fadeIn('1000').removeClass('selected'); 
                $(this).on('click', clickBadge);
            });
        });
}