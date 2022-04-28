<template>
  <div>
    <div class="photo">
        <a>
            <img :src="getImgUrl(posts.photo)" alt="photo"/>
        </a>
    </div>
  </div>
</template>

<script>
export default {
    name: 'ExperiencePhoto',
    props: ['posts'],
    methods: {
        getImgUrl(img) {
            return require('../assets/img/'+img);
        },
    },
}
</script>

<style scoped lang="scss">
    .photo {
        a:focus {
            outline: none;
        }
        img {
            width: 85px;
            height: 85px;
            border-radius: 50%;
            display: inline-block;
            background-color: white;
        }
    }
    img {
        max-width: 100%;
    }
</style>