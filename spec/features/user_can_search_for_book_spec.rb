require 'rails_helper'

describe 'User can search for a book' do
  it 'shows results for the man who saw everything' do
    visit '/'

    fill_in :title, with: "the man who saw everything"
    click_on 'Find Book'

    expect(current_path).to eq '/search'
  end
end