require './spec/spec_helper'


feature 'When the user visits the Station index page' do
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

  it 'they see a city field' do
    expect(page).to have_content('City:')
  end

  it 'they see a dock count field' do
    expect(page).to have_content('Dock Count:')
  end

  it 'displays multiple items' do
    stations = all '#stations *'
    expect(Station.count).to eq 9
  end


end
