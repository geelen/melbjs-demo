# All of the below are mimosa defaults and only need to be uncommented in the event you want
# to override them.
#
# IMPORTANT: Be sure to comment out all of the nodes from the base to the option you want to
# override. If you want to turn change the source directory you would need to uncomment watch
# and sourceDir. Also be sure to respect coffeescript indentation rules.  2 spaces per level
# please!

exports.config = {

  # minMimosaVersion:null   # The minimum Mimosa version that must be installed to use the
                            # project. Defaults to null, which means Mimosa will not check
                            # the version.  This is a no-nonsense way for big teams to ensure
                            # everyone stays up to date with the blessed Mimosa version for a
                            # project.

  ###
  The list of Mimosa modules to use for this application. The defaults (lint, server, require,
  minify, live-reload) come bundled with Mimosa and do not need to be installed.  The 'mimosa-'
  that preceeds all Mimosa module names is assumed, however you can use it if you want.  If a
  module is listed here that Mimosa is unaware of, Mimosa will attempt to install it.
  ###
  modules: ["server","require","minify","lint","live-reload","server-template-compile"]

  # watch:
    # sourceDir: "assets"                # directory location of web assets, can be relative to
                                         # the project root, or absolute
    # compiledDir: "public"              # directory location of compiled web assets, can be
                                         # relative to the project root, or absolute
    # javascriptDir: "javascripts"       # Location of precompiled javascript (i.e.
                                         # coffeescript), must be relative to sourceDir
    # exclude: [/[/\\](\.|~)[^/\\]+$/]   # regexes matching the files to be entirely
                                         # ignored by mimosa, the default matches files that
                                         # start with a period.
    # throttle: 0                        # number of file adds the watcher handles before
                                         # taking a 100 millisecond pause to let those files
                                         # finish their processing. This helps avoid EMFILE
                                         # issues for projects containing large numbers of
                                         # files that all get copied at once. If the throttle
                                         # is set to 0, no throttling is performed. Recommended
                                         # to leave this set at 0, thedefault, until you start
                                         # encountering EMFILE problems.

  # compilers:
    # extensionOverrides:       # A list of extension overrides, format is:
                                # [compilerName]:[arrayOfExtensions], see
                                # http://mimosajs.com/compilers.html for list of compiler names
      # coffee: ["coff"]        # This is an example override, this is not a default, must be
                                # array of strings

  # template:
    # outputFileName: "templates"     # the file all templates are compiled into, is relative
                                      # to watch.javascriptDir. Optionally outputFileName can
                                      # be provided a hash of file extension to file name in
                                      # the event you are using multiple templating libraries.
                                      # The file extension must match one of the default
                                      # compiler extensions or one of the extensions configured
                                      # for a compiler in the compilers.extensionOverrides
                                      # section above. Ex: {hogan:"js/hogans", jade:"js/jades"}
    # helperFiles:["app/template/handlebars-helpers"]  # relevant to handlebars only, the paths
                                      # from watch.javascriptDir to the files containing
                                      # handlebars helper/partial registrations

  ###
  # the extensions of files to copy from sourceDir to compiledDir. vendor js/css, images, etc.
  ###
  # copy:
    # extensions: ["js","css","png","jpg","jpeg","gif","html","eot","svg","ttf","woff","otf","yaml","kml"]

  growl:
    # onStartup: false       # Controls whether or not to Growl when assets successfully
                             # compile/copy on startup, If you've got 100 CoffeeScript files,
                             # and you do a clean and then start watching, you'll get 100 Growl
                             # notifications.  This is set to false by default to prevent that.
                             # Growling for every successful file on startup can also cause
                             # EMFILE issues. See watch.throttle
    onSuccess:             # Controls whether to Growl when assets successfully compile/copy
      javascript: false     # growl on successful compilation? will always send on failure
      css: false            # growl on successful compilation? will always send on failure
      template: false       # growl on successful compilation? will always send on failure
      copy: false           # growl on successful copy?

  server:                      # configuration for server when server option is enabled via CLI
    useDefaultServer: true    # whether or not mimosa starts a default server for you, when
                                 # true, mimosa starts its own on the port below, when false,
                                 # Mimosa will use server provided by path below
    # path: 'server.coffee'      # valid when useDefaultServer: false, path to file for provided
                                 # server which must contain export startServer method that takes
                                 # an enriched mimosa-config object
    # port: 3000                 # port to start server on
    # base: ''                   # base of url for the app, if altered should start with a slash
    # views:                     # configuration for the view layer of your application
      # compileWith: 'jade'      # Other valid options: "hogan", "html", "ejs". The compiler for
                                 # your views.
      # extension: 'jade'        # extension of your server views
      # path: 'views'            # path from the root of your project to your views

  # require:                 # configuration for requirejs options.
    # verify:                # settings for requirejs path verification
      # enabled: true        # Whether or not to perform verification
    # optimize :
      # inferConfig:true     # Mimosa figures out all you'd need for a simple r.js optimizer run.
                             # If you rather Mimosa not do that, set inferConfig to false and
                             # provide your config in the overrides section. See here
                             # https://github.com/dbashford/mimosa#requirejs-optimizer-defaults
                             # to see what the defaults are.
      # overrides:           # Optimization configuration and Mimosa overrides. If you need to
                             # make tweaks uncomment this line and add the r.js config
                             # (http://requirejs.org/docs/optimization.html#options) as new
                             # paramters inside the overrides ojbect. To unset Mimosa's defaults,
                             # set a property to null

  # minify:                     # Configuration for non-require minification/compression via
                                # uglify using the --minify flag.
    # exclude:[/\.min\./]       # List of string paths and regexes to match files to exclude
                                # when running minification. Any path with ".min." in its name,
                                # like jquery.min.js, is assumed to already be minified and is
                                # ignored by default. Paths can be relative to the
                                # watch.compiledDir, or absolute.  Paths are to compiled files,
                                # so '.js' rather than '.coffee'

  # lint:                      # settings for js, css linting/hinting
    # compiled:                # settings for compiled files
      # javascript:true        # fire jshint on successful compile of meta-language to javascript
      # css:true               # fire csslint on successful compile of meta-language to css
    # copied:                  # settings for copied files, files already in .css and .js files
      # javascript: true       # fire jshint for copied javascript files
      # css: true              # fire csslint for copied css files
    # vendor:                  # settings for vendor files
      # javascript: false      # fire jshint for copied vendor javascript files (like jquery)
      # css: false             # fire csslint for copied vendor css files (like bootstrap)
    # rules:                   # All hints/lints come with defaults built in.  Here is where
                               # you'd override those defaults. Below is listed an example of an
                               # overridden default for each lint type, also listed, next to the
                               # lint types is the url to find the settings for overriding.
      # javascript:            # Settings: http://www.jshint.com/options/
        # plusplus: true       # This is an example override, this is not a default
      # css:                   # Settings: https://github.com/stubbornella/csslint/wiki/Rules
        # floats: false        # This is an example override, this is not a default

  # liveReload:                   # Configuration for live-reload
    # enabled:true                # Whether or not live-reload is enabled
    # additionalDirs:["views"]    # Additional directories outside the watch.compiledDir
                                  # that you would like to have trigger a page refresh,
                                  # like, by default, static views. Is string path,
                                  # can be relative to project root, or absolute

  ###
  # This is not the full set of serverTemplate defaults as many defaults are assumed from other
  # config settings in your application. To see a complete breakdown of all the serverTemplate
  # config options (there are many), visit https://github.com/dbashford/mimosa-server-template-compile
  ###
  # serverTemplate:
    # exclude: ["layout.jade"]        # files to exclude from compilation
    # locals:                         # a list of properties to pass into all the templates when
                                    # they are compiled, the following defaults match properties
                                    # that are used in the default 'mimosa new' projects
      # title: "Mimosa"               # title of the page
      # reload: false                 # flag for whether or not to include live reload, which does
                                    # not make sense for compiled templates

}
