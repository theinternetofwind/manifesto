var Metalsmith  = require('metalsmith');
var inplace     = require('metalsmith-in-place');
var filenames   = require('metalsmith-filenames');
var sass = require('metalsmith-sass');
var watch = require('metalsmith-watch');
var nodeSassGlobbing = require('node-sass-globbing');
var copy = require('metalsmith-copy');
var ignore = require('metalsmith-ignore');
var metadata = require('metalsmith-metadata');


Metalsmith(__dirname)

.metadata({
  title: "The Internet of Wind Manifesto",
  description: "Developing stage",
  generator: "Metalsmith",
  url: "http://www.theinternetofwind.org"
})

.source('./src')

.destination('./build')

.clean(true)

.use(
    copy({
      "pattern": "components/**/*.+(png|svg|gif|jpg)",
      "directory": "img"
    })
  )

.use(
    watch({
      paths: {
        "src/**/*": "**/*",
        "components/**/*": "**/*"
      },
      livereload: true,
    })
)

.use(filenames())

.use(metadata(
  {
    "signatories": "signatories.json"
  }))

.ignore('assets')

.use(inplace({
  engine: 'ejs',
  partials: 'components'
}))

.use(sass({
  outputDir: function(originalPath) {
    // this will change scss/some/path to css/some/path
    return originalPath.replace("scss", "css");
  },
  // options see here https://github.com/sass/node-sass
  //--output-style    CSS output style (nested | expanded | compact | compressed)
  outputStyle: "expanded",
  // sourceMap: true,
  // sourceMapContents: true //This will embed all the Sass contents in your sourcemaps.
  importer: nodeSassGlobbing
}))
.use(ignore('components/**/*'))
.build(function(err, files) {
  if (err) { throw err; }
});
