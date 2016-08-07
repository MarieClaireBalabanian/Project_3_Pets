//  GULP FILE
//  =========

//  Dependencies
//  ------------
var gulp = require('gulp'),
    less = require('gulp-less'),
    gls  = require('gulp-live-server');

//  Transpile LESS into CSS
//  -----------------------
gulp.task('less', function() {
  gulp.src('./app/public/less/style.less')
    .pipe(less())
    .pipe(gulp.dest('./app/public/css'));
});

gulp.task('less', function() {
  gulp.src('./app/public/less/style.less')
    .pipe(less())
    .pipe(gulp.dest('./app/public/css'));
});

//  Watch for file changes
//  ----------------------
gulp.task('watch', function() {
  gulp.watch(['./app/public/less/modules/**/*.less'], ['less']);
});

//  Default task
//  ------------
gulp.task('default', ['watch']);
