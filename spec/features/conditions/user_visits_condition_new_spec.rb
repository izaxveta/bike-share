# require './spec/spec_helper'
#
# feature 'When a user visits new conditions page' do
#
#     background { visit '/conditions/new' }
#
#     it 'has status code 200' do
#         expect(page.status_code).to eq(200)
#     end
#
#     it 'has a form' do
#         expect(page).to have_css('form')
#     end
#
#     it 'they see a date field' do
#         expect(page).to have_content(/date/i)
#         expect(page).to have_field('condition[date]')
#     end
#
#     it 'they see a max temperature field' do
#         expect(page).to have_content(/max temperature/i)
#         expect(page).to have_field('condition[max_temperature_f]')
#     end
#
#     it 'they see a min temperature field' do
#         expect(page).to have_content(/min temperature/i)
#         expect(page).to have_field('condition[min_temperature_f]')
#     end
#
#     it 'they see a mean temperature field' do
#         expect(page).to have_content(/mean temperature/i)
#         expect(page).to have_field('condition[mean_temperature_f]')
#     end
#
#     it 'they see an average humidity field' do
#         expect(page).to have_content(/average humidity/i)
#         expect(page).to have_field('condition[mean_humidity]')
#     end
#
#     it 'they see an average visibility field' do
#         expect(page).to have_content(/average visibility/i)
#         expect(page).to have_field('condition[mean_visibility_miles]')
#     end
#
#     it 'they see an average wind field' do
#         expect(page).to have_content(/average wind/i)
#         expect(page).to have_field('condition[mean_wind_speed_mph]')
#     end
#
#     it 'they see a precipitation by inches field' do
#         expect(page).to have_content(/precipitation inches/i)
#         expect(page).to have_field('condition[precipitation_inches]')
#     end
#
#     it 'they see a submit button' do
#         expect(page).to have_selector('input[type=submit]')
#     end
#
#     context 'when a user inputs valid data' do
#         background do
#             fill_in 'condition[:date]',                  with: '8/29/2013'
#             fill_in 'condition[:max_temperature_f]',     with: 74
#             fill_in 'condition[:mean_temperature_f]',    with: 68
#             fill_in 'condition[:min_temperature_f]',     with: 61
#             fill_in 'condition[:mean_humidity]',         with: 75
#             fill_in 'condition[:mean_visibility_miles]', with: 10
#             fill_in 'condition[:mean_wind_speed_mph]',   with: 11
#             fill_in 'condition[:precipitation_inches]',  with: 0
#             click_button 'Submit'
#         end
#
#         it 'the user is redirected to show page with success message' do
#             has_current_path?(/\/conditions\/\d*/, only_path: true)
#             expect(page).to have_content(/saved/i)
#         end
#     end
#
#     context 'when user inputs invalid data' do
#         background do
#             fill_in 'condition[:date]',                  with: 'today'
#             fill_in 'condition[:max_temperature_f]',     with: 'hot'
#             fill_in 'condition[:mean_temperature_f]',    with: 'cold'
#             fill_in 'condition[:min_temperature_f]',     with: 'meh'
#             fill_in 'condition[:mean_humidity]',         with: 'moist'
#             fill_in 'condition[:mean_visibility_miles]', with: 'blinding'
#             fill_in 'condition[:mean_wind_speed_mph]',   with: 9000
#             fill_in 'condition[:precipitation_inches]',  with: 8
#             click_button 'Submit'
#         end
#
#         it 'then the user is redirected to conditions page with error flag on invalid on invalid field(s)' do
#             has_current_path?('/conditions/new', only_path: true)
#             expect(page).to have_content(/error/i)
#         end
#     end
# end
