const cardEventHandler = (event) => {
  const cardId = event.currentTarget.dataset.id
  // find marker through data marker id
  const marker = document.querySelector(`[data-marker-id="${cardId}"]`);
  // debugger
  console.log(cardId, marker.classList);
  const target = event.currentTarget;
  target.classList.add('animate', 'scale-up-center')
  marker.style.width = "50px";
  marker.style.height = "50px";
}

const attachCardToMarker = () => {
  const cards = document.querySelectorAll('#hovering-card');
  // find all of the item
  // add event listener to all of those items
  // figure which item and the one of in the map
  cards.forEach( card => card.addEventListener('mouseover', cardEventHandler) )
}

export {
  attachCardToMarker
};