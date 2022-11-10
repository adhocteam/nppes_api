require 'spec_helper'

describe NPPESApi do
  it 'has a version number' do
    expect(NPPESApi::VERSION).not_to be nil
  end
  it 'successfully searches for a provider' do
    expect(NPPESApi.search(number: 1932494937).results.first.taxonomies.first.state).to eq('NC')
  end
end
