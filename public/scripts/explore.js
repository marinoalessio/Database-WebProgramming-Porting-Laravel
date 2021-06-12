function onResponse(response) {
    if (!response.ok) {return null};
    return response.json();
}

function fetchProfileInfo(){    //done

    function profileInfoJson(json){
        nFollowings = document.querySelector('.info-block .nfollowing .number')
        nReviews = document.querySelector('.info-block .nreviews .number')
        nFollowings.textContent = json.nfollowing
        nReviews.textContent = json.nreviews
    }

    fetch("explore/profile_info").then(onResponse).then(profileInfoJson);
}

function chooseArtwork(event) {
    function quitModalExit(event){
        modalWindow.remove()
        document.body.classList.remove('no-scroll');
    }

    function searchArtworks(event){

        function reset(event){
            const toAddButton = event.currentTarget.parentNode.querySelector('input[type="button"')
            toAddButton.classList.remove('hidden')
            event.currentTarget.remove()
            document.querySelector('form[name="write-review"] .choose .container').remove()
        }

        function addToPostWindow(event){
            const imageAddress = event.currentTarget.querySelector('img').currentSrc

            const choose = document.querySelector('#create-post form .choose')
            const button = choose.querySelector('input[type="button"]')
            button.classList.add('hidden')

            const container = document.createElement('div')
            container.dataset.id = event.currentTarget.dataset.id
            container.classList.add('container')

            const imageContainer = document.createElement('div')
            const image = document.createElement('img')
            image.src = imageAddress
            imageContainer.appendChild(image)

            const infoContainer = document.createElement('div')
            const h1 = document.createElement('h1')
            h1.textContent = event.currentTarget.querySelector('h1').textContent
            infoContainer.appendChild(h1)
                      
            const imgExit = document.createElement('img')
            imgExit.classList.add('quit')
            imgExit.setAttribute('src', 'images/x-circle.svg')
            imgExit.addEventListener('click', reset)
            
            choose.appendChild(imgExit)
            container.appendChild(imageContainer)
            container.appendChild(infoContainer)
            choose.appendChild(container)
        }

        function onJson(json) {
            artworks.innerHTML = ""
            for (let i = 0; i < json.length; i++) {
                //artworks è il contenitore
                
                const div = document.createElement('div')
                div.classList.add('artwork')
                div.dataset.id = json[i].id

                const overlay = document.createElement('div')
                overlay.classList.add('overlay')

                const caption = document.createElement('h1')
                caption.textContent = json[i].title
                const img = document.createElement('img')
                img.setAttribute('src', json[i].image_id)

                div.appendChild(overlay)
                div.appendChild(img)
                div.appendChild(caption)

                div.addEventListener('click', addToPostWindow)
                div.addEventListener('click', quitModalExit)
                artworks.appendChild(div)
            }

        }

        function onResponse(response) {
            return response.json()
        }

        fetch('explore/fetchArtworks/' + inputSearch.value).then(onResponse).then(onJson)
    }
    
    document.body.classList.add('no-scroll');

    const modalWindow = document.createElement('div')
    modalWindow.classList.add('modal-window')
    modalWindow.style.top = window.pageYOffset + 'px';

    //div search
    const search = document.createElement('div')
    search.classList.add('search')
    const imgExit = document.createElement('img')
    imgExit.setAttribute('src', 'images/x-circle.svg')
    imgExit.addEventListener('click', quitModalExit)
    search.appendChild(imgExit)

    const label = document.createElement('label') //titolo cerca
    label.textContent = 'Quale opera vuoi valutare?'
    label.setAttribute('for', 'search')
    search.appendChild(label)

    const inputSearch = document.createElement('input') //creazione input
    inputSearch.setAttribute('type', 'text')
    const buttonSearch = document.createElement('button') //creazione button
    buttonSearch.setAttribute('type', 'button')
    buttonSearch.textContent = "Cerca"
    buttonSearch.addEventListener('click', searchArtworks)
    search.appendChild(inputSearch)
    search.appendChild(buttonSearch)

    //div artworks
    const artworks = document.createElement('div')
    artworks.classList.add('artworks')

    modalWindow.appendChild(search)
    modalWindow.appendChild(artworks)
    document.body.appendChild(modalWindow)
}

