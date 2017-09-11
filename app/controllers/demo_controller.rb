class DemoController < ApplicationController

  layout false

  def index
    render template: 'demo/index.html.erb'
  end

  def hello
    @array = [*1..5]
    @id = params['id']
    @page = params[:page]
    render template: 'demo/hello.html.erb'
  end

  def other_hello
    redirect_to controller: 'demo', action: 'hello'
  end

  def lynda
    redirect_to 'http://lynda.com'
  end
end
