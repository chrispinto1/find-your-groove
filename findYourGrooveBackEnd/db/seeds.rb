require 'pry'
require "discogs"
require 'rspotify'
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
# BandSubgenre.destroy_all
# Genre.destroy_all
# Subgenre.destroy_all
# Song.destroy_all
# Band.destroy_all

# genres = RSpotify::Recommendations.available_genre_seeds
# # playlist = RSpotify::Playlist.find('wizzler', '00wHcTN0zQiun4xri9pmvX')
# binding.pry
# genreList = genres.map{|genre| Genre.create(category: genre.capitalize) }

wrapper = Discogs::Wrapper.new("Test OAuth", user_token: "my_user_token")
results = wrapper.search("Nick Cave")

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
#
# altnerativeRock = Subgenre.create(category: "Alternative Rock", genre_id: rock.id)
# thrashMetal = Subgenre.create(category: "Thrash Metal", genre_id: metal.id)
# vaporwave = Subgenre.create(category: "Vaporwave", genre_id: electronic.id)
# punkRcok = Subgenre.create(category: "Punk Rock", genre_id: rock.id)
# rockNRoll = Subgenre.create(category: "Rock N Roll", genre_id: rock.id)
# progressiveRock = Subgenre.create(category: "Progressive Rock", genre_id: rock.id)
# hardRock = Subgenre.create(category: "Hard Rock", genre_id: rock.id)
# bassNDrum = Subgenre.create(category: "Bass & Drum", genre_id: electronic.id)
# eightBit = Subgenre.create(category: "8 Bit", genre_id: electronic.id)
# house = Subgenre.create(category: "House", genre_id: electronic.id)
# trance = Subgenre.create(category: "Trance", genre_id: electronic.id)
# trap = Subgenre.create(category: "Trap", genre_id: electronic.id)
#
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
prodigy = Band.create(name: "The Prodigy")
gorillaz = Band.create(name: "Gorillaz")
nin = Band.create(name: "Nine Inch Nails")
tearsForFears = Band.create(name: "Tears For Fears")
muse = Band.create(name: "Muse")
duranDuran = Band.create(name: "Duran Duran")
radiohead = Band.create(name: "Radiohead")
zacBrownBand = Band.create(name: "Zac Brown Band")
eagles = Band.create(name: "Eagles")
lynyrdSkynrd = Band.create(name: "Lynyrd Skynyrd")
brooksNDunn = Band.create(name: "Brooks & Dunn")
littleBigTown = Band.create(name: "Little Big Town")
bigNRich = Band.create(name: "Big & Rich")
rollingStones = Band.create(name: "The Rolling Stones")
marshallTuckerBand = Band.create(name: "The Marshall Tucker Band")
sugarland = Band.create(name: "Sugarland")
blackberrySmoke = Band.create(name: "Blackberry Smoke")
oldDominion = Band.create(name: "Old Dominion")
allmanBrothersBand = Band.create(name: "The Allman Brothers Band")
thousandHorses = Band.create(name: "A Thousand Horses")
ccr = Band.create(name: "Creedence Clearwater Revival")
diamondRio = Band.create(name: "Diamond Rio")
restlessHeart = Band.create(name: "Restless Heart")
wilco = Band.create(name: "Wilco")
flyingBurritoBrothers = Band.create(name: "The Flying Burrito Brothers")
tool = Band.create(name: "Tool")
ironMaiden = Band.create(name: "Iron Maiden")
death = Band.create(name: "Death")
rammstein = Band.create(name: "Rammstein")
mastodon = Band.create(name: "Mastodon")
kreator = Band.create(name: "Kreator")
behemoth = Band.create(name: "Behemoth")




#
# # smells = Song.create(title: "Smells Like Teen Spirit",band_id: nirvana.id,spoitfy_snippet: nil)
# # heart = Song.create(title: "Heart Shaped Box",band_id: nirvana.id,spoitfy_snippet: nil)
# # inBloom = Song.create(title: "In Bloom",band_id: nirvana.id,spoitfy_snippet: nil)
# # angel = Song.create(title: "Angel of Death",band_id: slayer.id,spoitfy_snippet: nil)
# # ring = Song.create(title: "Ring of Fire",band_id: johnnyCash.id,spoitfy_snippet: nil)
# # purple = Song.create(title: "Purple Rain",band_id: prince.id,spoitfy_snippet: nil)
# # warPigs = Song.create(title: "War Pigs",band_id: blackSabbath.id,spoitfy_snippet: nil)
# # binding.pry
Band.all.map do |band|
  search_response = RSpotify::Artist.search(band.name)
   if search_response.first.name.downcase == band.name.downcase
     search_response.first.top_tracks(:US).each do |track|
       band.songs << Song.create(title: track.name, spoitfy_snippet: track.preview_url)
     end
     search_response.first.genres.each do |genre|
       if Subgenre.find_by(category: genre)
         band.subgenres << Subgenre.find_by(category: genre)
       else
         band.subgenres << Subgenre.create(category: genre, genre_id: nil)
       end
     end
   end
end
