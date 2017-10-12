require './spec/spec_helper'

feature 'when user visits the trips index page' do
  background { visit '/trips' }

  it 'they see the first trip' do
    expect(page).to have_content 'Trip #6342'
  end

  it 'they see the thirtieth trip' do
    expect(page).to have_content 'Trip #44362'
  end

  it 'they don\t see the the thirty-first trip' do
    expect(page).to_not have_content 'Trip #45650'
  end

  it 'they see single station when start and end are the same' do
    expect(page).to have_content(
      'Trip #7046 near University and Emerson'
    )
  end

  it 'they see trip route when start and end differ' do
    expect(page).to have_content(
      'from 5th at Howard to Harry Bridges Plaza (Ferry Building)'
    )
  end

  it 'they see the trip date' do
     expect(page).to have_content 'on 2013-08-31'
  end

end
