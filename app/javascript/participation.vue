<template>
  <div class="col s5 participate-btn">
    <a class="btn waves-effect waves-light" :class=" participationId ? 'is-active' : 'is-inactive' " @click="push" >
    </a>
  </div>
</template>

<script>

export default {
  props: ['firstParticipationId', 'eventId'],
  data () {
    return {
      participationId: this.firstParticipationId
    }
  },
  methods: {
    token () {
      const meta = document.querySelector('meta[name="csrf-token"]')
      return meta ? meta.getAttribute('content') : ''
    },
    push () {
      if (this.participationId) {
        this.unparticipate()
      } else {
        this.participate()
      }
    },
    participate () {
      let params = {
        'event_id': this.eventId
      }

      fetch(`/api/participations`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json; charset=utf-8',
          'X-Requested-With': 'XMLHttpRequest',
          'X-CSRF-Token': this.token()
        },
        credentials: 'same-origin',
        redirect: 'manual',
        body: JSON.stringify(params)
      })
        .then(response => {
          return response.json()
        })
        .then(json => {
          this.participationId = json['id']
        })
        .catch(error => {
          console.warn('Failed to parsing', error)
        })
    },
    unparticipate () {
      fetch(`/api/participations/${this.participationId}`, {
        method: 'DELETE',
        headers: {
          "Content-Type": "application/json; charset=utf-8",
          'X-Requested-With': 'XMLHttpRequest',
          'X-CSRF-Token': this.token()
        },
        credentials: 'same-origin',
        redirect: 'manual'
      })
        .then(response => {
          this.participationId = null
        })
        .catch(error => {
          console.warn('Failed to parsing', error)
        })
    }
  }
}
</script>

<style scoped>
</style>
