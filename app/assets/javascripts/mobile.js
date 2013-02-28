var selectors = {
    map : '#showMap',
    showGrid : '.showGrid',
    showGridBack : '.showGridBack',
    activeSquares : '.showGridSquare:not([data-target=showTickets])',
    allSquares : '.showGridSquare',
    showGridCanvas : '.showGridCanvas:not(#showMap)',
    backButton : '.backButton',
    offscreen : '.offscreen'
}

$(document).ready(function() {
    
    $(selectors.showGridCanvas).hide().removeClass('offscreen');
    
    $(selectors.activeSquares).click(function() {
       var target = $('#' + $(this).attr('data-target'));
       $(selectors.allSquares).fadeOut('fast', function() {
          $(selectors.backButton).fadeIn('fast');
          $(selectors.showGridBack).addClass('faded');
          target.removeClass('offscreen').fadeIn('fast'); 
       });
    });
    
    $(selectors.backButton).click(function() {
       $(selectors.map).addClass('offscreen');
       $(selectors.showGridCanvas).fadeOut('fast', function() {
         $(selectors.backButton).fadeOut('fast');
         $(selectors.showGridBack).removeClass('faded');
         $(selectors.allSquares).fadeIn('fast');
       })
    });
});

$(window).load(function() {
    $(window).resize(function() {
        refreshGrid(); 
    }).resize();
});

var refreshGrid = function() {
    var showGrid = $(selectors.showGrid);
    showGrid.height(showGrid.width());
}