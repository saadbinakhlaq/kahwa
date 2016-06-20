require 'kahwa/version'
require 'kahwa/controller'
require 'kahwa/utils'
require 'kahwa/dependencies'
require 'kahwa/routing'

module Kahwa
  class Application
    def call(env)
      if env['PATH_INFO'] == '/favicon.ico'
        return [404, {}, []]
      end

      get_rack_app(env).call(env)
    end
  end
end
