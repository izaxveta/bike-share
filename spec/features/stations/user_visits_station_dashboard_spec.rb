require './spec/spec_helper'

feature 'When a user visits the Station Dashboard' do

  background { visit '/station-dashboard' }

  it 'they see the total docks' do
    expect(page).to have_content(/total docks/i)
  end

  it 'they see the average dock count' do
    expect(page).to have_content(/average docks/i)
  end

  it 'they see the stations with fewest docks' do
    expect(page).to have_content(/least docks/i)
  end

  it 'they see the stations with most docks' do
    expect(page).to have_content(/most docks/i)
  end

  it 'they see the oldest station(s)' do
    expect(page).to have_content(/oldest/i)
  end

  it 'they see the newest station(s)' do
    expect(page).to have_content(/newest/i)
  end

end
