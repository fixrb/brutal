begin
  require_relative 'greeter'
rescue ::LoadError
  require './greeter'
end

RSpec.describe do
  let(:front_object) { Greeter }

  context do
    let(:actual) { front_object.new('world') }

    it { expect(actual.salute).to eq("Hello World!") }
  end
end
