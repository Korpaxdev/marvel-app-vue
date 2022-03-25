<template>
  <div class="container random-wrapper">
    <the-random-char></the-random-char>
    <the-random-banner></the-random-banner>
  </div>
  <div class="container list-wrapper">
    <the-chars-list></the-chars-list>
    <the-char-selected></the-char-selected>
  </div>
</template>

<script>
import theRandomChar from '../components/TheRandomChar.vue';
import theRandomBanner from '../components/TheRandomBanner.vue';
import TheCharsList from '@/components/TheCharsList.vue';
import TheCharSelected from '@/components/TheSelectedLayout.vue';

export default {
  components: {
    TheCharSelected,
    TheCharsList,
    theRandomBanner,
    theRandomChar,
  },
};
</script>

<style scoped>
.random-wrapper {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  grid-template-rows: minmax(250px, 1fr);
}

.list-wrapper {
  display: grid;
  padding: 50px 0;
  grid-template-columns: 650px 425px;
  grid-auto-rows: minmax(300px, 1fr);
  gap: 25px;
}
</style>