function post(event){

    event.preventDefault()
    if(
        formReview.querySelector('.choose div.container') === null || 
        formReview.querySelector('.write textarea').textLength < 10 || 
        formReview.querySelector('select[name="rating"] option[value="0"]').selected
    ){
        if(!formReview.querySelector('p.error')){
            const error = document.createElement('p')
            error.classList.add('error')
            error.textContent = "Scegliere un'opera. La lunghezza del testo deve essere maggiore di 10 caratteri e infine attribuire una valutazione."
            formReview.insertBefore(error, formReview.firstChild)
        }
    }else{
        formData = new FormData()
        formData.append("artwork_id", formReview.querySelector('.choose .container').dataset.id)
        formData.append("img", formReview.querySelector('.choose .container img').src)
        formData.append("stars", formReview.querySelector('.submit .rating select').value)
        formData.append("comment", formReview.querySelector('.write textarea').value)

        fetch("explore/postReview", {headers: {'x-csrf-token' : formReview._token.value}, 
        method: 'POST', body: formData}).then(onResponse).then(postWarning).then(resetForm).then(loadProfileReviews)
    }
}

function postWarning(json){
    if(!json.ok){
        const reviews = document.querySelector('#reviews')
        const warning = document.createElement('p')
        warning.classList.add('warning')
        warning.textContent = json.error
        reviews.insertBefore(warning, reviews.firstChild)
        setTimeout(function(){warning.remove()}, 5000)
    }
}

function resetForm(){
    formReview.querySelector('.choose img.quit').remove()
    formReview.querySelector('.choose div.container').remove()
    const button = formReview.querySelector('.choose input')
    button.classList.remove('hidden')
    formReview.querySelector('.write textarea').value = ""
    formReview.querySelector('select[name="rating"] option[value="0"]').selected = 'selected'
}

function convertStars(number){
    switch(number){
        case 1: return "&#9733&#9734&#9734&#9734&#9734"; break;
        case 2: return "&#9733&#9733&#9734&#9734&#9734"; break;
        case 3: return "&#9733&#9733&#9733&#9734&#9734"; break;
        case 4: return "&#9733&#9733&#9733&#9733&#9734"; break;
        case 5: return "&#9733&#9733&#9733&#9733&#9733"; break;
        default: return "";
    }
}

function onLoadOthersReviewsJson(json){
    const others = document.querySelector('#reviews')

    const articleList = others.querySelectorAll('article')
    for(let item of articleList) item.remove();

    for (let i = 0; i < json.length; i++){
        const article = document.createElement('article')

        const topArticle = document.createElement('div')
        topArticle.classList.add('top-article')
        const category = document.createElement('span')
        category.textContent = json[i].category
        const stars = document.createElement('span')
        stars.classList.add('stars')
        stars.innerHTML = convertStars(json[i].stars)
        topArticle.appendChild(category)
        topArticle.appendChild(stars)

        const userInfo = document.createElement('div')
        userInfo.classList.add('user-info')

        const avatar = document.createElement('div')
        avatar.classList.add('avatar')
        const avatarImg = document.createElement('img')
        avatarImg.src = json[i].avatar
        avatar.appendChild(avatarImg)
        userInfo.appendChild(avatar)

        const userDetails = document.createElement('div')
        userDetails.classList.add('user-details')

        const name = document.createElement('p')
        name.textContent = json[i].name +' ' + json[i].surname
        userDetails.appendChild(name)
        const username = document.createElement('p')
        username.classList.add('username')
        username.textContent = json[i].username
        userDetails.appendChild(username)
        userInfo.appendChild(userDetails)

        const artwork = document.createElement('div')
        artwork.classList.add('artwork')

        const title = document.createElement('p')
        title.textContent = json[i].title
        artwork.appendChild(title)
        const placeOfOrigin = document.createElement('p')
        placeOfOrigin.classList.add('place-of-origin')
        placeOfOrigin.textContent = json[i].place_of_origin + ', ' + json[i].publication_year
        artwork.appendChild(placeOfOrigin)
        const artists = document.createElement('p')
        artists.textContent = json[i].artists 
        artwork.appendChild(artists)
        const imgContainer = document.createElement('div')
        const img = document.createElement('img')
        img.src = json[i].img
        imgContainer.appendChild(img)
        artwork.appendChild(imgContainer)
        const comment = document.createElement('p')
        comment.classList.add('comment')
        comment.textContent = json[i].body

        const bottomArticle = document.createElement('div')

        bottomArticle.classList.add('bottom-article')
        const publication = document.createElement('span')
        publication.textContent = json[i].publication_date
        bottomArticle.appendChild(publication)
        const like = document.createElement('span')
        like.classList.add('like')
        like.dataset.reviewId = json[i].review_id
        const numLikes = document.createElement('span')
        numLikes.classList.add('num-likes')
        numLikes.textContent = json[i].likes
        const imgLike = document.createElement('img')
        if(json[i].is_liked){
            imgLike.src = "images/like.png"
            like.addEventListener('click', unlikeReview)
        }else{
            imgLike.src = "images/unlike.png"
            like.addEventListener('click', likeReview)
        }
        like.appendChild(numLikes)
        like.appendChild(imgLike)
        bottomArticle.appendChild(like)

        article.appendChild(topArticle)
        article.appendChild(artwork)
        article.appendChild(userInfo)
        article.appendChild(comment)
        article.appendChild(bottomArticle)

        others.appendChild(article)
    }
}

