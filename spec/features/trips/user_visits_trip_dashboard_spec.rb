require './spec/spec_helper'

feature 'When a user visits trip dashboard page' do
  background { visit '/trip-dashboard' }

  it 'they see the average trip duration' do
    expect(page).to have_content(/average ride duration/i)
  end

  it 'they see the longest trip' do
    expect(page).to have_content(/longest trip/i)
  end

  it 'they see the shortest trip' do
    expect(page).to have_content(/shortest trip/i)
  end

  it 'they see the station with most trips as the starting place' do
    expect(page).to have_content(/starting station with most rides/i)
  end

  it 'they see the station with the least trips as the the ending place' do
    expect(page).to have_content(/ending station with most rides/i)
  end

  it 'they see the a month by month breakout of trips with subtotals for each year' do
    expect(page).to have_content(/subscriptions/i)
    expect(page).to have_content(/subscription type/i)
  end

  it 'they see the most ridden bike along with total trip count for that bike' do
    expect(page).to have_content(/most used (\d+ rides): \#\d+/i)
  end

  it 'they see the least ridden bike along with total trip count for that bike' do
    expect(page).to have_content(/least used (\d+ rides): \#\d+/i)
  end

  it 'they see a subscription type breakout with both count and percentage' do
    expect(page).to have_content(/totals per year and month/i)
  end

  it 'they see the day with most trips along with count' do
    expect(page).to have_content(/most active/i)
  end

  it 'they see the day with least trips along with count' do
    expect(page).to have_content(/least active/i)
  end

end
