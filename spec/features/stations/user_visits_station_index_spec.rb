require './spec/spec_helper'


feature 'Station index page' do
  background do
  #   Station.create! city: 'land of bikes',
  #                   name: 'pile of bikes',
  #                   dock_count: 999999,
  #                   lat: 888.888,
  #                   long: 777.777,
  #                   installation_date: '22/1/3333'
  #
  #   Station.create! city: 'land of bikes',
  #                   name: 'pile of bikes',
  #                   dock_count: 999999,
  #                   lat: 888.888,
  #                   long: 777.777,
  #                   installation_date: '22/1/3333'
  #
    visit '/stations'
  end

  it 'has status code 200' do
    expect(page.status_code).to eq(200)
  end


  it 'displays name' do
    expect(page).to have_content('pile of bikes')

  end

  it 'displays city' do
    expect(page).to have_content(/city/i)
    expect(page).to have_content('land of bikes')
  end

  it 'displays dock count' do
    expect(page).to have_content(/dock count/i)
    expect(page).to have_content('999999')
  end

  it 'displays multiple items' do
    stations = all '#stations *'
    expect(Station.count).to eq 2
  end


end
