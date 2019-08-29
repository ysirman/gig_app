<template>
  <div class="follow-relation">
    <a class="waves-effect waves-light btn-small js-follow" :class=" relationId ? 'is-active' : 'is-inactive' " @click="push" >
    </a>
  </div>
</template>

<script>

export default {
  props: ['followRelationId', 'followedId'],
  data () {
    return {
      relationId: this.followRelationId,
      buttonLabel: "フォロー"
    }
  },
  computed: {
    defaultLabel() {
      let defaultLabel = ["フォロー","フォロー"]
      if (this.relationId) {
        defaultLabel[0] = "フォロー中"
        defaultLabel[1] = "フォロー解除"
      }
      return defaultLabel
    }
  },
  methods: {
    token () {
      const meta = document.querySelector('meta[name="csrf-token"]')
      return meta ? meta.getAttribute('content') : ''
    },
    push () {
      if (this.relationId) {
        console.log('unfollow----------')
        console.log(this.relationId)
        this.unfollow()
      } else {
        console.log('follow----------')
        console.log(this.relationId)
        this.follow()
      }
    },
    follow () {
      let params = {
        'followed_id': this.followedId
      }

      fetch(`/api/follow_relations`, {
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
          this.relationId = json['id']
        })
        .catch(error => {
          console.warn('Failed to parsing', error)
        })
    },
    unfollow () {
      fetch(`/api/follow_relations/${this.relationId}`, {
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
          this.relationId = null
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
