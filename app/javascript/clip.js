import Vue from 'vue'
import Clip from './clip.vue'

document.addEventListener('DOMContentLoaded', () => {
  const clips = document.querySelectorAll('.js-clip')
  
  if (clips) {
    for (let i = 0; i < clips.length; i++) {
      let clip = clips[i]
      
      const firstClipId = clip.getAttribute('data-clip-id')
      const eventId = clip.getAttribute('data-event-id')
      new Vue({
        render: h => h(Clip, { props: { 
          firstClipId: firstClipId,
          eventId: eventId
        } })
      }).$mount('.js-clip')
    }
  }
})
