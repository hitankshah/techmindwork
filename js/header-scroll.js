// Header scroll behavior with improved performance and smoothness
(function($) {
    'use strict';
    
    var didScroll;
    var lastScrollTop = 0;
    var delta = 5;
    var navbarHeight = $('#menu-wrap').outerHeight();
    var $header = $('#menu-wrap');
    
    // Initialize header state
    $header.addClass('nav-down');
    
    // Throttle scroll events
    $(window).scroll(function() {
        didScroll = true;
    });
    
    // Run hasScrolled() and reset didScroll status
    setInterval(function() {
        if (didScroll) {
            hasScrolled();
            didScroll = false;
        }
    }, 250);
    
    function hasScrolled() {
        var st = $(window).scrollTop();
        
        // Make sure scroll is more than delta
        if(Math.abs(lastScrollTop - st) <= delta)
            return;
        
        // If scrolled down and past the navbar...
        if (st > lastScrollTop && st > navbarHeight){
            // Scroll Down
            $header.removeClass('nav-down').addClass('nav-up');
        } else {
            // Scroll Up
            if(st + $(window).height() < $(document).height()) {
                $header.removeClass('nav-up').addClass('nav-down');
            }
        }
        
        // Special case for top of page
        if (st <= 0) {
            $header.removeClass('nav-up').addClass('nav-down');
        }
        
        lastScrollTop = st;
    }
    
    // Show header when mouse moves to top of viewport
    var mouseTimer;
    $(document).on('mousemove', function(event) {
        if (event.clientY < 80) {
            clearTimeout(mouseTimer);
            $header.removeClass('nav-up').addClass('nav-down');
        }
    });
    
})(jQuery);
