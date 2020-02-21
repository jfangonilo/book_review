require 'rails_helper'

describe 'User can search for a book' do
  it 'and shows results for the man who saw everything' do
    visit '/'

    fill_in :title, with: "the man who saw everything"
    click_on 'Find Book'

    expect(current_path).to eq '/search'
    expect(page).to have_content "The Man Who Saw Everything"
    expect(page).to have_content "which was longlisted for the Booker Prize, looks at masculinity through the perspective of a young historian who sneers at"
  end
end