const mainDiv = document.querySelector("#mainbody")
const side_bar = document.createElement("div")
const row = document.createElement("div")
const col = document.createElement("div")
const title = document.createElement("div")
const genreList = document.createElement("ul")
const colE = document.createElement("div")
const bandDetail = document.createElement("h2")
const bandDetails = document.createElement("div")
bandDetail.innerHTML = `
Band Detail
`
colE.className = "col-md-8"
genreList.class = "list-genre"
genreList.id = "list-genre"
side_bar.id = "side-bar"
row.class = "row"
col.class = "col-md-4"
title.id = "title"

title.innerHTML = `
Find Your Groove ♫
`


function getUser(){
  mainDiv.innerHTML = `
    <div id = "userinput">
    <div class="ui left icon input">
    <input type="text" placeholder="Search users...">
    <i class="users icon"></i>
    </div>
    <button type="button" id = "user" class = "ui red button" name="button">Log In</button>
    </div>
  `
  const enterUser = document.querySelector('#userinput')
  enterUser.addEventListener('click', function(e){
    if(e.target.id === "user"){
      const username = e.target.previousSibling.previousElementSibling.childNodes[1].value
      createNewUser(username)
    }
  })
}

function createNewUser(username){
  fetch('http://localhost:3000/users',{
    method: 'POST',
    headers:{
      'Content-Type': 'application/json',
	     Accept: 'application/json'
     },
     body: JSON.stringify({name: `${username}`})
   })
   .then(resp => resp.json())
   .then(json => {
     genres()
   })
 }

// const User = (() => {
//   let totalUsers = 1
//
//   return class User {
//     constructor(name) {
//       this.name = name
//       this.likes = []
//       this.id = totalUsers++
//    }
//
//   addlikes(like) {
//     this.likes.push(like)
//     console.log(`${this.likes}`)
//    }
//
//  }
// })()
//
// let smith = new User("Smith")

function genres(){
  fetch("http://localhost:3000/genres")
  .then(resp => resp.json())
  .then(genres => {
    addGenresToDom(genres)
  })
}


function addGenresToDom(genres){
  mainDiv.innerHTML = ``
  side_bar.appendChild(row)
  row.appendChild(col)
  col.appendChild(genreList)
  genreList.appendChild(title)
  colE.appendChild(bandDetail)
  row.appendChild(colE)
  colE.appendChild(bandDetails)
  mainDiv.appendChild(side_bar)
  displayGenreToDom(genres)
}

function displayGenreToDom(genres) {
  genres.forEach(genre => {
    const genreLI = document.createElement("li")
    genreLI.dataset.id = genre.id
    genreLI.className = "list-group-item"
    genreLI.innerHTML +=`
    ${genre.category}
    `
    genreList.appendChild(genreLI)
    genreEventListener(genre, genreLI)
  })
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
      ${subgenre.category.charAt(0).toUpperCase() + subgenre.category.slice(1)}
      </ul>
      `
      genreLI.appendChild(genreDiv)
    })
    subgenreEventListener(genre.subgenres, genreDiv)
  } else {
    for (let i = 1; i < e.target.childNodes.length; i++) {
      e.target.removeChild(e.target.lastElementChild)
    }
  }
}

function subgenreEventListener(subgenre, genreDiv){
  genreDiv.addEventListener('click',function(e){
    sub_genre = subgenre.find(subgenre => {
      return subgenre.category == e.target.innerText.toLowerCase()
    })
    fetch('http://localhost:3000/subgenres/'+sub_genre.id)
    .then(resp => resp.json())
    .then(json => {
      findRandomArtist(json.bands)
    })
  })
}

function findRandomArtist(bands){
  const bandNumber = getRandomInt(0, bands.length)
  fetch('http://localhost:3000/bands/'+bands[bandNumber].id)
  .then(resp => resp.json())
  .then(band => {
    addBandToDom(band)
  })
}


function addBandToDom(band){
  //band info goes here band.description
  fetch("https://open.spotify.com/artist/3JysSUOyfVs1UQ0UaESheP")
  .then(resp => resp.html())
  .then(json => {
    debugger
  })
  song = findRandomSong(band)
}

function findRandomSong(band){
  randomSong = getRandomInt(0,band.songs.length)
  songInfo = band.songs[randomSong]
  return songInfo
}

function getRandomInt(min, max) {
  min = Math.ceil(min);
  max = Math.floor(max);
  return Math.floor(Math.random() * (max - min + 1)) + min;
}
getUser()
// genres()

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
