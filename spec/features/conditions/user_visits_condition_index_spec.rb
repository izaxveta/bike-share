require './spec/spec_helper'

RSpec.feature 'when user visits the conditions index page' do
    background { visit '/conditions' }

    it 'they experience status code 200' do
        expect(page.status_code).to eq(200)
    end

    it 'they see a list of conditions' do 
        expect(page).to have_content(/condition list/i)
    end

    it 'they see an edit button' do 
        expect(page).to have_selector('input[type=submit]')
    end

    it 'they see a delete button' do 
        expect(page).to have_selector('input[type=hidden]')
    end

    it 'they see a date' do 
        expect(page).to have_content(/date/i)
        expect(page).to have_content('2013')
    end

    it 'they see weather records' do 
        expect(page).to have_content(/weather record/i)
        expect(page).to have_content('1')
    end
end

    
    