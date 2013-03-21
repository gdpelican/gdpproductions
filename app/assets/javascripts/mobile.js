var selectors = {
    showGrid : '.showGrid',
    invisible : '.invisible'
}

$(window).load(function() {
   $(this).resize(refreshGrid);
   $(this).resize();
});

var refreshGrid = function() {
    var showGrid = $(selectors.showGrid);
    showGrid.height(showGrid.width());
    $(selectors.invisible).removeClass('invisible');
}