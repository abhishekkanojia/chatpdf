# frozen_string_literal: true

RSpec.describe Chatpdf do
  it "has a version number" do
    expect(Chatpdf::VERSION).not_to be nil
  end

  it 'has version number' do
    expect(Chatpdf::VERSION).to eq('1.0.2')
  end
end
