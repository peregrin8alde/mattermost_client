<template>
  <div class="hello">
    <h1>hello</h1>
    <form>
      <input v-model="url">
      <input v-model="username">
      <input v-model="password">
      <button type="button" @click="getToken">get Token</button>
    </form>
  </div>
</template>

<script>
require('babel-polyfill');
require('isomorphic-fetch');
const Client4 = require('../lib/client4.js').default;
const client = new Client4;
var token;

export default {
  name: 'HelloWorld',
  props: {
    msg: String
  },
  data: function () {
    return {
      url: '',
      username: '',
      password: ''
    }
  },
  methods: {
    getToken: function () {
      client.setUrl(this.url)
      client.login(this.username, this.password)
      .then(function(me){
          console.log(`logged in as ${me.email}`)
          token = client.getToken()
      })
      .catch(function(err){
          console.error(err);
      })
      
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h3 {
  margin: 40px 0 0;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
</style>
