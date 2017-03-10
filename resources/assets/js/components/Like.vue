<template>
    <div>
        <hr>
        <span class="text-center" v-for="like in post.likes">
            <img :src="like.user.avatar" alt="" width="30px" height="30px" class="avater-like">
        </span>
        <hr>
        <button class="btn btn-primary" v-if="!auth_user_likes_post" @click="like()">
            Like
        </button>
        <button class="btn btn-danger" v-else @click="unlike()">
            Unlike
        </button>
    </div>
</template>

<script>
    export default{
        mounted(){

        },
        props:['id'],


        computed:{
            likers(){
                var likers = []

                this.post.likes.forEach( (like) => {
                    likers.push(like.user.id)
                })

                return likers
            },

            auth_user_likes_post(){
                var check_index = this.likers.indexOf(
                    this.$store.state.auth_user.id
                )

                if(check_index === -1)
                    return false
                else
                    return true
            },
            post(){
                return this.$store.state.posts.find( (post)=>{
                    return post.id === this.id
                })
            }
        },

        methods:{
            like(){
                this.$http.get('/like/'+this.id)
                        .then( (res) =>{
                            this.$store.commit('update_post_likes',{
                                id: this.id,
                                like:res.body
                            })

                            noty({
                                type:'success',
                                layout:'bottomLeft',
                                text: 'You successfully liked the post !'
                            })
                        })
            },
            unlike(){
                this.$http.get('/unlike/'+this.id)
                    .then( (res) =>{
                        this.$store.commit('unlike_post',{
                            post_id: this.id,
                            like_id: res.body
                        })

                        noty({
                            type:'success',
                            layout:'bottomLeft',
                            text: 'You successfully unliked the post !'
                        })
                    })
            }
        }
    }
</script>

<style>
    .avater-like{
        border-radius: 50%;
    }
</style>