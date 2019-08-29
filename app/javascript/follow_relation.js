import Vue from 'vue'
import FollowRelation from './follow_relation.vue'

document.addEventListener('DOMContentLoaded', () => {
  const followRelations = document.querySelectorAll('.js-follow-relation')
  
  if (followRelations) {
    for (let i = 0; i < followRelations.length; i++) {
      let followRelation = followRelations[i]
      
      const followRelationId = followRelation.getAttribute('data-follow-relation-id')
      const followedId = followRelation.getAttribute('data-followed-id')
      new Vue({
        render: h => h(FollowRelation, { props: { 
          followRelationId: followRelationId,
          followedId: followedId
        } })
      }).$mount('.js-follow-relation')
    }
  }
})
