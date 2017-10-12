require './spec/spec_helper'

feature 'When a user visits the Station Dashboard' do

  background { visit '/station-dashboard' }

  it 'they see the total stations' do
    expect(page).to have_content('Total docks')
  end

  it 'they see the average dock count' do
    expect(page).to have_content('Average bikes available per station')
  end

  it 'they see the stations with fewest docks' do
    expect(page).to have_content('Stations with least bikes')
  end

  it 'they see the stations with most docks' do
    expect(page).to have_content('Stations with most bikes')
  end

  it 'they see the oldest station(s)' do
    expect(page).to have_content('Oldest Stations')
  end

  it 'they see the newest station(s)' do
    expect(page).to have_content('Newest stations')
  end

end
