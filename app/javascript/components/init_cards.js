const checkEvent = () => {

}

const manipulateCard = () => {
  const cards = document.querySelectorAll('#display_food');
  console.log(cards);
  // find all of the item
  // add event listener to all of those items
  // figure which item and the one of in the map
  cards.forEach(card => card.addEventListener('mouseover', (event) => {
    const mealId = event.currentTarget.dataset.mealId;
    const marker = document.querySelector(`[data-id="${mealId}"]`);
    
    // debugger
    Mark
    marker.style.width = '50px';
  })
  )
}

export {
  manipulateCard
};