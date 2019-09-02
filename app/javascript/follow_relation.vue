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
  methods: {
    token () {
      const meta = document.querySelector('meta[name="csrf-token"]')
      return meta ? meta.getAttribute('content') : ''
    },
    push () {
      if (this.relationId) {
        this.unfollow()
        M.toast({html: 'フォロー解除しました'})
      } else {
        this.follow()
        M.toast({html: 'フォローしました'})
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
