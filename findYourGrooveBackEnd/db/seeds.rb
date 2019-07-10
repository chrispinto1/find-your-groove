require 'pry'
# require 'rspotify'
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

# Band.destroy_all
# Subgenre.destroy_all
# Genre.destroy_all

# genres = RSpotify::Recommendations.available_genre_seeds
# # playlist = RSpotify::Playlist.find('wizzler', '00wHcTN0zQiun4xri9pmvX')
# binding.pry
# genreList = genres.map{|genre| Genre.create(category: genre.capitalize) }
#

binding.pry

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

nirvana= Band.create(name: "Nirvana")
blackSabbath= Band.create(name: "Black Sabbath")
beethoven= Band.create(name: "Beethoven")
johnnyCash= Band.create(name: "Johnny Cash")
bobMarleyAndTheWailers= Band.create(name: "Bob Marley and The Wailers")
daftPunk= Band.create(name: "Daft Punk")
wuTangClan= Band.create(name: "Wu-Tang Clan")
slayer= Band.create(name: "Slayer")
blackStreet= Band.create(name: "Blackstreet")
childishGambino= Band.create(name: "Childish Gambino")
prince= Band.create(name: "Prince")
louisArmstrongAndHisHotFive= Band.create(name: "Louis Armstrong and His Hot Five")
muddyWaters= Band.create(name: "Muddy Waters")

smells = Song.create(title: "Smells Like Teen Spirit",band_id: nirvana.id,spoitfy_snippet: nil)
heart = Song.create(title: "Heart Shaped Box",band_id: nirvana.id,spoitfy_snippet: nil)
inBloom = Song.create(title: "In Bloom",band_id: nirvana.id,spoitfy_snippet: nil)
angel = Song.create(title: "Angel of Death",band_id: slayer.id,spoitfy_snippet: nil)
ring = Song.create(title: "Ring of Fire",band_id: johnnyCash.id,spoitfy_snippet: nil)
purple = Song.create(title: "Purple Rain",band_id: prince.id,spoitfy_snippet: nil)
warPigs = Song.create(title: "War Pigs",band_id: blackSabbath.id,spoitfy_snippet: nil)
