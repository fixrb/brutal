RSpec.describe do
  let(:front_object) { -42 }

  context do
    let(:actual) { front_object.abs }

    it { expect(actual.to_s).to eq("42") }
  end

  context do
    let(:actual) { front_object.-(2) }

    it { expect(actual.to_s).to eq("-44") }
  end
end
