<template>
  <div>
    <h3 class="color-light">{{ title }}</h3>
    <AnimateOnVisible v-for="(post, index) in posts" :key="index" name="fadeUp" :duration="1">
		<div class="container-fluid">
			<div class="row">
        <ExperiencePhoto
          class="col-4 logo"
					:posts="post"
				/>

        <div class="col offset border-left pl-4 resume-item">
          <div class="year color-darker">{{ post.year }}</div>
          <div class="resume-description">
            <strong class="color-light" v-html="post.title"></strong>
          </div>
          <div class="p color-darker" v-html="post.content"></div>
        </div>

			</div>
      <br><br><br>
		</div>
	</AnimateOnVisible>
  </div>
</template>

<script>
import ExperiencePhoto from "./ExperiencePhoto.vue"

export default {
  name: "ExperienceColumn",
  props: ["posts", "title"],
  components: {
    ExperiencePhoto,
  },
};
</script>

<style scoped lang="scss">
@import "@/styles/constants.scss";

.logo{
  text-align: right;
  margin-left: 20px;
}

.resume-item {
  margin-bottom: 25px;
  .p {
    font-size: 1.2em;
    margin-top: 2px;
  }
  .resume-description {
    font-size: 2rem;
  }
  .year {
    font-weight: 600;
    margin-bottom: 5px;
    font-size: 1.5rem;
  }
}
.color-light {
  color: map-get($colors, light);
}
.color-darker {
  color: map-get($colors, dark);
}
</style>
