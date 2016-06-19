require "kahwa/version"

module Kahwa
  class App
    def call(env)
      [200, { 'Content-type' => 'text/html' }, ['Hello World!!']]
    end
  end
end
