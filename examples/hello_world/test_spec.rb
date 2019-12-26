RSpec.describe do
  let(:front_object) { "Hello " }

  context do
    let(:actual) { front_object + 'Alice' }

    it { expect(actual.to_s).to eq("Hello Alice") }
    it { expect(actual.length).to eq(11) }
  end

  context do
    let(:actual) { front_object + 'Bob' }

    it { expect(actual.to_s).to eq("Hello Bob") }
    it { expect(actual.length).to eq(9) }
  end
end
