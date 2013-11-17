module.exports = (grunt) ->

  # Project configuration.
  grunt.initConfig
    coffee:
      compile:
        expand: true
        cwd: 'src/js'
        src: ['**/*.coffee']
        dest: 'lib/js'
        ext: '.js'
        options:
          sourceMap: true
    copy:
      copy:
        files: [
          expand: true
          cwd: 'src'
          src: ['**/*.html', '**/*.js', '**/*.css']
          dest: 'lib'
          filter: 'isFile'
        ]
    jade:
      compile:
        options:
          pretty: true
        files: [
          expand: true
          cwd: "src/html"
          src: ["**/*.jade", "!includes/**/*.jade", "!layouts/**/*.jade"]
          dest: "lib/html"
          ext: '.html'
        ]
    sass:
      compile:
        files: [
          expand: true
          cwd: "src/css"
          src: ["**/*.sass", "**/*.scss", '!foundation/**/*.sass', '!foundation/**/*.scss']
          dest: "lib/css"
          ext: '.css'
        ]
    watch:
      coffee:
        files: 'src/**/*.coffee'
        tasks: ['coffee']
        options:
            livereload: true
      copy:
        files: ['src/**/*.html', 'src/**/*.js', 'src/**/*.css']
        tasks: ['copy']
        options:
            livereload: true
      jade:
        files: 'src/**/*.jade'
        tasks: ['jade']
        options:
            livereload: true
      sass:
        files: ['src/**/*.sass', 'src/**/*.scss']
        tasks: ['sass']
        options:
            livereload: true

  # These plugins provide necessary tasks.
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-jade'
  grunt.loadNpmTasks 'grunt-contrib-sass'
  grunt.loadNpmTasks 'grunt-contrib-watch'

  #Making grunt default to force in order not to break the project.
  grunt.option 'force', true

  # Default task(s).
  grunt.registerTask 'default', ['jade', 'coffee', 'sass', 'copy', 'watch']
