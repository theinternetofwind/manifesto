var Metalsmith = require('metalsmith');
var uglifyjs = require('metalsmith-uglifyjs');
var cleanCSS = require('metalsmith-clean-css');
var concat = require('metalsmith-concat');
var replace = require('metalsmith-text-replace');
var htmlMinifier = require("metalsmith-html-minifier");

Metalsmith(__dirname)
  .metadata({
    title: "WindStack IVS Website",
    description: "Optimized",
    generator: "Metalsmith",
    url: "http://www.windstack.io/"
  })
  .source('./build')
  .destination('./optimized')
  .clean(true)
  .use(htmlMinifier()) // Use the default options
  .use(uglifyjs({
    src: ["**/*.js", "!**/*.min.js"],
    deleteSources: true,
    uglifyOptions: {
      mangle: true,
      compress: {
        unused: false,
        warnings: true
      }
    }
  }))
  .use(cleanCSS({
                files: 'css/**/*.css',
                cleanCSS: {
                  rebase: true
                }
              }))
  .use(replace({
                '**/*.html': {
                              find: '<script src=http://localhost:35729/livereload.js></script>',
                              replace: " "
                              }
                 }))
  .build(function(err, files) {
    if (err) { throw err; }
  });
