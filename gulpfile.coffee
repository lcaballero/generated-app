gulp      = require 'gulp'
plugins   = require('gulp-load-plugins')()
stylus    = require('gulp-stylus')



gulp.task 'build-js', ->
  gulp.src('**/*.coffee', { cwd: 'app/public/src/js', cwdbase: true })
    .pipe(plugins.coffee())
    .pipe(gulp.dest('./app/public/assets/js/gen'))

gulp.task 'build-css', ->
  gulp.src('**/*.styl', { cwd: 'app/public/src/css', cwdbase: true })
    .pipe(stylus())
    .pipe(gulp.dest('./app/public/assets/css/gen'))

gulp.task 'watch', ->
  gulp.watch([ 'app/public/src/js/**/*.coffee', 'app/public/src/css/**/*.styl']  , ['build-js', 'build-css'])

