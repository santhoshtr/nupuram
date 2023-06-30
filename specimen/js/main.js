function addFooters(){
   document.querySelectorAll('.page footer').forEach((footer, key) => {
    footer.innerHTML=''
    const pageNumber = document.createElement('span')
    pageNumber.classList.add('footer-pageno')
    pageNumber.textContent = key+1
    footer.append(pageNumber)
    const typeName = document.createElement('span')
    typeName.classList.add('footer-typename')
    typeName.textContent = 'Nupuram'
    footer.append(typeName)
    const siteName = document.createElement('span')
    siteName.textContent = 'smc.org.in/fonts/nupuram'
    siteName.classList.add('footer-site')
    footer.append(siteName)
});
}

window.onload = function(){
    addFooters()
}