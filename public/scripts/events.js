function onResponse(response) {
    if (!response.ok) {return null};
    return response.json();
}

function onLoadEventsJson(json){
    const eventList = document.querySelector('#all-events .event-list')
    eventList.innerHTML = ""
    if(json.length == 0){
        const p = document.createElement('p')
        p.classList.add('help')
        p.textContent = "Nessun risultato"
        eventList.appendChild(p)
        return
    }

    for (let i = 0; i < json.length; i++){

        const event = document.createElement('div')
        event.classList.add('event') 
        event.dataset.id = json[i].id
        const cover = document.createElement('img')
        cover.src = json[i].cover
        event.appendChild(cover)

        const overlay = document.createElement('div')
        overlay.classList.add('overlay')
        event.appendChild(overlay)

        const container = document.createElement('div')
        container.classList.add('container')

        const info = document.createElement('div')
        info.classList.add('info')
        const top = document.createElement('div')
        top.classList.add('top')
        const p = document.createElement('p')
        p.classList.add('duration')
        
        let hours = ""
        if(Math.floor(json[i].duration/60) == 0) hours = ""
        else if(Math.floor(json[i].duration/60) == 1) hours = "1 ora"
        else hours = Math.floor(json[i].duration/60) + " ore"

        let minutes = ""
        if(json[i].duration%60 == 0) miutes = ""
        else if(json[i].duration%60 == 1) minutes = " e 1 minuto"
        else minutes = " e " + json[i].duration%60 + " minuti"

        p.textContent = hours + minutes
        const bookmark = document.createElement('img')
        if(json[i].highlighted){
            bookmark.src = "images/bookmark-fill.svg"
            bookmark.addEventListener('click', removeFromHighlight)
        }else{
            bookmark.src = "images/bookmark.svg"
            bookmark.addEventListener('click', addToHighlight)
        }

        top.appendChild(p)
        top.appendChild(bookmark)

        const bottom = document.createElement('div')
        bottom.classList.add('bottom')
        const title = document.createElement('h1')
        title.textContent = json[i].title
        bottom.appendChild(title)
        bottom.addEventListener('click', showDetails)

        info.appendChild(top)
        info.appendChild(bottom)

        const dateContainer = document.createElement('div')
        dateContainer.classList.add('date-container')
        const dayMonth = document.createElement('p')
        dayMonth.classList.add('day-month')
        dayMonth.textContent = json[i].date_and_time.split("-")[2].split(" ")[0]+ "/" + json[i].date_and_time.split("-")[1]
        const year = document.createElement('p')
        year.classList.add('year')
        year.textContent = json[i].date_and_time.split("-")[0]
        const time = document.createElement('p')
        time.classList.add('time')
        time.textContent = json[i].date_and_time.substring(11, 16);

        dateContainer.appendChild(dayMonth)
        dateContainer.appendChild(year)
        dateContainer.appendChild(time)

        container.appendChild(dateContainer)
        container.appendChild(info)

        event.appendChild(container)
    
        eventList.appendChild(event)
    }
}

