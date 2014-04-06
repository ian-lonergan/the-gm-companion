# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
ian = User.create(username: 'iplon', email: 'lonergan.ian@gmail.com', password: 'password', password_confirmation: 'password')
dead_head = Campaign.create(name: 'Dead Head', owner: ian, description: 'A sealed god of destruction is going to be freed from its divine prison, and the characters must stop it.', outline: 'Things happen and stuff.')
tarravan = CampaignObject.create(campaign: dead_head, name: 'Taravan', abstract: 'Area surrounding Taravan\'s Rest.')
Location.create(campaign_object: tarravan, map_key: 'Not actually filled out', map: File.new('spec/assets/images/Tarravan.png'))
anya = CampaignObject.create(campaign: dead_head, name: 'Anya Kamen', abstract: 'The worst paladin ever, eventually the worst Inquisitor ever.')
Character.create(campaign_object: anya, character_class: 'Inquisitor', gender: '?', race: 'Human', level: '6', description: 'Her face is horribly mauled from an acid splash.')
jowan = CampaignObject.create(campaign: dead_head, name: 'Jowan', abstract: 'Creepy and mysterious necromancer.')
Character.create(campaign_object: jowan, character_class: 'Dread Necromancer', gender: 'Male', race: 'Undead', level: '9', description: 'Once upon a time he was sickly, but with his new undead body he always seems preternaturally still.')
el_house = CampaignObject.create(campaign: dead_head, name: 'The House of El', abstract: 'The players enter a house in which nothing is what it seems and nowhere leads where it came from.')
Story.create(campaign_object: el_house)
