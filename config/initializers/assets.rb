# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += [
                                              
                                                'vendor/device-mockups/device-mockups.min.scss',
                                                'new-age.css',
                                                'vendor/bootstrap-switch/css/bootstrap-switch.min.css',
                                                'vendor/bootstrap-switch/js/bootstrap-switch.min.js',
                                                'vendor/bootstrap-fileinput/bootstrap-fileinput.css',
                                                'vendor/metronic/css/bootstrap/datatables.bootstrap.css',
                                                'vendor/metronic/css/components.min.css',
                                                'vendor/metronic/css/plugins.min.css',
                                                'vendor/metronic/css/layout.min.css',
                                                'vendor/metronic/css/themes/blue.min.css',
                                                'vendor/metronic/css/datatables.min.css',
                                                'vendor/metronic/js/app.min.js',
                                                'vendor/metronic/js/demo.min.js',
                                                'vendor/metronic/js/layout.min.js',
                                                'vendor/metronic/js/quick-nav.min.js',
                                                'vendor/metronic/js/quick-sidebar.min.js',
                                                'vendor/metronic/js/counterup/jquery.counterup.min.js',
                                                'vendor/bootstrap-fileinput/bootstrap-fileinput.js',
                                                'vendor/metronic/js/plugins/datatables.min.js',
                                                'vendor/metronic/js/plugins/bootstrap/datatables.bootstrap.js',
                                                'vendor/metronic/js/scripts/datatable.js',
                                                'vendor/metronic/js/scripts/table-datatables-managed.js'

                                              ]