function onLoadProfileReviewsJson(json){
    const profile = document.querySelector('#profile')
    const articleList = profile.querySelectorAll('article')
    for(let item of articleList) item.remove();

    for (let i = 0; i < json.length; i++){
        const article = document.createElement('article')

        const topArticle = document.createElement('div')
        topArticle.classList.add('top-article')
        const category = document.createElement('span')
        category.textContent = json[i].category
        const stars = document.createElement('span')
        stars.classList.add('stars')
        stars.innerHTML = convertStars(json[i].stars)
        topArticle.appendChild(category)
        topArticle.appendChild(stars)

        const userInfo = document.createElement('div')
        userInfo.classList.add('user-info')

        const avatar = document.createElement('div')
        avatar.classList.add('avatar')
        const avatarImg = document.createElement('img')
        avatarImg.src = json[i].avatar
        avatar.appendChild(avatarImg)
        userInfo.appendChild(avatar)

        const userDetails = document.createElement('div')
        userDetails.classList.add('user-details')

        const name = document.createElement('p')
        name.textContent = json[i].name +' ' + json[i].surname
        userDetails.appendChild(name)
        const username = document.createElement('p')
        username.classList.add('username')
        username.textContent = json[i].username
        userDetails.appendChild(username)
        userInfo.appendChild(userDetails)

        const artwork = document.createElement('div')
        artwork.classList.add('artwork')

        const title = document.createElement('p')
        title.textContent = json[i].title
        artwork.appendChild(title)
        const placeOfOrigin = document.createElement('p')
        placeOfOrigin.classList.add('place-of-origin')
        placeOfOrigin.textContent = json[i].place_of_origin + ', ' + json[i].publication_year
        artwork.appendChild(placeOfOrigin)
        const artists = document.createElement('p')
        artists.textContent = json[i].artists 
        artwork.appendChild(artists)
        const imgContainer = document.createElement('div')
        const img = document.createElement('img')
        img.src = json[i].img
        imgContainer.appendChild(img)
        artwork.appendChild(imgContainer)
        const comment = document.createElement('p')
        comment.classList.add('comment')
        comment.textContent = json[i].body

        const bottomArticle = document.createElement('div')

        bottomArticle.classList.add('bottom-article')
        const publication = document.createElement('span')
        publication.textContent = json[i].publication_date
        bottomArticle.appendChild(publication)
        const like = document.createElement('span')
        like.classList.add('like')
        like.dataset.reviewId = json[i].review_id
        const numLikes = document.createElement('span')
        numLikes.classList.add('num-likes')
        numLikes.textContent = json[i].likes
        const imgLike = document.createElement('img')
        if(json[i].is_liked){
            imgLike.src = "images/like.png"
            like.addEventListener('click', unlikeReview)
        }else{
            imgLike.src = "images/unlike.png"
            like.addEventListener('click', likeReview)
        }
        like.appendChild(numLikes)
        like.appendChild(imgLike)
        bottomArticle.appendChild(like)

        article.appendChild(topArticle)
        article.appendChild(artwork)
        article.appendChild(userInfo)
        article.appendChild(comment)
        article.appendChild(bottomArticle)

        profile.appendChild(article)
    }
}

function loadProfileReviews(){
    fetch("explore/loadUserReview").then(onResponse).then(onLoadProfileReviewsJson).then(fetchProfileInfo)
}

function loadOthersReviews(){
    fetch("explore/loadOthersReview").then(onResponse).then(onLoadOthersReviewsJson)
}

function unlikeReview(event){
    
    event.currentTarget.removeEventListener('click', unlikeReview)
    const numLikes = event.currentTarget.querySelector('.num-likes')
    
    function onUnlikeJson(n_likes){
        
        numLikes.textContent = n_likes
    }
    const img = event.currentTarget.querySelector('img')
    img.src = "images/unlike.png"

    const reviewId = event.currentTarget.dataset.reviewId
    fetch("explore/unlike/" + reviewId).then(onResponse).then(onUnlikeJson)

    event.currentTarget.addEventListener('click', likeReview)
}

