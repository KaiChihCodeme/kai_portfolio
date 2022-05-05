<template>
  <section id="projects">
    <AnimateOnVisible name="fadeDown" :duration="1">
		<Title
		class="title"
		:title="content.metadata.title"
		:description="content.metadata.description"
		/>
    </AnimateOnVisible>

    <div class="container-fluid center-block">
      <article class="content text-center">
    
		<AnimateOnVisible class="timeline mx-auto" v-for="(post, index) in content.metadata.items" :key="index" name="fadeLeft" :duration="0.5">
			<vue-timeline-update
        :date="new Date(post.date)"
        :title="post.title"
        :description="post.content"
        :thumbnail="getImgUrl(post.image)"
        :color="post.color"
        :category="post.tag"
        icon="code"
      />
      <div v-if="index==6"><h3>Sporden AWS architecture</h3><img class="projects-photo" :src="getImgUrl('sporden_aws.png')" alt="photo"></div>
      <!-- <div>hello {{index}}</div> -->
		</AnimateOnVisible>
      </article>
    </div>

    <!-- <div class="photos">
      <VueSlickCarousel :arrows="true" :dots="true" :centerMode="true" :edgeFriction=0.35 :fade="true" :infinite="true" :autoplay="true" :autoplaySpeed=3000>
        <img :src="getImgUrl('Google.png')" alt="photo"/>
        <img :src="getImgUrl('UOT.png')" alt="photo"/>
        <img :src="getImgUrl('Softmobile.png')" alt="photo"/>
        <img :src="getImgUrl('logo.png')" alt="photo"/>
      </VueSlickCarousel>
    </div> -->


  </section>
</template>

<script>
import Title from "./Title.vue";
// import VueSlickCarousel from 'vue-slick-carousel';
// import 'vue-slick-carousel/dist/vue-slick-carousel.css'
// import 'vue-slick-carousel/dist/vue-slick-carousel-theme.css'

export default {
  name: "Projects",
  props: ['content'],
  components: {
    Title,
    // VueSlickCarousel,
  },
  methods: {
    getImgUrl(img) {
      if(img == undefined || img == "")
        return ""
      return require('../assets/img/projects/'+img)
      // return require('../assets/img/'+img)
    },
  },
};
</script>

<style scoped lang="scss">
@import "@/styles/constants.scss";

$linear: map-get($colors, dark);

#projects {
  background-color: lighten(map-get($colors, primary), 5%);

}

.title {
  color: map-get($colors, light);
}

/deep/ .text-wrapper {
  &:after {
    border-bottom: 1px solid map-get($colors, dark);
  }
}

article .inner {
    position: relative;
    display: inline-block;
    vertical-align: middle;
    z-index: 1;
}

.content {
    color: map-get($colors, light);
    margin-top: 30px;
    header {
        height: 100%;
        width: 70%;
    }
    h1{
        font-size: 3rem;
    }
}

.vertical-center {
    display: flex;
    align-items: center;
}

h1 {
    margin-top: 10px;
    margin-bottom: 20px;
}

img {
    width: 250px;
    height: 320px;
    border-radius: 40%;
    display: inline-block;
}

.photos {
  text-align: center;
  margin-left: auto;
  margin-right: auto;
  width: 20%;
  display: block;
  background-color: white;
}

.projects-photo {
  width: 1300px;
  height: auto;
  display: block;
  text-align: center;
  margin-left: auto;
  margin-right: auto;
  border-radius: 0%;
}
</style>
