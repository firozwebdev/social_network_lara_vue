<template>
    <div class="container">
        <div class="row">
            <div class="col-lg-6 col-lg-offset-3">
                <input type="text" class="input-lg form-control" v-model="query" @keyup="search()" placeholder="Search">
                <br>
                <div class="row" v-if="results.length">

                    <div class="list-group"  v-for="user in results">
                        <a href="#" class="list-group-item"><img :src="user.avatar" class="img img-thumbnail" alt="" width="30px" height="30px"><span class="pull-right">{{ user.name }}</span></a>

                    </div>



                </div>
            </div>
        </div>
    </div>
</template>

<script>
    var algoliasearch = require('algoliasearch');
    var client = algoliasearch('AS0XYUG2M8', 'ff803f2e1a1613cdcc282b6230c9b2da');
    var index = client.initIndex('users');

    export default{
        mounted(){

        },

        data(){
            return {
                query:'',
                results:[]
            }
        },

        methods:{
            search(){
                index.search( this.query,(err,content) => {
                    this.results = content.hits
                })

            }
        }
    }
</script>

<style>

</style>