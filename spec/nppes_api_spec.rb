require 'spec_helper'

describe NPPESApi do
  it 'has a version number' do
    expect(NPPESApi::VERSION).not_to be nil
  end
  it 'successfully searches for a provider' do
    expect(NPPESApi.search(number: 1932494937).results.first.taxonomies.first.state).to eq('NC')
  end
  it 'gracefully handles a nil search' do
    expect(NPPESApi.search(number: 00000000).results).to be_nil
  end
end
