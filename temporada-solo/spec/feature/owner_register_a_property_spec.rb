require 'rails_helper'

feature 'Owner register a property' do
  scenario 'successfully' do
    PropertyType.create(name: 'Apartamento na praia')
    PropertyType.create(name: 'Sitio para festa')

    visit root_path

    click_on 'Cadastrar imóvel'
    fill_in 'Título' , with: 'Apartamento no guarujá'
    fill_in 'Localização' , with: 'Guarujá'
    select  'Apartamento na praia' ,  from: 'Tipo do imóvel'
    fill_in 'Area' , with: '30'
    fill_in 'Quantidade de quartos' , with: 3
    fill_in 'Máximo de pessoas' , with: 12
    fill_in 'Minimo de dias para locação' , with: 5
    fill_in 'Máximo de dias para locação' , with: 30
    fill_in 'Diária' , with: 300.50
    fill_in 'Foto' , with: 'foto_boa.png'
    fill_in 'Descrição' , with: 'Bom apartamento no guarujá'
    fill_in 'Regras de uso' , with: 'Não pode cachorro'

    click_on 'Cadastrar'

    expect(page).to have_css('dd', text: 'Apartamento no guarujá')
    expect(page).to have_css('dd', text: 'Guarujá')
    expect(page).to have_css('dd', text: 'Apartamento na praia')
    expect(page).to have_css('dd', text: '30m²')
    expect(page).to have_css('dd', text: '3')
    expect(page).to have_css('dd', text: '12')
    expect(page).to have_css('dd', text: '5')
    expect(page).to have_css('dd', text: '30')
    expect(page).to have_css('dd', text: 'R$ 300,50')
    expect(page).to have_css('dd', text: 'foto_boa.png')
    expect(page).to have_css('dd', text: 'Bom apartamento no guarujá')
    expect(page).to have_css('dd', text: 'Não pode cachorro')


  end


end