function likeReview(event){

    function onLikeJson(n_likes){
        numLikes.textContent = n_likes
    }

    event.currentTarget.removeEventListener('click', likeReview)
    const numLikes = event.currentTarget.querySelector('.num-likes')

    const img = event.currentTarget.querySelector('img')
    img.src = "images/like.png"

    const reviewId = event.currentTarget.dataset.reviewId
    fetch("explore/like/" + reviewId).then(onResponse).then(onLikeJson)
    event.currentTarget.addEventListener('click', unlikeReview)
}

function loadFollowings(event){

    function onLoadFollowingsJson(json){
        const userSubscription = document.querySelector('#subscriptions .user-subscriptions')
        const otherDirectors = document.querySelector('#subscriptions .other-directors')
        userSubscription.innerHTML = ""
        otherDirectors.innerHTML = ""
        for (let i = 0; i < json.length; i++){

            const directorDiv = document.createElement('div')
            directorDiv.classList.add('director')
            directorDiv.dataset.id = json[i].id

            const imgContainer = document.createElement('span')
            imgContainer.classList.add('img-container')
            const profileImage = document.createElement('img')
            profileImage.src = json[i].img
            imgContainer.appendChild(profileImage)

            const infoContainer = document.createElement('span')
            infoContainer.classList.add('info-container')
            const name = document.createElement('p')
            name.textContent = json[i].name + " " + json[i].surname
            const qualification = document.createElement('p')
            qualification.classList.add('qualification')
            qualification.textContent = json[i].qualification
            infoContainer.appendChild(name)
            infoContainer.appendChild(qualification)

            directorDiv.appendChild(imgContainer)
            directorDiv.appendChild(infoContainer)

            const followContainer = document.createElement('span')
            followContainer.classList.add('follow-container')
            const followImage = document.createElement('img')

            if(json[i].is_following == true){
                followImage.src = "images/person-check.svg"
                followImage.addEventListener('click', unfollowDirector)
                followContainer.appendChild(followImage)
                directorDiv.appendChild(followContainer)
                userSubscription.appendChild(directorDiv)
            }else{
                followImage.src = "images/person-plus.svg"
                followImage.addEventListener('click', followDirector)
                followContainer.appendChild(followImage)
                directorDiv.appendChild(followContainer)
                otherDirectors.appendChild(directorDiv)
            }
        }
        //alla fine del for
        const firstH4 = document.querySelector('#subscriptions h4:first-child')
        const secondH4 = document.querySelectorAll('#subscriptions h4')[1]

        if(!otherDirectors.querySelector('.director')){
            const nothing = document.createElement('p')
            nothing.textContent = "Non c'è più altro da mostrare"
            otherDirectors.appendChild(nothing)
        }else secondH4.textContent = "Altri Direttori Artistici"

        if(!userSubscription.querySelector('.director')){
            firstH4.classList.add('hidden')
            secondH4.textContent = "Tutti i Direttori Artistici"
        }else firstH4.classList.remove('hidden')
    }
    fetch("explore/loadFollowings").then(onResponse).then(onLoadFollowingsJson)
}

function unfollowDirector(event){
    const idDirector = event.currentTarget.parentNode.parentNode.dataset.id
    fetch("explore/unfollowDirector/" + idDirector).then(loadFollowings).then(fetchProfileInfo)
}

function followDirector(event){
    const idDirector = event.currentTarget.parentNode.parentNode.dataset.id
    fetch("explore/followDirector/" + idDirector).then(loadFollowings).then(fetchProfileInfo)
}

function show(event){
    button.removeEventListener('click', show);
    button.src = "images/x-lg.svg";
    button.addEventListener('click', hide);
    document.querySelector('nav').style.position = "fixed";
    document.querySelector('nav').style.display = "block";
    document.querySelector('#nav-back').style.display = "block";
    document.querySelector('#nav-back').style.height = "180px";
}
function hide(event){
    button.removeEventListener('click', hide);
    button.src = "images/list.svg";
    button.addEventListener('click', show);
    button.style.position = "fixed";
    document.querySelector('nav').style.display = "none";
    document.querySelector('#nav-back').style.display = "none";

}

let limit = 10
let userId = 0; //viene settato all'ingresso
const formReview = document.querySelector('form[name="write-review"]')
const buttonArtwork = formReview.querySelector('.choose input[type="button"]')
buttonArtwork.addEventListener('click', chooseArtwork)

const button = document.querySelector('#show-menu');
button.addEventListener('click', show);

const submitPost = formReview.querySelector('.submit input[type="submit"]')
submitPost.disabled = false
submitPost.addEventListener('click', post)
loadProfileReviews()
loadOthersReviews()
loadFollowings()