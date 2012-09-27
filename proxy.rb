# encoding: utf-8
class ApiHeaderProxy

  def initialize(app, options={})
    @app  = app
  end

  def call(env)
    env['HTTP_X_API_KEY'] = 'awesomeserver'
    @app.call(env)
  end

end