class DemoController < ApplicationController

  layout false

  def index
    render template: 'demo/index.html.erb'
  end

  def hello
    render template: 'demo/hello.html.erb'
  end
end
