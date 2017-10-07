require './spec/spec_helper'

feature 'edit trips index page' do
  background do
    Trip.create!  duration: 10,
                  start_date: "01/01/2001",
                  start_station_id: "42",
                  end_date:"02/01/2001",
                  end_station_id: "43",
                  bike_id: 1001,
                  subscription_type: "Subscriber",
                  zip_code: 80303
    visit '/trips'
  end

  it 'has status code 200' do
    expect(page.status_code).to eq(200)
  end

  it 'displays duration' do
    expect(page).to have_content(/duration/i)
    expect(page).to have_content("10")
  end

  it 'displays start date' do
    expect(page).to have_content(/start date/i)
    expect(page).to have_content("2001-01-02")
  end

  it 'displays start station' do
    skip
    expect(page).to have_content(/start station/i)
    expect(page).to have_content("42")
  end

  it 'displays end date' do
    expect(page).to have_content(/end date/i)
    expect(page).to have_content("2001-01-01")
  end

  it 'displays end station' do
    skip
    expect(page).to have_content(/end station/i)
    expect(page).to have_content("43")
  end

  it 'displays bike id' do
    expect(page).to have_content(/bike id/i)
    expect(page).to have_content("1001")
  end

  it 'displays subscription' do
    expect(page).to have_content(/subscription/i)
    expect(page).to have_content("Subscriber")
  end

  it 'displays zip code' do
    expect(page).to have_content(/zip code/i)
    expect(page).to have_content("80303")
  end


  # it 'displays multiple items' do
  #   stations = all '#trips *'
  #   expect(trip.count).to eq 2
  # end

end