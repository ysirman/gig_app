import Vue from 'vue'
import Participation from './participation.vue'

document.addEventListener('DOMContentLoaded', () => {
  const participations = document.querySelectorAll('.js-participation')
  
  if (participations) {
    for (let i = 0; i < participations.length; i++) {
      let participation = participations[i]
      
      const firstParticipationId = participation.getAttribute('data-participation-id')
      const eventId = participation.getAttribute('data-event-id')
      new Vue({
        render: h => h(Participation, { props: { 
          firstParticipationId: firstParticipationId,
          eventId: eventId
        } })
      }).$mount('.js-participation')
    }
  }
})
