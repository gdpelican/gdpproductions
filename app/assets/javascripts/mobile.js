var selectors = {
    showGrid : '.showGrid',
    invisible : '.invisible',
    showGridBack : '.showGridBack',
    activeSquares : '.showGridSquare:not([data-link=true])',
    inactiveSquares : '.showGridSquare[data-link=true]',
    allSquares : '.showGridSquare',
    showGridCanvas : '.showGridCanvas:not(#showMap)',
    backButton : '.backButton',
    offscreen : '.offscreen'
}

$(window).load(function() {
   $(this).resize(refreshGrid);
   $(this).resize();
});

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
       $(selectors.showGridCanvas).fadeOut('fast', function() {
         $(selectors.backButton).fadeOut('fast');
         $(selectors.showGridBack).removeClass('faded');
         $(selectors.allSquares).fadeIn('fast');
       });
    });
    
});

var refreshGrid = function() {
    var showGrid = $(selectors.showGrid);
    showGrid.height(showGrid.width());
    $(selectors.invisible).removeClass('invisible');
}