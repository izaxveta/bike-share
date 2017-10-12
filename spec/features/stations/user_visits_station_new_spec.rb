# require './spec/spec_helper'
#
# feature 'When a user visits station new page' do
#   background{ visit '/stations/new' }
#
#   it 'has status code 200' do
#     expect(page.status_code).to eq(200)
#   end
#
#   it 'they see a form' do
#     expect(page).to have_selector('form')
#   end
#
#
#   it 'they see a station name field' do
#     expect(page).to have_content(/name/i)
#     expect(page).to have_field('station[name]')
#   end
#
#   it 'they see a station city field' do
#     expect(page).to have_content(/city/i)
#     expect(page).to have_field('station[city]')
#   end
#
#   it 'they see station dock count field' do
#     expect(page).to have_content(/dock count/i)
#     expect(page).to have_field('station[dock_count]')
#   end
#
#   it 'they see station latitude field' do
#     expect(page).to have_content(/latitude/i)
#     expect(page).to have_field('station[lat]')
#   end
#
#   it 'they see the station longitude field' do
#     expect(page).to have_content(/longitude/i)
#     expect(page).to have_field('station[long]')
#   end
#
#   it 'they see station installation date field' do
#     expect(page).to have_content(/installation date/i)
#     expect(page).to have_field('station[installation_date]')
#   end
#
#   it 'they see a submit button' do
#     expect(page).to have_selector('input[type=submit]')
#   end
#
#   context 'when a user inputs valid data' do
#     background do
#       fill_in 'station[name]',              with: 'Japantown'
#       fill_in 'station[dock_count]',        with: '15'
#       fill_in 'station[city]',              with: 'San Jose'
#       fill_in 'station[installation_date]', with: '8/5/2013'
#       fill_in 'station[lat]',               with: '37.348742'
#       fill_in 'station[long]',              with: '-121.89471499999999'
#       click_button 'Submit'
#     end
#
#     it 'then the user is redirected to show page with success message' do
#       has_current_path?(/\/stations\/[1-9]\d*/, only_path: true)
#       expect(page).to have_content(/saved/i)
#     end
#   end
#
#   context 'when a user inputs invalid data' do
#     background do
#       fill_in 'station[name]',              with: 'Japantown'
#       fill_in 'station[dock_count]',        with: 'fifteen'
#       fill_in 'station[city]',              with: 'San Jose'
#       fill_in 'station[installation_date]', with: '8/5/2013'
#       fill_in 'station[lat]',               with: '37.348742'
#       fill_in 'station[long]',              with: '-121.89471499999999'
#       click_button 'Submit'
#     end
#
#     it 'then the user is redirected to station new page with error flat on invalid field' do
#       has_current_path?('/stations/new', only_path: true)
#       expect(page).to have_content(/error/i)
#     end
#   end
#
#
# end
