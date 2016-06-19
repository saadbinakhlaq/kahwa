require 'kahwa/version'
require 'kahwa/controller'
require 'kahwa/utils'
require 'kahwa/dependencies'

module Kahwa
  class Application
    def call(env)
      if env['PATH_INFO'] == '/'
        return [302, { 'Location' => '/pages/about' }, []]
      end

      if env['PATH_INFO'] == '/favicon.ico'
        return [404, {}, []]
      end

      contoller_class, action = get_controller_and_action env

      response = contoller_class.new(env).send(action)
      [200, { 'Content-type' => 'text/html' }, [response]]
    end

    def get_controller_and_action(env)
      _, controller_name, action = env['PATH_INFO'].split('/')
      controller_name = controller_name.to_camel_case + 'Controller'
      [Object.const_get(controller_name), action]
    end
  end
end
