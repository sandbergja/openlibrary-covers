# frozen_string_literal: true

RSpec.describe Openlibrary::Covers do
  it 'has a version number' do
    expect(Openlibrary::Covers::VERSION).not_to be nil
  end

  it 'handles valid ISBN correctly' do
    expect do
      Openlibrary::Covers::Image.new '9780786965601'
    end.to perform_under(150).ms

    valid = Openlibrary::Covers::Image.new '9780786965601'
    expect(valid.found?).to be true
    expect(valid.url).to eq 'http://covers.openlibrary.org/b/isbn/9780786965601-M.jpg'
  end

  it 'handles incorrect ISBN correctly' do
    expect do
      Openlibrary::Covers::Image.new 'incorrect'
    end.to perform_under(150).ms

    incorrect = Openlibrary::Covers::Image.new 'incorrect'
    expect(incorrect.found?).to be false
    expect(incorrect.url).to be nil
  end
end
