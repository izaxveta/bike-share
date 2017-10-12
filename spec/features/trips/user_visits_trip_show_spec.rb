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
<<<<<<< HEAD
      expect(page).to have_content('Harry Bridges Plaza (Ferry Building)')
=======
      expect(page).to have_content(/end station/i)
      expect(page).to have_content('7')
    end

    it 'they see the start date' do
      expect(page).to have_content('2013-08-31')
>>>>>>> master
    end

    it 'they see the date' do
      expect(page).to have_content('2013-08-30')
    end

    it 'they see the duration' do
<<<<<<< HEAD
      expect(page).to have_content(/duration/i)
      expect(page).to have_content('556 minutes')
=======
      expect(page).to have_content('3743')
>>>>>>> master
    end

    it 'they see the bike id' do
      expect(page).to have_content(/bike id/i)
<<<<<<< HEAD
      expect(page).to have_content('342')
    end

    it 'they see the subscription type' do
      expect(page).to have_content(/subscription/i)
      expect(page).to have_content('Subscriber')
=======
      expect(page).to have_content('100')
    end

    it 'they see the subscription type' do
      expect(page).to have_content(/subscription type/i)
      expect(page).to have_content('Customer')
>>>>>>> master
    end

    it 'they see the zipcode' do
      expect(page).to have_content(/zip code/i)
<<<<<<< HEAD
      expect(page).to have_content('94123')
=======
      expect(page).to have_content('19803')
>>>>>>> master
    end

    it 'they see a delete button' do
      expect(page).to have_button("delete")
    end

    it 'they see an edit button' do
      expect(page).to have_button('edit')
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
