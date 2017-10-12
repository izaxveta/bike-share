# require './spec/spec_helper'
#
# feature 'When a user visits station show page' do
#   context 'for a station that exists' do
#
#     background{ visit '/stations/2' }
#
#     it 'has status code 200' do
#       expect(page.status_code).to eq(200)
#     end
#
#     it 'they see a station name' do
#       expect(page).to have_content(/name/i)
#       expect(page).to have_content('San Jose Diridon Caltrain Station')
#     end
#
#     it 'they see a station city' do
#       expect(page).to have_content(/city/i)
#       expect(page).to have_content('San Jose')
#     end
#
#     it 'they see a station dock count' do
#       expect(page).to have_content(/dock count/i)
#       expect(page).to have_content('27')
#     end
#
#     it 'they see a station latitude' do
#       expect(page).to have_content(/latitude/i)
#       expect(page).to have_content('37.329732')
#     end
#
#     it 'they see a station longitude' do
#       expect(page).to have_content(/longitude/i)
#       expect(page).to have_content('-121.90178200000001')
#     end
#
#     it 'they see a station installation date' do
#       expect(page).to have_content(/installation date/i)
#       expect(page).to have_content('8/6/2013')
#     end
#
#   end
#
#
#   context 'for a station that does not exist' do
#     it 'they see a status code 404' do
#       visit '/stations/1'
#       expect(page).to have_content(/not found/i)
#     end
#   end
#
#   context 'when user clicks on delete button' do
#     background{ click_button 'delete' }
#
#     it 'then user is redirected to station index page' do
#       has_current_path?('/trips', only_path: true)
#       expect(page).to have_content(/delete successful/i)
#     end
#   end
#
# end
