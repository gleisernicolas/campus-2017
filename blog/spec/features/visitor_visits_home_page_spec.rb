require 'rails_helper'

feature 'Visitor visits home page' do

  scenario 'success' do
  # data mockup

  # action execution
  visit root_path
  # expectations

  expect(page).to have_content('Meu blog')


  end
  # =========================

  scenario 'and view all posts' do
    post = Post.new(title: 'First Post',
                  content: 'First post of this blog',
                   author: 'Nicolas')
    post.save

    visit root_path

    expect(page).to have_content post.title
    expect(page).not_to have_content post.content
    expect(page).to have_content post.author


  end

end
