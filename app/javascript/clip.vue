<template>
  <div class="col s3 xl12 clip-btn">
    <a class="btn waves-effect waves-light" :class=" clipId ? 'is-active' : 'is-inactive' " @click="push" >
    </a>
  </div>
</template>

<script>

export default {
  props: ['firstClipId', 'eventId'],
  data () {
    return {
      clipId: this.firstClipId
    }
  },
  methods: {
    token () {
      const meta = document.querySelector('meta[name="csrf-token"]')
      return meta ? meta.getAttribute('content') : ''
    },
    push () {
      if (this.clipId) {
        this.unparticipate()
        M.toast({html: 'クリップを削除しました'})
      } else {
        this.participate()
        M.toast({html: 'クリップしました'})
      }
    },
    participate () {
      let params = {
        'event_id': this.eventId
      }

      fetch(`/api/clips`, {
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
          this.clipId = json['id']
        })
        .catch(error => {
          console.warn('Failed to parsing', error)
        })
    },
    unparticipate () {
      fetch(`/api/clips/${this.clipId}`, {
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
          this.clipId = null
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
