require './spec/spec_helper'

feature 'When a user visits the Condition dashboard' do
  background { visit '/condition-dashboard' }

  it 'they see the date' do
    expect(page).to have_content(/date/i)
  end

  it 'they see the maximum temperature for a day' do
    expect(page).to have_content(/maximum temperature/i)
  end

  it 'they see the mean temperature for a day' do
    expect(page).to have_content(/mean temperature/i)
  end

  it 'they see the mininum temperature for a day' do
    expect(page).to have_content(/mininum temperature/i)
  end

  it 'they see the mean humidity for a day' do
    expect(page).to have_content(/mean humidity/i)
  end

  it 'they see the mean visibility in miles for a day' do
    expect(page).to have_content(/mean visibility miles/i)
  end

  it 'they see the mean wind speed in mph for a day' do
    expect(page).to have_content(/mean wind speed mph/i)
  end

  it 'they see the inches of precipitation for a day' do
    expect(page).to have_content(/precipitation inches/i)
  end
end
