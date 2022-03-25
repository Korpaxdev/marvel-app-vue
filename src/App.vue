<template>
  <app-header></app-header>
  <router-view #="{ Component }">
    <keep-alive>
      <component :is="Component"></component>
    </keep-alive>
  </router-view>
</template>

<script lang="ts">
import AppHeader from '@/components/AppHeader.vue';
import TheCharsPage from '@/pages/TheCharsPage.vue';

export default {
  components: { TheCharsPage, AppHeader },
};
</script>
<style></style>
