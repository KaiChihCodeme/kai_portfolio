<template>
    <section id="academic">
        <AnimateOnVisible name="fadeDown" :duration="1">
            <Title
              class="title"
              :title="content.metadata.title"
              :description="content.metadata.description"
            />
        </AnimateOnVisible>

        <div class="container-fluid center-block">
            <article class="content text-center">
                <AnimateOnVisible v-for="(acd, index) in content.metadata.academic" :key="index" name="fadeUp" :duration="1">
                    <img id="academic_logo" class="img-responsive mx-auto d-block" :src="getImgUrl(acd.photo)" />
                    <div class="h1">{{ acd.year }}</div>
                    <div class="title"><b>{{ acd.title }}</b></div>
                    <div class="desc"><b>{{ acd.major }}</b></div>
                    <div class="desc">{{ acd.score }}</div>
                    <br><br>
                    <div v-html="getArray(content, index)"></div>
                    <hr>
                </AnimateOnVisible>
            </article>
        </div>

    </section>
</template>

<script>
import Title from "./Title.vue";

export default {
    name: "Academic",
    props: ["content"],
    components: {
        Title
    },
    methods: {
        getImgUrl(img) {
            return require('../assets/img/'+img);
        },
        stringToHtml(str) {
            var parser = new DOMParser();
            var doc = parser.parseFromString(str, 'text/html');
            return doc.body;
        },
        getArray(content, index) {
            if(index === 1){
                return content.metadata.undergraduate
            } else {
                return content.metadata.graduate
            }
        },
    },
};
</script>

<style scoped lang="scss">
@import "@/styles/constants.scss";

$linear: map-get($colors, dark);

#academic {
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

img{
    max-width: 200px;
}

hr{
    height: 2px;
    background-color: azure;
    margin-top: 20px;
    margin-bottom: 40px;
    margin-left: 20%;
    margin-right: 20%;
}

.hor{
    height:0.5px;
    background-color: azure;
    margin-left: 50%;
    margin-right: 50%;
}

.content {
    color: map-get($colors, light);
    margin-top: 30px;
    header {
        height: 100%;
        width: 70%;
    }
    .h1{
        font-size: 2rem;
        margin-top: 10px;
    }
    .title {
        font-size: 3rem;
        margin-bottom: 10px;
    }
    .desc {
        font-size: 1.8rem;
        margin-bottom: 5px;
    }
    .cont {
        text-align: left;
        margin-left: 600px;
    }

}

</style>