# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

refresh = Service.create(name: 'Refresher Facial', duration:'30 mins', description:'The refresher facial will decrease facial water retention and balance, cleanse, and moisturize your face.', cost:'$65')

men_facial = Service.create(name: 'Gentlemans Facial', duration:'60 mins', description:'The gentlemans facial begins with a deep cleansing, followed by an exfoliating scrub and extraction. To help replenish the skin, the facial ends with a soothing mask used to balance and hydrate your skin, and alleviate shaving irritation.', cost:'$110')

improve = Service.create(name: 'Improve Facial', duration:'60 mins', description:'Designed to improve your skin by clearing congested pores and clarifying your skin. This facial includes an enzyme and nutrient formulated mask to promote deep pore cleansing, in addition to an extraction and massage.', cost:'$110')

correct = Service.create(name: 'Correct & Pamper', duration:'90 mins', description:'Our ultimate signature facial will correct common skin problems such as congested pores, dehydration, aging, and discoloration. Your skin will look and feel rejuvenated, youthful, and radiant.', cost:'$160')

back = Service.create(name: 'Back Facials', duration:'30 mins', description:'Back facials can be beneficial in cleansing those tough-to-reach spots, targeting a variety of skin care needs such as clogged pores, back acne, and dehydrated skin. This treatment incorporates deep cleansing, extractions, and purifying masks.', cost:'$75')

scrub = Service.create(name: 'Aromatic Sugar Scrub', duration:'30 mins', description:'This full body exfoliation will leave your skin feeling silky smooth by eliminating dead skin cells and impurities, and allowing easier absorption of any moisturizing agent for healthier skin.', cost:'$95')

wrap = Service.create(name: 'Detoxifying Mud Wrap', duration:'60 mins', description:'An effective detox solution that eases the body’s water-retention. This unique treatment consists of an aroma sugar scrub and a detoxifying algae body mask.', cost:'$135')

avocado_wrap = Service.create(name: 'Avocado & Silk Wrap', duration:'60 mins', description:'This special wrap optimizes levels of fat and moisture in the skin and smooths dry, flaky patches. It also conditions the skin to feel soft and supply, reduces lines and wrinkles, and protects the skin from premature aging.', cost:'$150')