function loadHighlights(){
    function onLoadHighlightsJson(json){
        const highlights = document.querySelector('#all-events .highlights')
        highlights.innerHTML = ""

        if(json.length == 0){
            const p = document.createElement('p')
            p.classList.add('help')
            p.textContent = "Gli eventi in rilievo vengono visualizzati qui"
            highlights.appendChild(p)
            return
        }

        tagsHighlight = json[0].tags.split(", ")

        for (let i = 0; i < json.length; i++){

            const event = document.createElement('div')
            event.classList.add('event') 
            event.dataset.id = json[i].id
            const cover = document.createElement('img')
            cover.src = json[i].cover
            event.appendChild(cover)

            const overlay = document.createElement('div')
            overlay.classList.add('overlay')
            event.appendChild(overlay)

            const container = document.createElement('div')
            container.classList.add('container')

            const info = document.createElement('div')
            info.classList.add('info')
            const top = document.createElement('div')
            top.classList.add('top')
            const p = document.createElement('p')
            p.classList.add('duration')
            
            let hours = ""
            if(Math.floor(json[i].duration/60) == 0) hours = ""
            else if(Math.floor(json[i].duration/60) == 1) hours = "1 ora"
            else hours = Math.floor(json[i].duration/60) + " ore"

            let minutes = ""
            if(json[i].duration%60 == 0) miutes = ""
            else if(json[i].duration%60 == 1) minutes = " e 1 minuto"
            else minutes = " e " + json[i].duration%60 + " minuti"

            p.textContent = hours + minutes
            const bookmark = document.createElement('img')
            bookmark.src = "images/bookmark-fill.svg"
            bookmark.addEventListener('click', removeFromHighlight)

            top.appendChild(p)
            top.appendChild(bookmark)

            const bottom = document.createElement('div')
            bottom.classList.add('bottom')
            const title = document.createElement('h1')
            title.textContent = json[i].title
            bottom.appendChild(title)
            bottom.addEventListener('click', showDetails)

            info.appendChild(top)
            info.appendChild(bottom)

            const dateContainer = document.createElement('div')
            dateContainer.classList.add('date-container')
            const dayMonth = document.createElement('p')
            dayMonth.classList.add('day-month')
            dayMonth.textContent = json[i].date_and_time.split("-")[2].split(" ")[0]+ "/" + json[i].date_and_time.split("-")[1]
            const year = document.createElement('p')
            year.classList.add('year')
            year.textContent = json[i].date_and_time.split("-")[0]
            const time = document.createElement('p')
            time.classList.add('time')
            time.textContent = json[i].date_and_time.substring(11, 16);

            dateContainer.appendChild(dayMonth)
            dateContainer.appendChild(year)
            dateContainer.appendChild(time)

            container.appendChild(dateContainer)
            container.appendChild(info)

            event.appendChild(container)
        
            highlights.appendChild(event)
        }   
    }

    fetch("events/loadHighlights").then(onResponse).then(onLoadHighlightsJson).then(loadAdv)
}

function loadByClick(){
    const button = document.querySelector('.filter input[type="submit"]')
    const checkbox = button.parentNode.parentNode.querySelector('input[type="checkbox"]')
    const limit = button.parentNode.parentNode.querySelector('input[type="number"]')
    if(limit.value == "") limit.value = 10
    fetch("events/loadEvents/" + checkbox.checked + "/" + limit.value).then(onResponse).then(onLoadEventsJson)
}

function addToHighlight(event){
    const id = event.currentTarget.parentNode.parentNode.parentNode.parentNode.dataset.id
    fetch("events/addToHighlights/" + id).then(loadByClick).then(loadHighlights).then(loadAdv)
}

function removeFromHighlight(event){
    const id = event.currentTarget.parentNode.parentNode.parentNode.parentNode.dataset.id
    fetch("events/removeFromHighlights/" + id).then(loadByClick).then(loadHighlights).then(loadAdv)
}

function onLoadMainEvent(json){
    const main = document.querySelector('#main-event')
    main.innerHTML = ""
    const mainText = document.createElement('div')
    mainText.classList.add('main-text')

    const coverContainer = document.createElement('div')
    coverContainer.classList.add('cover-container')
    const cover = document.createElement('img')
    cover.src = json.cover
    coverContainer.appendChild(cover)

    const datetimeContainer = document.createElement('div')
    datetimeContainer.classList.add('date-container')
    const date = document.createElement('h4')
    date.textContent = json.date_and_time.split("-")[2].split(" ")[0] + " " + getMonth(json.date_and_time.split("-")[1]) 
    + " " + json.date_and_time.split("-")[0]
    const time = document.createElement('p')
    time.textContent = "Ore " + json.date_and_time.substring(11, 16)

    datetimeContainer.appendChild(date)
    datetimeContainer.appendChild(time)

    const mainInfo = document.createElement('div')
    mainInfo.classList.add('main-info')
    const title = document.createElement('h1')
    title.textContent = json.title

    let hours = ""
    if(Math.floor(json.duration/60) == 0) hours = ""
    else if(Math.floor(json.duration/60) == 1) hours = "1 ora"
    else hours = Math.floor(json.duration/60) + " ore"

    let minutes = ""
    if(json.duration%60 == 0) miutes = ""
    else if(json.duration%60 == 1) minutes = "e 1 minuto"
    else minutes = " e " + json.duration%60 + " minuti"

    const duration = document.createElement('p')
    duration.textContent = hours + minutes

    mainInfo.appendChild(title)
    mainInfo.appendChild(duration)

    const staff = document.createElement('div')
    staff.classList.add('staff')

    // Director
    const director = document.createElement('div')
    director.classList.add('director')

    const profilePicDirector = document.createElement('div')
    profilePicDirector.classList.add('profile-pic')
    const imgDirector = document.createElement('img')
    imgDirector.src = json.dir_img
    profilePicDirector.appendChild(imgDirector)
    const directorInfo = document.createElement('div')
    directorInfo.classList.add('director-info')
    const name_dir = document.createElement('h4')
    name_dir.textContent = "Direttore Artistico: " + json.dir_name + " " + json.dir_surname
    directorInfo.appendChild(name_dir)
    const qualificationDirector = document.createElement('p')
    qualificationDirector.textContent = json.dir_qualification
    directorInfo.appendChild(qualificationDirector)

    director.appendChild(profilePicDirector)
    director.appendChild(directorInfo)

    const guide = document.createElement('div')
    guide.classList.add('guide')
    const profilePicGuide = document.createElement('div')
    profilePicGuide.classList.add('profile-pic')
    const imgGuide = document.createElement('img')
    imgGuide.src = json.guide_img
    profilePicGuide.appendChild(imgGuide)
    const guideInfo = document.createElement('div')
    guideInfo.classList.add('guide-info')
    const name_guide = document.createElement('h4')
    name_guide.textContent = "Guida: " + json.guide_name + " " + json.guide_surname
    guideInfo.appendChild(name_guide)
    const qualificationGuide = document.createElement('p')
    qualificationGuide.textContent = json.guide_qualification
    guideInfo.appendChild(qualificationGuide)

    guide.appendChild(profilePicGuide)
    guide.appendChild(guideInfo)

    staff.appendChild(director);
    staff.appendChild(guide)

    mainText.appendChild(datetimeContainer)
    mainText.appendChild(mainInfo)
    mainText.appendChild(staff)
    main.appendChild(coverContainer)
    main.appendChild(mainText)
}

