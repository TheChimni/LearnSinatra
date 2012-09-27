require_relative '../proxy'

# describe ApiHeaderProxy do
#   before do
#     @app = stub('App')
#     @env = Hash.new
#     @proxy = ApiHeaderProxy.new(@app)
#   end

#   it "sets the header and forwards call" do
#     @app.stub(:call => nil)
#     @proxy.call(@env)
#     @env['HTTP_X_API_KEY'].should == 'awesomeserver'
#   end
# end

describe ApiHeaderProxy do
  let(:app) { stub('App') }
  let(:env) { Hash.new }
  subject { ApiHeaderProxy.new(app) }

  it "sets the header and forwards call" do
    app.stub(:call => nil)
    subject.call(env)
    env['HTTP_X_API_KEY'].should == 'awesomeserver'
  end

  it "calls the app with the correct header" do
    app.should_receive(:call).with({'HTTP_X_API_KEY' => 'awesomeserver'})
    subject.call(env)
  end
end