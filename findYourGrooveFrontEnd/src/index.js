const User = (() => {
  let totalUsers = 1

  return class User {
    constructor(name) {
      this.name = name
      this.likes = []
      this.id = totalUsers++
   }

  addlikes(like) {
    this.likes.push(like) 
    console.log(`${this.likes}`)
   }

 }
})()

let smith = new User("Smith")





const genreList = document.querySelector(".list-genre")

function genres(){
  fetch("http://localhost:3000/genres")
  .then(resp => resp.json())
  .then(genres => {
    addGenresToDom(genres)
  })
}


function addGenresToDom(genres){
    genres.map(genre => {
      displayGenreToDom(genre)
    })
}

function displayGenreToDom(genre) {
  const genreLI = document.createElement("li")
  genreLI.className = "list-group-item"
  genreLI.dataset.id = genre.id
   genreLI.innerHTML +=
  `
    ${genre.category}
  `
  genreList.appendChild(genreLI)
  genreEventListener(genre, genreLI)
}

function genreEventListener(genre, genreLI) {
  genreLI.addEventListener('click', function(e) {
    if(genre.subgenres.length) {
      addSubgenresToDom(genre, genreLI, e)
    }
  })
}


function addSubgenresToDom(genre, genreLI, e) {
  if (e.target.childNodes.length === 1 && e.target.className === 'list-group-item') {
    const genreDiv = document.createElement('div')
    genre.subgenres.forEach(subgenre => {
      genreDiv.innerHTML +=
      `
      <ul data-id=${subgenre.id}>
      ${subgenre.category}
      </ul>
      `
      genreLI.appendChild(genreDiv)
    })
  } else {
    for (let i = 1; i < e.target.childNodes.length; i++) {
      e.target.removeChild(e.target.lastElementChild)
    }
  }
}







genres()




























// import { Spotify } from 'spotify-web-api-js';
// // var s = new Spotify();
// //
// var spotifyApi = new SpotifyWebApi()
// spotifyApi.setAccessToken('03a5f4c9c9894e58b98287cc918c9b85')
//
// spotifyApi.getArtistAlbums('43ZHCT0cAZBISjO8DG9PnE', function(err, data) {
//   if (err) console.error(err);
//   else {
//     console.log('Artist albums', data);
//     debugger
//   }
// })
//
// function searchForm(){
//   const search = document.querySelector("#query")
//   search.addEventListener("click", function(e){
//     const querySearch = e.target.previousSibling.previousSibling.value
//     searchApi(querySearch)
//   })
// }
//
// function searchApi(query){
//   fetch("https://app.ticketmaster.com/discovery/v2/classifications/genres/KnvZfZ7vA71.json?apikey=hCbGdXTHK7nC0oEyyw6kV4GqzAfSxPan")
//   // fetch("https://app.ticketmaster.com/discovery/v2/classifications/genres/"+query+".json?apikey=hCbGdXTHK7nC0oEyyw6kV4GqzAfSxPan")
//   .then(resp => resp.json())
//   .then(data => {
//     debugger
//   })
// }
//
// searchForm()
