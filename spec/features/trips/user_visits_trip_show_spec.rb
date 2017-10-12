require './spec/spec_helper'

feature 'when a user visits trip show page' do

  context('for a trip that doesn\'t exist') do
    background { visit 'trips/0' }

    it 'they see the not found page' do
      expect(page).to have_content(/not found/i)
    end
  end

  context 'for a trip that exists' do
    background { visit '/trips/6342' }

    it 'they see the start station' do
      expect(page).to have_content('5th at Howard')
    end

    it 'they see the end station' do
      expect(page).to have_content('Harry Bridges Plaza (Ferry Building)')
      expect(page).to have_content('7')
    end

    it 'they see the start date' do
      expect(page).to have_content('2013-08-31')
    end

    it 'they see the date' do
      expect(page).to have_content('2013-08-30')
    end

    it 'they see the duration' do
      expect(page).to have_content(/duration/i)
      expect(page).to have_content('556 minutes')
    end

    it 'they see the bike id' do
      expect(page).to have_content(/bike id/i)
      expect(page).to have_content('342')
    end

    it 'they see the subscription type' do
      expect(page).to have_content(/subscription/i)
      expect(page).to have_content('Subscriber')
    end

    it 'they see the subscription type' do
      expect(page).to have_content(/subscription type/i)
      expect(page).to have_content('Customer')
    end

    it 'they see the zipcode' do
      expect(page).to have_content(/zip code/i)
      expect(page).to have_content('94123')
    end

    it 'they see a delete button' do
      expect(page).to have_button("delete")
    end

    it 'they see an edit button' do
      expect(page).to have_button('edit')
    end

    context 'when user clicks on delete button' do
      background { click_button 'delete' }

      it 'they are redirected to trip index page' do
        has_current_path?('/trips', only_path: true)
      end

      it 'they see the deleted trip is not listed' do
        expect(page).to_not have_content('#6342')
      end

      it 'they see a success message' do
        skip
        expect(page).to have_content(/delete successful/i)
      end

    end

  end

end
