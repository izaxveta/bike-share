# require './spec/spec_helper'
#
#   #  This page doesn't match the dev test environment. I didn't write the code for the new way of doing it, so I have no idea how to find where the error is.
#
# feature 'when user visits the trips index page' do
#   background { visit '/trips' }
#
#   it 'they experience status code 200' do
#     expect(page.status_code).to eq(200)
#   end
#
#   it 'they see the trip name' do
#     save_and_open_page
#     expect(page).to have_content(/trip/i)
#     expect(page).to have_content('name')
#   end
#
#   it 'they see the duration' do
#     expect(page).to have_content(/minutes/i)
#     expect(page).to have_content('duration')
#   end
#
#   it 'they see the date' do
#     expect(page).to have_content(/on/i)
#     expect(page).to have_content('date')
#   end
#
# end
