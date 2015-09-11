require 'rails_helper'

describe 'Catalog', js: true do

  before(:each) do
    10.times do
      create(:product)
    end
  end

  let(:first) { Product.first }
  let(:second) { Product.second }
  let(:third) { Product.limit(1).offset(2).take }
  let(:fourth) { Product.limit(1).offset(3).take }
  let(:fifth) { Product.limit(1).offset(4).take }
  let(:sixth) { Product.limit(1).offset(5).take }

  scenario 'I can see 3 items in the catalog' do
    visit '/'

    expect(page).to have_content('Product catalog')
    expect(page).to have_content(first.name)
    expect(page).to have_content(first.description)
    expect(page).to have_content(first.price)
    expect(page).to have_content(second.name)
    expect(page).to have_content(second.description)
    expect(page).to have_content(second.price)
    expect(page).to have_content(third.name)
    expect(page).to have_content(third.description)
    expect(page).to have_content(third.price)
  end

  scenario "I can visit particular item's page" do
    visit '/'

    Capybara.match = :first
    within('.caption') do
      click_link('Details')
    end
    expect(current_path).to match first.alias_name
    expect(find('.page-header')).to have_content(first.name)
    expect(page).to have_content(first.description)
    expect(page).to have_content(first.price)

    click_link('Back')
    expect(page).to have_content('Product catalog')
    expect(current_path).to eq '/'
  end

  scenario "I can navigate paginated items" do
    visit '/'

    expect(page).to have_content(first.name)
    expect(page).to have_content(second.name)
    expect(page).to have_content(third.name)

    click_link('2')

    expect(page).to have_content(fourth.name)
    expect(page).to have_content(fifth.name)
    expect(page).to have_content(sixth.name)
  end

  scenario "I can change number of items shown" do
    visit '/'
    expect(page).to have_selector('.caption', count: 3)

    click_link('6 products')
    expect(page).to have_selector('.caption', count: 6)

    click_link('9 products')
    expect(page).to have_selector('.caption', count: 9)
  end

end
