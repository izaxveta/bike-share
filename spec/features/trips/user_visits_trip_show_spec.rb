require './spec/spec_helper'

feature 'when a user visits trip show page' do
  context('for a trip that doesn\'t exist') do
    background { visit 'trips/0' }

    it 'they see the not found page' do
      expect(page).to have_content(/not found/i)
    end
  end

  context 'for a trip that exists' do
    background { visit '/trips/7046' }

    it 'has status code 200' do
      expect(page.status_code).to eq(200)
    end

    it 'they see the start station' do
      expect(page).to have_content('University and Emerson')
    end

    it 'they see the end station' do
      skip
      expect(page).to have_content('7')
    end

    it 'they see the start date' do
      expect(page).to have_content('2013-08-31')
    end

    it 'they see the end date' do
      skip
      expect(page).to have_content('2001-02-01')
    end

    it 'they see the duration' do
      expect(page).to have_content('3743')
    end

    it 'they see the bike id' do
      expect(page).to have_content(/bike id/i)
      expect(page).to have_content('100')
    end

    it 'they see the subscription type' do
      expect(page).to have_content(/subscription type/i)
      expect(page).to have_content('Customer')
    end

    it 'they see the zipcode' do
      expect(page).to have_content(/zip code/i)
      expect(page).to have_content('19803')
    end

    it 'they see an delete button' do
      expect(page).to have_button(/delete/i)
    end

    it 'they see an edit button' do
      expect(page).to have_button(/edit/i)
    end

    #these are everywhere... test each page seperately or what?
    it 'they see a link to the index' do
      expect(page).to have_link(//, href: '/trips')
    end

    context 'when user clicks on delete button' do
      background { click_button 'delete' } 

      it 'then user is redirected to trip index page' do
        has_current_path?('/trips', only_path: true)
        expect(page).to have_content(/delete successful/i)
      end

      it 'the user sees the deleted trip is not listed' do
        skip
      end

    end

  end

end
