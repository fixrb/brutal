# Some array concatenation unit tests

RSpec.describe do
  let(:front_object) { [42, Object] }

  context do
    let(:actual) { front_object + [nil, "!"] }

    it { expect(actual.to_s).to eq("[42, Object, nil, \"!\"]") }
    it { expect(actual.length).to eq(4) }
  end

  context do
    let(:actual) { front_object + [nil, '!!'] }

    it { expect(actual.to_s).to eq("[42, Object, nil, \"!!\"]") }
    it { expect(actual.length).to eq(4) }
  end

  context do
    let(:actual) { front_object + [nil, "..."] }

    it { expect(actual.to_s).to eq("[42, Object, nil, \"...\"]") }
    it { expect(actual.length).to eq(4) }
  end

  context do
    let(:actual) { front_object + [1, "!"] }

    it { expect(actual.to_s).to eq("[42, Object, 1, \"!\"]") }
    it { expect(actual.length).to eq(4) }
  end

  context do
    let(:actual) { front_object + [1, '!!'] }

    it { expect(actual.to_s).to eq("[42, Object, 1, \"!!\"]") }
    it { expect(actual.length).to eq(4) }
  end

  context do
    let(:actual) { front_object + [1, "..."] }

    it { expect(actual.to_s).to eq("[42, Object, 1, \"...\"]") }
    it { expect(actual.length).to eq(4) }
  end
end
