(function() {
    var filterTweets = function() {
        $('.js-tweet-text').each(function(i, elem) {
            var $e = $(elem);
            var eText = $e.text();
            
            if (eText && 
                eText.search(/\B#\w\w+/) === -1 &&
                $e.find('.js-display-url').not('.u-hidden > .js-display-url').length === 0)
            {
                $e.closest('.js-stream-item').remove();
            }
        });
    };
    
    // Filter once when the bookmarklet is clicked
    filterTweets();
    
    // Filter again on all future changes
    var streamElem = $('.js-navigable-stream')[0];
    var config = {
        attributes: false,
        childList: true,
        characterData: false
    };
    
    var observer = new MutationObserver(function(mutations) {
        filterTweets();
    });
    observer.observe(streamElem, config);
})();
