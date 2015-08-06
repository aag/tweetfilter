#!/usr/bin/perl

use strict;

print "Building index.html ...\n";

# Minify JS
my $minified_js = `uglifyjs tweetfilter.js -c -m --screw-ie8`;
chomp($minified_js);
$minified_js =~ s/"/'/g;

# Read in original JS file to string
my $orig_js = "";
open JS_FILE, "tweetfilter.js" or die "Couldn't open file: $!"; 
while (<JS_FILE>) {
    $orig_js .= $_;
}
close JS_FILE;
chomp($orig_js);

# Read in HTML template to string
my $html = "";
open HTML_FILE, "index.html.tmpl" or die "Couldn't open file: $!"; 
while (<HTML_FILE>) {
    $html .= $_;
}
close HTML_FILE;

# Insert minified JS into template
my $min_tmpl_var = "%MINIFIED_SCRIPT%";
my $min_script_idx = index $html, $min_tmpl_var;

if ($min_script_idx >= 0) {
    substr ($html, $min_script_idx, length($min_tmpl_var), $minified_js);
} else {
    die "Minified script variable not found in template file.";
}

# Insert original JS into template
my $orig_tmpl_var = "%ORIGINAL_SCRIPT%";
my $orig_script_idx = index $html, $orig_tmpl_var;

if ($orig_script_idx >= 0) {
    substr ($html, $orig_script_idx, length($orig_tmpl_var), $orig_js);
} else {
    die "Original script variable not found in template file.";
}

# Output to the HTML file
open OUT_FILE, '>', "index.html" or die "Couldn't open file: $!";
print OUT_FILE $html;
close OUT_FILE;

print "done.\n";
