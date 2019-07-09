require 'pry'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# params = {page: 5, size: 10, source: 'ticketmaster'}
# client = Ticketmaster.client(apikey: ENV["TICKET_MASTER_CLIENT_ID"])
# response = client.search_events(params: params)
# events = response.results
#
Band.destroy_all
Subgenre.destroy_all
Genre.destroy_all

blues = Genre.create(category: "Blues")
classical = Genre.create(category: "Classical")
country = Genre.create(category: "Country")
electronic = Genre.create(category: "Electronic")
hiphop = Genre.create(category: "Hip-Hop")
jazz = Genre.create(category: "Jazz")
pop = Genre.create(category: "Pop")
rap = Genre.create(category: "Rap")
rnb = Genre.create(category: "R & B")
reggae = Genre.create(category: "Reggae")
rock = Genre.create(category: "Rock")
metal = Genre.create(category: "Metal")

altnerativeRock = Subgenre.create(category: "Alternative Rock", genre_id: rock.id)
thrashMetal = Subgenre.create(category: "Thrash Metal", genre_id: metal.id)
vaporwave = Subgenre.create(category: "Vaporwave", genre_id: electronic.id)
punkRcok = Subgenre.create(category: "Punk Rock", genre_id: rock.id)
rockNRoll = Subgenre.create(category: "Rock N Roll", genre_id: rock.id)
progressiveRock = Subgenre.create(category: "Progressive Rock", genre_id: rock.id)
hardRock = Subgenre.create(category: "Hard Rock", genre_id: rock.id)
bassNDrum = Subgenre.create(category: "Bass & Drum", genre_id: electronic.id)
eightBit = Subgenre.create(category: "8 Bit", genre_id: electronic.id)
house = Subgenre.create(category: "House", genre_id: electronic.id)
trance = Subgenre.create(category: "Trance", genre_id: electronic.id)
trap = Subgenre.create(category: "Trap", genre_id: electronic.id)

nirvana= Band.create(spotify_id: nil, name: "Nirvana", genre_id: rock.id)
blackSabbath= Band.create(spotify_id: nil, name: "Black Sabbath", genre_id: rock.id)
beethoven= Band.create(spotify_id: nil, name: "Beethoven", genre_id: classical.id)
johnnyCash= Band.create(spotify_id: nil, name: "Johnny Cash", genre_id: country.id)
bobMarleyAndTheWailers= Band.create(spotify_id: nil, name: "Bob Marley and The Wailers", genre_id: reggae.id)
daftPunk= Band.create(spotify_id: nil, name: "Daft Punk", genre_id: electronic.id)
wuTangClan= Band.create(spotify_id: nil, name: "Wu-Tang Clan", genre_id: hiphop.id)
slayer= Band.create(spotify_id: nil, name: "Slayer", genre_id: metal.id)
blackStreet= Band.create(spotify_id: nil, name: "Blackstreet", genre_id: rnb.id)
childishGambino= Band.create(spotify_id: nil, name: "Childish Gambino", genre_id: rap.id)
prince= Band.create(spotify_id: nil, name: "Prince", genre_id: pop.id)
louisArmstrongAndHisHotFive= Band.create(spotify_id: nil, name: "Louis Armstrong and His Hot Five", genre_id: jazz.id)
muddyWaters= Band.create(spotify_id: nil, name: "Muddy Waters", genre_id: blues.id)
