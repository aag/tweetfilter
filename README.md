Tweet Filter Bookmarklet
========================

This is a bookmarklet to filter tweets on twitter.com. When clicked, it will
hide all tweets that do not contain at least one hashtag or at least one
link. It watches the DOM for changes and also filters tweets loaded into
the page dynamically.

Developing
----------
All changes to the bookmarklet should be made in `tweetfilter.js`. There is a
script, `build.pl`, which will minify the code in `tweetfilter.js` and insert
it into `index.html`. To run the build script, first install
Perl and UglifyJS. Then run `./build.pl`.

License
-------
This software is free software licensed under the GPL v3. See the LICENSE
file for details.