function showDetails(event){
    const id = event.currentTarget.parentNode.parentNode.parentNode.dataset.id
    fetch("events/details/" + id).then(onResponse).then(onLoadMainEvent)
}

function getMonth(number){
    switch(number){
        case '01': return "Gennaio"; break;
        case '02': return "Febbraio"; break;
        case '03': return "Marzo"; break;
        case '04': return "Aprile"; break;
        case '05': return "Maggio"; break;
        case '06': return "Giugno"; break;
        case '07': return "Luglio"; break;
        case '08': return "Agosto"; break;
        case '09': return "Settembre"; break;
        case '10': return "Ottobre"; break;
        case '11': return "Novembre"; break;
        case '12': return "Dicembre"; break; 
        default: return "";
    }
}

function loadFirstElement(){
    const firstElementId = document.querySelector('.event-list .event').dataset.id
    fetch("events/details/" + firstElementId).then(onResponse).then(onLoadMainEvent)
}

function loadAdv(){
    function onLoadAdvJson(json){
        const adv = document.querySelector('#adv')
        adv.innerHTML = ""
        if(json != null || json.length > 0){
            const h1 = document.createElement('h1')
            h1.textContent = "Potrebbero piacerti"
            adv.appendChild(h1)
            const videos = document.createElement('div')
            videos.classList.add('videos')

            for (let i = 0; i < 3; i++){
                const box = document.createElement('div')
                box.classList.add('box')
                const iframe = document.createElement('div')
                iframe.innerHTML = json[i].embed
                const caption = document.createElement('p')
                caption.textContent = json[i].title
                box.appendChild(iframe)
                box.appendChild(caption)
                videos.appendChild(box)
            }
            adv.appendChild(videos)
        }
        
    }

    if(tagsHighlight.length == 0) fetch("events/loadAdvCategory").then(onResponse).then(onLoadAdvJson)
    else{
        const query = tagsHighlight[Math.floor(Math.random() * tagsHighlight.length)]
        fetch("events/loadAdv/" + query).then(onResponse).then(onLoadAdvJson)
    }
}

function show(){
    button.removeEventListener('click', show);
    button.src = "images/x-lg.svg";
    button.addEventListener('click', hide);
    document.querySelector('nav').style.position = "fixed";
    document.querySelector('nav').style.display = "block";
}
function hide(){
    button.removeEventListener('click', hide);
    button.src = "images/list.svg";
    button.addEventListener('click', show);
    button.style.position = "fixed";
    document.querySelector('nav').style.display = "none";
}

let tagsHighlight = []
loadHighlights()
fetch("events/loadEvents/false/10").then(onResponse).then(onLoadEventsJson).then(loadFirstElement)
const buttonFilter = document.querySelector('.filter input[type="submit"]')
buttonFilter.addEventListener('click', loadByClick)
const button = document.querySelector('#show-menu');
button.addEventListener('click', show);