<template>
  <app-header></app-header>
  <router-view #="{ Component, route }">
    <transition>
      <keep-alive>
        <component :is="Component" :key="route.path"></component>
      </keep-alive>
    </transition>
  </router-view>
</template>

<script lang="ts">
import AppHeader from '@/components/AppHeader.vue';
import TheCharsPage from '@/pages/TheCharsPage.vue';

export default {
  components: { TheCharsPage, AppHeader },
};
</script>
<style lang='scss'>
.v-enter-active {
  transition: all 0.5s ease;
}
.v-enter-from {
  opacity: 0;
}
</style>
