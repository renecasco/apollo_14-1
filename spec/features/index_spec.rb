require 'rails_helper'

describe 'When a user vists /astronauts' do
  it 'sees a list of astronauts with their name, age and job' do
    astronaut_1 = Astronaut.create(name: "Jon", age: 35, job: "Captain")
    astronaut_2 = Astronaut.create(name: "Jane", age: 32, job: "Lead Scientist")

    visit astronauts_path

    expect(page).to have_content("Jon")
    expect(page).to have_content("35")
    expect(page).to have_content("Captain")

    expect(page).to have_content("Jane")
    expect(page).to have_content("32")
    expect(page).to have_content("Lead Scientist")
  end

  it 'sees a list of the space missions in alphabetical order for each astronaut' do
    astronaut_1 = Astronaut.create(name: "Jon", age: 35, job: "Captain")
    astronaut_2 = Astronaut.create(name: "Jane", age: 32, job: "Lead Scientist")

    mission_1 = astronaut_1.missions.create(title: "To the moon and back", time_in_space: 3)
    mission_2 = astronaut_1.missions.create(title: "Mars Attack", time_in_space: 2)
    mission_3 = astronaut_2.missions.create(title: "Plutonic Love", time_in_space: 1)


    visit astronauts_path

    expect(page).to have_content("To the moon and back")
    expect(page).to have_content("3")
    expect(page).to have_content("Mars Attacks")
    expect(page).to have_content("2")
    expect(page).to have_content("Plutonic Love")
    expect(page).to have_content("1")
  end
end
