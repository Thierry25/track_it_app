# frozen_string_literal: true

require 'roda'
require 'slim'
require 'slim/include'

module TrackIt
  # Base class for TrackIt Web Application
  class App < Roda
    plugin :render, engine: 'slim', views: 'app/presentation/views'
    plugin :public, root: 'app/presentation/public'
    plugin :assets, path: 'app/presentation/assets',
                    css: { nucleo_icons: 'nucleo-icons.css',
                           nucleo_svg: 'nucleo-svg.css',
                           soft_ui: 'soft-ui-dashboard.css',
                           cover: 'cover.css',
                           boot: 'bootstrap.min.css',
                           social: 'social.css' },
                    js: { core: 'bootstrap.bundle.min.js',
                          core1: 'bootstrap.min.js',
                          plugin: 'bootstrap-notify.js',
                          plugin1: 'Chart.extension.js',
                          plugin2: 'chartjs.min.js',
                          plugin3: 'perfect-scrollbar.min.js',
                          plugin4: 'smooth-scrollbar.min.js',
                          popper: 'popper.min.js',
                          soft: 'soft-ui-dashboard.js',
                          soft1: 'soft-ui-dashboard.js.map',
                          soft2: 'soft-ui-dashboard.min.js' }
    plugin :multi_route
    plugin :flash

    # # ONE_MONTH = 30 * 24 * 60 * 60
    # ONE_MONTH = 10

    # use Rack::Session::Cookie,
    #     expire_after: ONE_MONTH,
    #     secret: config.SESSION_SECRET

    route do |routing|
      response['Content-Type'] = 'text/html; charset=utf-8'
      @current_account = SecureSession.new(session).get(:current_account)

      routing.public
      routing.assets
      routing.multi_route

      # GET /
      routing.root do
        view 'home', locals: { current_account: @current_account }
      end
    end
  end
end
