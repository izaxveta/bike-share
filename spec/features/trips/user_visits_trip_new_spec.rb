# require './spec/spec_helper'
#
# feature 'When a user visits trip new page' do
#
#   background{ visit '/trips/new' }
#
#   it 'has status code 200' do
#     expect(page.status_code).to eq(200)
#   end
#
#   it 'has a form' do
#     expect(page).to have_css('form')
#   end
#
#   it 'they see a trip start station field' do
#     expect(page).to have_content(/start station/i)
#     expect(page).to have_field('trip[start_station_id]')
#   end
#
#   it 'they see a trip end station field' do
#     expect(page).to have_content(/end station/i)
#     expect(page).to have_field('trip[end_station_id]')
#   end
#
#   it 'they see a trip duration field' do
#     expect(page).to have_content(/duration/i)
#     expect(page).to have_field('trip[duration]')
#   end
#
#   it 'they see a trip start date field' do
#     expect(page).to have_content(/start date/i)
#     expect(page).to have_field('trip[start_date]')
#   end
#
#   it 'they see a trip end date field' do
#     expect(page).to have_content(/end date/i)
#     expect(page).to have_field('trip[end_date]')
#   end
#
#   it 'they see a bike id for trip' do
#     expect(page).to have_content(/bike id/i)
#     expect(page).to have_field('trip[bike_id]')
#   end
#
#   it 'they see a subscription type' do
#     expect(page).to have_content(/subscription type/i)
#     expect(page).to have_field('trip[subscription_type]')
#   end
#
#   it 'they see a zip code' do
#     expect(page).to have_content(/zip code/i)
#     expect(page).to have_field('trip[zip_code]')
#   end
#
#   it 'they see a submit button' do
#     expect(page).to have_selector('input[type=submit]')
#   end
#
#   context 'when a user inputs valid data' do
#     background do
#       fill_in 'trip[start_station_id]',   with: '42'
#       fill_in 'trip[end_station_id]',     with: '43'
#       fill_in 'trip[duration]',           with: 10
#       fill_in 'trip[start_date]',         with: '01/01/2001'
#       fill_in 'trip[end_date]',           with: '02/01/2001'
#       fill_in 'trip[bike_id]',            with: 1001
#       fill_in 'trip[subscription_type]',  with: 'Subscriber'
#       fill_in 'trip[zip_code]',           with: 80303
#       click_button 'Submit'
#     end
#
#     it 'then the user is redirected to show page with success message' do
#       has_current_path?(/\/trips\/\d*/, only_path: true)
#       expect(page).to have_content(/saved/i)
#     end
#   end
#
#   context 'when user inputs invalid data' do
#     background do
#       fill_in 'trip[start_station_id]',   with: '42'
#       fill_in 'trip[end_station_id]',     with: '43'
#       fill_in 'trip[duration]',           with: 'long'
#       fill_in 'trip[start_date]',         with: '01/01/2001'
#       fill_in 'trip[end_date]',           with: '02/01/2001'
#       fill_in 'trip[bike_id]',            with: 1001
#       fill_in 'trip[subscription_type]',  with: 'Subscriber'
#       fill_in 'trip[zip_code]',           with: 80303
#       click_button 'Submit'
#     end
#
#     it 'then the user is redirected to trip new page with error flag on invalid field(s)' do
#       has_current_path?('/trips/new', only_path: true)
#       expect(page).to have_content(/error/i)
#     end
#   end
# end
