# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
anya = CampaignObject.create(name: 'Anya Kamen', abstract: 'The worst paladin ever, eventually the worst Inquisitor ever.', notes: 'Her brother is more important that Shane realizes')
Character.create(campaign_object: anya, character_class: 'Inquisitor', gender: '?', race: 'Human', level: '6', description: 'Her face is horribly mauled from an acid splash.')
jowan = CampaignObject.create(name: 'Jowan', abstract: 'Creepy and mysterious necromancer.', notes: 'He doesn\'t actually want to harm any of the PCs, but he would in an instant if he had to.')
Character.create(campaign_object: jowan, character_class: 'Dread Necromancer', gender: 'Male', race: 'Undead', level: '9', description: 'Once upon a time he was sickly, but with his new undead body he always seems preternaturally still.')