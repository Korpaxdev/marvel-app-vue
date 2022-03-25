<template>
  <aside ref="selectLayout">
    <app-skeleton v-if="!selectedChar"></app-skeleton>
    <transition v-else appear>
      <the-selected-char
        :char="selectedChar"
        :key="selectedChar.id"
      ></the-selected-char>
    </transition>
  </aside>
</template>

<script lang="ts">
import AppSkeleton from '@/components/AppSkeleton.vue';
import { defineComponent, onMounted, onUnmounted, ref } from 'vue';
import useCharsList from '@/stores/useCharsList';
import { storeToRefs } from 'pinia';
import TheSelectedChar from '@/components/TheSelectedChar.vue';
import fixLayout from '@/utils/fixedLayout';

export default defineComponent({
  components: { TheSelectedChar, AppSkeleton },
  setup() {
    const store = useCharsList();
    const { selectedChar } = storeToRefs(store);
    let selectLayout = ref<null | HTMLElement>(null);

    function fixedLayout() {
      const aside = selectLayout.value;
      if (aside) {
        fixLayout(aside);
      }
    }

    onMounted(() => {
      window.addEventListener('scroll', fixedLayout);
    });
    onUnmounted(() => window.removeEventListener('scroll', fixedLayout));
    return { selectedChar, selectLayout };
  },
});
</script>
<style lang="scss" scoped></style>
